% 熔解热实验数据处理完整解决方案
% 初始作者：Tlsolving047
% 优化：Deepseek(Monika)
% 修复了以下问题：
% 1. 改变了数据导入方式
% 2. 样条插值端点斜率为NaN(如果过渡段有斜率为0的段，原方案无法解决)
% 3. 数据验证和异常处理机制

clear; clf; close all; clc;

%% --------------------- 数据读取与预处理 ---------------------
try
    % 从Excel读取数据
    data = readmatrix('data.xlsx');
    fprintf('成功读取数据，维度: %d×%d\n', size(data));
    
    % 列分配验证
    assert(size(data,2) >= 6, 'Excel文件需要至少6列数据');
    
    % 提取各阶段数据（转置为行向量）
    t1_orig = data(:,1)';   T1_orig = data(:,2)';
    t2_orig = data(:,3)';   T2_orig = data(:,4)';
    t3_orig = data(:,5)';   T3_orig = data(:,6)';
    
catch ME
    error('数据读取失败: %s', ME.message);
end

% 数据清洗函数（去除NaN和非有限值）
clean_data = @(x,y) deal(...
    x(isfinite(x) & isfinite(y)),...
    y(isfinite(x) & isfinite(y)));

% 清洗各阶段数据
[t1, T1] = clean_data(t1_orig, T1_orig);
[t2, T2] = clean_data(t2_orig, T2_orig);
[t3, T3] = clean_data(t3_orig, T3_orig);

% 验证数据有效性
assert(numel(t1)>=2, '第一阶段数据不足');
assert(numel(t3)>=2, '第三阶段数据不足');
fprintf('数据清洗后:\n t1:%d点, t2:%d点, t3:%d点\n',...
    numel(t1), numel(t2), numel(t3));

%% --------------------- 阶段边界计算 ---------------------
ta = max(t1);
tb = min(t3);
fprintf('阶段边界: ta=%.1f, tb=%.1f\n', ta, tb);
assert(ta < tb, '阶段边界异常: ta(%.1f) ≥ tb(%.1f)', ta, tb);

%% --------------------- 过渡段处理 ---------------------
% 筛选过渡段数据
valid_idx = (t2 >= ta) & (t2 <= tb);
t21 = t2(valid_idx);
T21 = T2(valid_idx);

% 验证过渡段数据
assert(~isempty(t21), '过渡段数据为空，请检查t2数据');
fprintf('过渡段数据点数: %d\n', numel(t21));

%% --------------------- 最小二乘拟合 ---------------------
% 定义增强版最小二乘函数
function [k,b,r,sse] = zuixiaoercheng(x,y)
    % 输入验证
    assert(numel(x)>=2, '需要至少2个数据点');
    assert(numel(x)==numel(y), 'x,y长度不一致');
     
    % 转换为列向量并去除无效数据
    x = x(:); y = y(:);
    valid = isfinite(x) & isfinite(y);
    x = x(valid); y = y(valid);
    assert(numel(x)>=2, '有效数据不足');
    
    % 核心参数
    n = numel(x);
    x_bar = mean(x);
    y_bar = mean(y);
    
    % 分子分母计算
    numerator = sum(x.*y) - n*x_bar*y_bar;
    denominator = sum(x.^2) - n*x_bar^2;
    
    % 处理分母接近零的情况
    if abs(denominator) < 1e-10
        warning('数据近似水平，使用端点斜率');
        if x(end) == x(1)
            k = 0; % 完全垂直时设为0
        else
            k = (y(end)-y(1))/(x(end)-x(1));
        end
    else
        k = numerator / denominator;
    end
    
    % 截距计算
    b = y_bar - k*x_bar;
    
    % 预测值和误差
    y_pred = k*x + b;
    sse = sum((y - y_pred).^2);
    
    % 相关系数
    cov_xy = numerator;
    std_x = sqrt(denominator);
    std_y = sqrt(sum(y.^2) - n*y_bar^2);
    r = cov_xy / (std_x * std_y);
end

