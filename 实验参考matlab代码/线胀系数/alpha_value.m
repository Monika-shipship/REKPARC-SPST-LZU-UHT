% 线胀系数实验数据处理
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
    Delta_L1_ori = data(:,2)';   T1_ori = data(:,1)';%升温期的Delta_L和温度
    Delta_L2_ori = data(:,4)';   T2_ori = data(:,3)';%降温期的Delta_L和温度                                      
    L0_ori = data(:,6)'; 
    
    
    Delta_L1 = rmmissing(Delta_L1_ori);   T1 = rmmissing(T1_ori);%升温期的Delta_L和温度
    Delta_L2 = rmmissing(Delta_L2_ori);   T2 = rmmissing(T2_ori);%降温期的Delta_L和温度                                      
    L0 = rmmissing(L0_ori); 
    
catch ME
    error('数据读取失败: %s', ME.message);
end

%转换单位为国际标准单位
Delta_L1=10^(-6)*Delta_L1;
Delta_L2=10^(-6)*Delta_L2;
L0=10^(-2)*L0;
%计算L0
L0_aver=mean(L0);

%使用逐差法

[Delta_Delta_L1,n1,aver_DDL1]=mydeltaway(Delta_L1,T1);

[Delta_Delta_L2,n2,aver_DDL2]=mydeltaway(Delta_L2,T2);

%使用线性拟合
p1=polyfit(T1,Delta_L1,1);
p2=polyfit(T2,Delta_L2,1);

% 计算升温和降温的拟合值
y_fit1 = polyval(p1, T1);  % 升温期拟合值
y_fit2 = polyval(p2, T2);  % 降温期拟合值
% 计算 Pearson 相关系数 r
R1 = corrcoef(T1, Delta_L1);
r1 = R1(1, 2);  % 升温期相关系数
R2 = corrcoef(T2, Delta_L2);
r2 = R2(1, 2);  % 降温期相关系数
% 计算 R²（拟合优度）
R_squared1 = 1 - sum((Delta_L1 - y_fit1).^2) / sum((Delta_L1 - mean(Delta_L1)).^2);
R_squared2 = 1 - sum((Delta_L2 - y_fit2).^2) / sum((Delta_L2 - mean(Delta_L2)).^2);
% 输出结果
fprintf('以下单位都是国际标准单位(对于长度都是米)\n');
fprintf('升温期逐差法拟合结果：\n');
fprintf('斜率 = %.4e, 线胀系数alpha=%.4e\n', aver_DDL1,aver_DDL1/L0_aver);
fprintf('升温期线性拟合结果(Delta L--T):\n');
fprintf('斜率 = %.4e, 截距 = %.4e，线胀系数alpha1=斜率/L0=%.4e\n', p1(1), p1(2),p1(1)/L0_aver);
fprintf('Pearson r = %.4f, R² = %.4f\n\n', r1, R_squared1);
fprintf('降温期逐差法拟合结果：\n');
fprintf('斜率 = %.4e, 线胀系数alpha=%.4e\n', aver_DDL2,aver_DDL2/L0_aver);
fprintf('降温期线性拟合结果(Delta L--T):\n');
fprintf('斜率 = %.4e, 截距 = %.4e，线胀系数alpha2=斜率/L0=%.4e\n', p2(1), p2(2),p2(1)/L0_aver);
fprintf('Pearson r = %.4f, R² = %.4f\n\n', r2, R_squared2);

%计算不确定度
%L0不确定度
UA_L0=1.11*std(L0)/sqrt(numel(L0));
UB_L0=0.01*10^(-2)/sqrt(3);
U_L0=sqrt(UA_L0^2+UB_L0^2);
fprintf('不确定度计算结果:\n');

fprintf('U_A(L0) = %.4e, U_B(L0) = %.4e, U_(L0) = %.4e\n', UA_L0, UB_L0,U_L0);

%斜率不确定度
%使用逐差法所得
fprintf('\n逐差法所得不确定度：\n');
%升温期
UA_DDL1=1*std(Delta_Delta_L1)/sqrt(numel(Delta_Delta_L1));
UB_DDL1=0.01*aver_DDL1;%DDL指Delta_Delta_L
U_DDL1=sqrt(UA_DDL1^2+UB_DDL1^2);
alphaDDL1=aver_DDL1/L0_aver;%使用逐差法求出的线胀系数alpha
U_alphaDDL1=alphaDDL1*sqrt((U_DDL1/aver_DDL1)^2+(U_L0/L0_aver)^2);


