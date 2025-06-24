% 玻尔共振测定阻尼系数
% 作者：Monika
clear; clf; close all; clc;
%% --------------------- 数据读取与预处理 ---------------------
try
    % 从Excel读取数据
    data = readmatrix('data_beta.xlsx');
    fprintf('成功读取数据，维度: %d×%d\n', size(data));
    
    % 列分配验证
    % assert(size(data,2) >= 6, 'Excel文件需要至少6列数据');
    
    % 提取各阶段数据（转置为行向量）
    A1_orig = data(:,2)';   T1_orig = data(:,3)';
    A2_orig = data(:,5)';   T2_orig = data(:,6)';
    A3_orig = data(:,8)';   T3_orig = data(:,9)';
    
catch ME
    error('数据读取失败: %s', ME.message);
end

T1_mean=mean(T1_orig);
T2_mean=mean(T2_orig);
T3_mean=mean(T3_orig);
beta_1 = zeros(1,5);
beta_2 = zeros(1,5);
beta_3 = zeros(1,5);
%使用逐差法
%beta1
for i =1:5
    beta_1(i)=log((A1_orig(i))/(A1_orig(i+5)))/(5*T1_mean)
end
beta_1_mean=mean(beta_1);

%beta2
for i =1:5
    beta_2(i)=log((A2_orig(i))/(A2_orig(i+5)))/(5*T2_mean)
end
beta_2_mean=mean(beta_2);

%beta3
for i =1:5
    beta_3(i)=log((A3_orig(i))/(A3_orig(i+5)))/(5*T3_mean)
end
beta_3_mean=mean(beta_3);
beta_final=(beta_1_mean+beta_2_mean+beta_3_mean)/3

% 结果整理
result = table(beta_1,beta_1_mean, beta_2,beta_2_mean, beta_3,beta_3_mean,beta_final);

disp('最终结果:');
disp(result);
writetable(result, 'result_beta.xlsx');  