% 执行拟合并验证结果
try
    [k1,b1,r1,sse1] = zuixiaoercheng(t1,T1);
    [k3,b3,r3,sse3] = zuixiaoercheng(t3,T3);
    fprintf('拟合结果:\n k1=%.4f, b1=%.2f (r=%.3f)\n k3=%.4f, b3=%.2f (r=%.3f)\n',...
        k1,b1,r1,k3,b3,r3);
    
    % 斜率验证
    validateattributes([k1,k3], {'numeric'}, {'finite','nonnan'}, '', '阶段斜率');
catch ME
    error('最小二乘拟合失败: %s', ME.message);
end

%% --------------------- 样条插值构造 ---------------------
% 构造插值节点
t211 = [ta, t21, tb];
T211 = [ta*k1 + b1, T21, tb*k3 + b3];

% 节点排序验证
[~, sort_idx] = sort(t211);
t211 = t211(sort_idx);
T211 = T211(sort_idx);

% 样条插值（带故障转移）
try
    pp = spline(t211, [k1, T211, k3]); % 端点斜率模式
    fprintf('样条插值成功，使用端点斜率模式\n');
catch
    warning('默认样条失败，启用自然样条');
    pp = csape(t211, T211, 'variational'); % 自然边界条件
end

%% --------------------- 可视化 ---------------------

figure('Name','熔解热曲线分析','NumberTitle','off');
hold on;


% 绘制原始数据
origin_data=scatter(t1, T1, 'b', '+', 'DisplayName','原始数据');
origin_data2=scatter(t3, T3, 'b', '+', 'HandleVisibility', 'off');
origin_data3=scatter(t21, T21, 'b', '+', 'HandleVisibility', 'off');
set([origin_data origin_data2 origin_data3],'LineWidth', 1.1,'SizeData',140);%设置十字粗细和大小

% 绘制拟合直线
x_fit1 = linspace(min(t1), max(t1), 100);
y_fit1 = k1*x_fit1 + b1;
plot(x_fit1, y_fit1, 'r-', 'LineWidth',1.5, 'DisplayName','阶段1拟合');

x_fit3 = linspace(min(t3), max(t3), 100);
y_fit3 = k3*x_fit3 + b3;
plot(x_fit3, y_fit3, 'r-', 'LineWidth',1.5, 'DisplayName','阶段3拟合');

% 绘制样条曲线
t20 = linspace(ta, tb, 500);
T22 = ppval(pp, t20);
plot(t20, T22, 'r-', 'LineWidth',2, 'DisplayName','过渡段样条');

% 图形标注
axis([50 1080 22 40]);% 坐标范围axis([xmin xmax ymin ymax])
grid on % 背景网格
grid minor % 背景小网格
set(gca,'Xtick',0:30:1080)% x轴刻度
set(gca,'Ytick',22:1:40)% y轴刻度
xlabel('时间 t (s)');
ylabel('温度 T (°C)');
title('熔解热实验曲线分析');


%% --------------------- 面积平衡计算 ---------------------
% （此处保持原有面积计算逻辑，添加数值稳定性处理）

% 初始参数设置
format long;
deltat = 0.001;   % 积分步长
deltatx = 10;     % 初始搜索步长
txleft = ta;
txright = tb;
iter_count = 0;
max_iter = 100;   % 防止无限循环

% 优化后的面积差计算循环
while deltatx > 1e-4 && iter_count < max_iter
    % 生成候选tx值
    tx_candidates = txleft:deltatx:txright;
    n = numel(tx_candidates);
    
    % 预分配内存
    deltaA = zeros(n,1);
    
    % 并行计算面积差
    for i = 1:n
        tx = tx_candidates(i);
        
        % 计算左区域
        x_left = ta:deltat:tx;
        if isempty(x_left)
            y_left = [];
        else
            y_left = ppval(pp, x_left);
        end
        
        % 计算右区域
        x_right = tx:deltat:tb;
        if isempty(x_right)
            y_right = [];
        else
            y_right = ppval(pp, x_right);
        end
        
        % 面积计算（带空值处理）
        A1 = safe_polyarea(x_left, y_left, tx, k1, b1);
        A2 = safe_polyarea(x_right, y_right, tx, k3, b3);
        deltaA(i) = A2 - A1;
    end
    
    % 寻找最优解
    [min_val, idx] = min(abs(deltaA));
    tx0 = tx_candidates(idx);
    
    % 更新搜索范围
    txleft = max(ta, tx0 - deltatx);
    txright = min(tb, tx0 + deltatx);
    deltatx = deltatx / 10;
    iter_count = iter_count + 1;
    
    fprintf('迭代 %d: tx=%.4f, ΔA=%.4f\n', iter_count, tx0, min_val);