%降温期
UA_DDL2=1*std(Delta_Delta_L2)/sqrt(numel(Delta_Delta_L2));
UB_DDL2=0.01*0.01*aver_DDL2;%DDL指Delta_Delta_L
U_DDL2=sqrt(UA_DDL2^2+UB_DDL2^2);
alphaDDL2=aver_DDL2/L0_aver;%使用逐差法求出的线胀系数alpha
U_alphaDDL2=alphaDDL2*sqrt((U_DDL2/aver_DDL2)^2+(U_L0/L0_aver)^2);

fprintf('\n逐差法所得不确定度：\n');
fprintf('在升温期：\n');
fprintf('U_A(k1) = %.4e, U_B(k1) = %.4e, U_(alpha1) = %.4e\n', UA_DDL1, UB_DDL1,U_alphaDDL1);
fprintf('在降温期：\n');
fprintf('U_A(k2) = %.4e, U_B(k2) = %.4e, U_(alpha2) = %.4e\n', UA_DDL2, UB_DDL2,U_alphaDDL2);


%使用线性拟合所得：
UA_p1=1*p1(1)*sqrt(((R_squared1)^(-2)-1)/(numel(T1)-2));
UB_p1=0.01*p1(1);
U_p1=sqrt(UA_p1^2+UB_p1^2);
alpha1=p1(1)/L0_aver;%使用线性拟合求出的线胀系数alpha
U_alpha1=alpha1*sqrt((U_p1/p1(1))^2+(U_L0/L0_aver)^2);

UA_p2=1*p2(1)*sqrt(((R_squared2)^(-2)-1)/(numel(T2)-2));
UB_p2=0.01*p2(1);
U_p2=sqrt(UA_p2^2+UB_p2^2);
alpha2=p2(1)/L0_aver;
U_alpha2=alpha2*sqrt((U_p2/p2(1))^2+(U_L0/L0_aver)^2);
fprintf('\n线性拟合所得不确定度：\n');
fprintf('在升温期：\n');
fprintf('U_A(k1) = %.4e, U_B(k1) = %.4e, U_(alpha1) = %.4e\n', UA_p1, UB_p1,U_alpha1);
fprintf('在降温期：\n');
fprintf('U_A(k2) = %.4e, U_B(k2) = %.4e, U_(alpha2) = %.4e\n\n', UA_p2, UB_p2,U_alpha2);
fprintf('逐差法的详细计算过程：（Delta L_i+n- Delta L_i的值，其中n在升温时为32，降温时为25）\n');
fprintf('升温期：\n');
disp(Delta_Delta_L1);
fprintf('\n降温期：\n');
disp(Delta_Delta_L2);

% 绘制升温期拟合图像
figure('Color', 'white', 'Position', [100 100 800 600], 'Name', '升温和降温期线性拟合对比');

hold on;
plot(T1, y_fit1, 'r-', 'LineWidth', 2, 'DisplayName', sprintf('拟合直线 (R²=%.4f)', R_squared1));
plot(T1, Delta_L1, 'bo', 'MarkerSize', 8, 'DisplayName', '升温数据点');
xlabel('温度 (℃)');
ylabel('ΔL (m)');

legend('Location', 'best');
grid on;

grid minor % 背景小网格
set(gca, 'FontSize', 12);  % 设置字体大小
% 绘制降温期拟合图像


hold on;
plot(T2, y_fit2, 'm-', 'LineWidth', 2, 'DisplayName', sprintf('拟合直线 (R²=%.4f)', R_squared2));
plot(T2, Delta_L2, 'r+', 'MarkerSize', 8, 'DisplayName', '降温数据点');
xlabel('温度 (℃)');
ylabel('ΔL (m)');

legend('Location', 'best');
grid on;
set(gca, 'FontSize', 12);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);


% 结果整理
%result = cell(p1,p2,aver_DDL1,aver_DDL2);

%disp('最终结果:');
%disp(result);
%writecell(result, 'result_alpha.xlsx');  


%自动逐差法函数
function [Delta_Delta_L,n,average_Delta_Delta_L]= mydeltaway(Delta_L,T)
    m=numel(Delta_L);
    if(mod(m,2)==0)
        n = m/2;
    else 
        n = (m-1)/2;
    end
    Delta_Delta_L = zeros(1,n);
    for i =1:n
    Delta_Delta_L(i)=abs((Delta_L(i+n)-Delta_L(i))/(n));
    end
    average_Delta_Delta_L=mean(Delta_Delta_L);
end