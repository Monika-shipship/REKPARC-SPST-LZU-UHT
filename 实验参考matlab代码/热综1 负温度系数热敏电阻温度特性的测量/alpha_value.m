% 热综1 负温度系数热敏电阻温度特性的测量
% 作者：Monika
clear; clf; close all; clc;
%% --------------------- 数据读取与预处理 ---------------------
try
    % 从Excel读取数据
    data = readmatrix('data_alpha.xlsx',NumHeaderLines=1);
    % 数据清洗函数（去除NaN和非有限值）NumHeaderLines=1是跳过第一行
    fprintf('成功读取数据，维度: %d×%d\n', size(data));
    
    % 列分配验证
    % assert(size(data,2) >= 6, 'Excel文件需要至少6列数据');
    
    % 提取各阶段数据（转置为行向量）
    I = data(4,:)';   t = data(2,:)';
    
  
catch ME
    error('数据读取失败: %s', ME.message);
end

%% lnRT -(1/T)拟合直线
% --------------------- 最小二乘拟合 ---------------------
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
    [k1,b1,r1,sse1] = zuixiaoercheng(I,t);
    
    fprintf('拟合结果:\n k1=%.4f, b1=%.4f (r=%.3f)\n ',...
        k1,b1,r1);
    
    
catch ME
    error('最小二乘拟合失败: %s', ME.message);
end
fprintf('转换成对数式R_T=Ae^(B/T)\n A=%.5f, B=%.4f\n ',...
        exp(b1),k1);


% 绘制拟合图像%% --------------------- 绘制图像 ---------------------


figure('Color','white','Name','Current Analysis');
% 绘制原始数据
origin_data=scatter(I, t, 'b', '+', 'DisplayName','原始数据');
set(origin_data,'LineWidth', 1.1,'SizeData',140);%设置十字粗细和大小
hold on;
% 绘制拟合直线
x_fit1 = linspace(min(I)-0.01*min(I), max(I)+0.01*max(I), 100);
y_fit1 = k1*x_fit1 + b1;
plot(x_fit1, y_fit1, 'r-', 'LineWidth',1.5, 'DisplayName','拟合直线');

hold off;
xlabel('$\ln R_T$','FontSize',12,'Interpreter','latex');      % x轴
ylabel('$1/T$','FontSize',12,'Interpreter','latex');  % y轴
title('$\ln R_T - \frac{1}{T}$','FontSize',14,'Interpreter','latex'); % 标题
legend('Location','northeast');

grid on % 背景网格
grid minor % 背景小网格
set(gca, 'FontName','Microsoft YaHei')  % 中文字体兼容


grid on;
ylim([min(t)-0.01*min(t) max(t)+0.01*max(t)]) % 突出微小波动
%% 图像美化