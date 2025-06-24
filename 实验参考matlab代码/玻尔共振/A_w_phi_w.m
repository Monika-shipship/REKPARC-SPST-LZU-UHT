% 玻尔共振绘图受迫震振动A-w/w0图和phi-w/w0图
% 作者：Monika
clear; clf; close all; clc;
%% --------------------- 数据读取与预处理 ---------------------
try
    % 从Excel读取数据
    data = readmatrix('data_A-w&phi-w.xlsx',NumHeaderLines=2);
    % 数据清洗函数（去除NaN和非有限值）NumHeaderLines=1是跳过第一行
    

    fprintf('成功读取数据，维度: %d×%d\n', size(data));
    
    % 列分配验证
    % assert(size(data,2) >= 6, 'Excel文件需要至少6列数据');
    
    % 提取各阶段数据（转置为行向量）
    A_orig = data(:,3)';   x_orig = data(:,7)';%x=w/w0=T0/T
    phi_orig = data(:,5)';   
      
    % 数据清洗：去除NaN和非有限值
    valid_idx = isfinite(A_orig) & isfinite(x_orig) & isfinite(phi_orig);
    A = A_orig(valid_idx);
    x = x_orig(valid_idx);
    phi = phi_orig(valid_idx);
    
    % 按x值排序数据（避免插值混乱）
    [x_sorted, sort_idx] = sort(x);
    A_sorted = A(sort_idx);
    phi_sorted = phi(sort_idx);


catch ME
    error('数据读取失败: %s', ME.message);
end



%% --------------------- 生成平滑曲线 ---------------------
% 生成密集插值点
x_fine = linspace(min(x_sorted), max(x_sorted), 1000);
% 使用样条插值（可根据需要改为 'pchip'）
A_fine = interp1(x_sorted, A_sorted, x_fine, 'spline');
phi_fine = interp1(x_sorted, phi_sorted, x_fine, 'spline');
%% --------------------- 绘制双图 ---------------------
figure('Color', 'white', 'Position', [100 100 800 600]);
% A-x 曲线



subplot(2,1,1);
plot(x_fine, A_fine, 'b-', 'LineWidth', 2);
hold on;
plot(x_sorted, A_sorted, 'r+',  'MarkerSize', 15,'LineWidth', 1);
grid on % 背景网格
grid minor % 背景小网格
xlabel('$x = \omega/\omega_0$', 'Interpreter', 'latex');
ylabel('Amplitude $A$', 'Interpreter', 'latex');
title('振幅比随频率比变化曲线');
legend('原始数据', '平滑曲线', 'Location', 'best');


% Phi-x 曲线
subplot(2,1,2);
plot(x_fine, phi_fine, 'b-', 'LineWidth', 2);
hold on;
plot(x_sorted, phi_sorted, 'r+',  'MarkerSize', 15,'LineWidth', 1);
grid on % 背景网格
grid minor % 背景小网格
xlabel('$x = \omega/\omega_0$', 'Interpreter', 'latex');
ylabel('Phase $\phi$ (degree)', 'Interpreter', 'latex');
title('相位差随频率比变化曲线');
legend('原始数据', '平滑曲线', 'Location', 'best');
% 自动调整子图间距
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);