end

% 最终结果验证
assert(isfinite(tx0), '面积平衡计算失败');
fprintf('最终平衡点: tx=%.5f\n', tx0);

%% --------------------- 辅助函数 ---------------------



function area = safe_polyarea(x, y, tx, k, b)
    % 安全的多边形面积计算
    if numel(x) < 2
        area = 0;
        return
    end
    
    % 构造闭合多边形
    x_poly = [x, tx, tx];
    y_poly = [y, tx*k + b, y(1)];
    
    % 去除无效点
    valid = isfinite(x_poly) & isfinite(y_poly);
    x_poly = x_poly(valid);
    y_poly = y_poly(valid);
    
    if numel(x_poly) < 3
        area = 0;
    else
        area = polyarea(x_poly, y_poly);
    end
end

%% --------------------- 物性计算 ---------------------
% （此处保持原有物理参数计算，添加单位转换验证）

% 物理参数
theta = 25.8; % 室温 (°C)
c_water = 4.18;      % 水比热容 [J/(g·K)]
c_container = 0.389; % 容器(铜)比热容 [J/(g·K)]
c_stirrer = 0.88;    % 搅拌器(铝)比热容 [J/(g·K)]
c_ice = 1.80;        % 冰比热容 [J/(g·K)]

m_water = 159.26;      % 水质量 [g]
m_container = 122.850; % 容器质量 [g]
m_stirrer = 11.675;    % 搅拌器质量 [g]
m_ice = 24.534;        % 冰质量 [g]

% 温度参数
T_0 = 0;    % 冰的熔点 (°C)
T_1 = -4;   % 冰的初始温度 (°C)
T_2 = k1*ta + b1;
T_3 = k3*tb + b3;

% 修正温度
T_2fix = tx0*k1 + b1;
T_3fix = tx0*k3 + b3;

% 熔解热计算
L_origin = c_ice*(T_1 - T_0) - ...
    (c_water*m_ice*(T_3 - T_0) + ...
    (c_water*m_water + c_container*m_container + c_stirrer*m_stirrer)*(T_3 - T_2)) / m_ice;

L_fix = c_ice*(T_1 - T_0) - ...
    (c_water*m_ice*(T_3fix - T_0) + ...
    (c_water*m_water + c_container*m_container + c_stirrer*m_stirrer)*(T_3fix - T_2fix)) / m_ice;
%辅助线


ftheta=plot([30 1280],theta.*[1 1],'k--','DisplayName','室温');
f11=plot(ta*[1 1],[T_2,theta],'k-.');
f41=plot(tb*[1 1],[theta,13.8],'k-.');
fleft=plot([ta,tx0],[ta,tx0].*k1+b1,'r-.');
fright=plot([tx0,tb],[tx0,tb].*k3+b3,'r-.');
fx=plot(tx0*[1 1],[T_2fix,T_3fix],'r--','DisplayName','修正温度');


% 显式指定图例要包含的句柄（无需操作 Annotation）
legend([ftheta, fx,origin_data], 'Location', 'northeast');


% 标注S1-S5,坐标需要手动确定
text(410.561,36.946,'S1');
text(429.038,26.210,'S2');
text(472.777,24.898,'S3');
text(403.628,27.888,'S4');
text(433.737,23.465,'S5');
% 此处应分节

% 结果整理
result = table(...
    T_3, T_2, T_3fix, T_2fix, tx0, L_origin, L_fix,...
    'VariableNames',...
    {'T_3', 'T_2', 'T_3fix', 'T_2fix', 'tx0', 'L_origin', 'L_fix'});

disp('最终结果:');
disp(result);
writetable(result, 'result.xlsx');           % 为字符串添加引号