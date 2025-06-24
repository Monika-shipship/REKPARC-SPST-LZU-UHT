% 单相交流电路及其功率因数的改善
% 作者：Monika
clear; clf; close all; clc;
%% --------------------- 数据读取与预处理 ---------------------
try
    % 从Excel读取数据
    data = readmatrix('data_alpha.xlsx',NumHeaderLines=2);
    % 数据清洗函数（去除NaN和非有限值）NumHeaderLines=1是跳过第一行
    fprintf('成功读取数据，维度: %d×%d\n', size(data));
    
    % 列分配验证
    % assert(size(data,2) >= 6, 'Excel文件需要至少6列数据');
    
    % 提取各阶段数据（转置为行向量）
    C = data(:,1)';   U = data(:,2)';%升温期的Delta_L和温度
    P = data(:,3)';   cosphi = data(:,4)';%降温期的Delta_L和温度                                      
    I = data(:,5)';   I_L = data(:,6)';
    I_C = data(:,7)';
    
    
    
    
catch ME
    error('数据读取失败: %s', ME.message);
end


% 绘制拟合图像%% --------------------- 绘制图像 ---------------------
% 计算功率因数 (自动处理单位转换)
I_A = I / 1000; % 电流单位mA转换为A
cosphi = P ./ (U .* I_A);  % 计算实际功率因数
% 第一幅图：电流参数对比
figure('Color','white','Name','Current Analysis');
plot(C, I, 'b-o', 'LineWidth',1.5, 'DisplayName','总电流I');
hold on;
plot(C, I_L, 'r--s', 'LineWidth',1.5, 'DisplayName','电感电流I_L');
plot(C, I_C, 'g-.d', 'LineWidth',1.5, 'DisplayName','电容电流I_C');
hold off;
xlabel('补偿电容C (\muF)','FontSize',12);
ylabel('电流值 (mA)','FontSize',12);
title('电流参数随电容变化','FontSize',14);
legend('Location','northeast');
grid on;
set(gca, 'FontName','Microsoft YaHei')  % 中文字体兼容
% 第二幅图：功率因数变化
figure('Color','white','Name','Power Factor Analysis');
plot(C, cosphi, 'm-+', 'LineWidth',1.5, 'MarkerSize',10, 'MarkerFaceColor','m');
xlabel('补偿电容C (\muF)','FontSize',12);
ylabel('功率因数cosφ','FontSize',12);
title('功率因数优化曲线','FontSize',14);
grid on;
ylim([floor(min(cosphi)*20)/20 ceil(max(cosphi)*20)/20]) % 动态调整Y轴范围
% 第三幅图：有功功率稳定性
figure('Color','white','Name','Power Analysis');
yyaxis left % 双坐标轴备用
plot(C, P, 'k-+', 'LineWidth',1.5, 'MarkerSize',8);
xlabel('补偿电容C (\muF)','FontSize',12);
ylabel('有功功率P (W)','FontSize',12);
title('系统有功功率变化','FontSize',14);
grid on;
ylim([min(P)-0.1 max(P)+0.1]) % 突出微小波动
%% 图像美化
