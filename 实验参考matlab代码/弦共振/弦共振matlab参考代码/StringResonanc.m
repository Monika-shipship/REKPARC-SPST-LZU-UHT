% 弦共振实验数据处理完整解决方案
% 作者：Deepseek(Monika) (在Tlsolving047的溶解热代码基础上修改得到)
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
    assert(size(data,2) >= 5, 'Excel文件需要至少5列数据');
    lenthofdata=size(data,1);
    % 提取各阶段数据（转置为行向量）
    l_N = data(2:size(data,1),2)';   T = data(2:size(data,1),3)'; %驻波长和张力
    L = data(1,5);   f = data(2,5); %弦长和频率
    g=9.8;
    l_N=l_N * 0.01;%改变单位
    T=T * g;
    lnT=log(T);
    lnl_N=log(l_N);
catch ME
    error('数据读取失败: %s', ME.message);
end


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
    [k1,b1,r1,sse1] = zuixiaoercheng(lnT,lnl_N);

    fprintf('拟合结果:\n k1=%.4f, b1=%.2f (r=%.3f)\n',...
        k1,b1,r1);
    
    % 斜率验证
    validateattributes([k1], {'numeric'}, {'finite','nonnan'}, '', '阶段斜率');
catch ME
    error('最小二乘拟合失败: %s', ME.message);
end


%% --------------------- 可视化 ---------------------

figure('Name','弦共振曲线分析','NumberTitle','off');
hold on;


% 绘制原始数据
origin_data=scatter(lnT, lnl_N, 'b', '+', 'DisplayName','原始数据');

set([origin_data],'LineWidth', 1.1,'SizeData',140);%设置十字粗细和大小

% 绘制拟合直线
x_fit1 = linspace(min(lnT)-0.5, max(lnT)+0.5, 100);
y_fit1 = k1*x_fit1 + b1;
plot(x_fit1, y_fit1, 'r-', 'LineWidth',1.5, 'DisplayName','直线拟合');


% 图形标注6
axis([-1.5 0.5 -2.2 -0.9]);% 坐标范围axis([xmin xmax ymin ymax])
grid on % 背景网格
grid minor % 背景小网格
set(gca,'Xtick',-1.4:0.075:0.4)% x轴刻度
set(gca,'Ytick',-2.1:0.055:-1)% y轴刻度
xlabel('LnT');
ylabel('$\ln \frac{L}{n}$', 'Interpreter', 'latex', 'FontSize', 20);
title('弦共振曲线分析');

% 结果整理
result = table(...
    k1, b1, r1,...
    'VariableNames',...
    {'k1', 'b1', 'r1'});

disp('最终结果:');
disp(result);
writetable(result, 'result.xlsx');           % 为字符串添加引号