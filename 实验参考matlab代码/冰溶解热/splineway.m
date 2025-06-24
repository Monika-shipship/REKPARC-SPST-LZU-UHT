clear;clf;clc;
%------------- 数据输入修改部分 ---------------
%% 从data.xlsx读取数据
data = readmatrix('data.xlsx');

% 原始数据列分配（假设Excel按以下顺序排列列）
% 列1: t1 列2: T1 | 列3: t2 列4: T2 | 列5: t3 列6: T3
t1 = data(:,1)';   T1 = data(:,2)';
t2 = data(:,3)'; T2 = data(:,4)';
t3 = data(:,5)';   T3 = data(:,6)';

%% 处理异常数据点 (自动过滤)
% 自动排除t2中首尾异常点 (代替原代码手动删除650)
%valid_mask = (t2_orig > 650) & (t2_orig <= 960);
%t2 = t2_orig(valid_mask);
%T2 = T2_orig(valid_mask);

%% 生成修正数据 (原代码的t21处理)
% 自动识别过渡段边界
ta = max(t1);  % 380
tb = min(t3);  % 515

% 创建调整后的t21数据集 (原代码手工输入部分)
t21 = t2(t2 >= ta & t2 <= tb);
T21 = T2(t2 >= ta & t2 <= tb);

%------------- 以下为原始代码核心部分 ---------------
% ... [完全保持原有代码结构，仅修改数据输入方式] ...
%-------------step1---------------
% 对第一段和第三段做最小二乘法并画图
[k1,b1,r1,sse1]=zuixiaoercheng(t1,T1);
[k3,b3,r3,sse3]=zuixiaoercheng(t3,T3);
figure(1);
f1=plot(t1,k1*t1+b1,'r-',t1,T1,'b+');
hold on % 在同一画布上继续做图
f3=plot(t3,k3*t3+b3,'r-',t3,T3,'b+');
% 对第二阶段的曲线进行拟合
% x0=t211,y0=T211,x1=t20,y1=T22
ta = max(t1);tb = min(t3);t211=[ta t21 tb];% 第二阶段以及其两端（边界）ta和tb
T211=[ta*k1+b1 T21 tb*k3+b3];% t211对应的温度
t20=ta:0.01:tb;% x1
% spline法
pp=spline(t211,[k1,T211,k3]);%拟合函数=spline(x0,[左边界斜率,y0,右边界斜率]);
T22=ppval(pp,t20);%y1=ppval(拟合函数,x1);
% T22=spline(t211,[k1,T211,k3],t20); %若不需要拟合函数可以这样写
% 作出第二阶段的拟合曲线，标出原始数据
f2=plot(t20,T22,'r-',t21,T21,'b+',650,27.5,'b+');
% 美化图表,需要人工确定各种参数
axis([-10 1740 12 35]); % 坐标范围axis([xmin xmax ymin ymax])
grid on % 背景网格
grid minor % 背景小网格
set(gca,'Xtick',0:60:1740)% x轴刻度
set(gca,'Ytick',12:1:35)% y轴刻度
xlabel('时间t(s)');%x轴标题
ylabel('温度T(^{\circ}C)');%y轴标题(^{\circ}C)是摄氏度
title('熔解热曲线');
%-------------step2---------------
% 初始变量设定
format long; % 设定数据显示方式为long型，显示的小数位数更多
ii=1;% 循环变量
deltat=0.01;% 面积精度
deltatx=10;% 用来找tx,先设定为10
txleft=ta;txright=tb;n=ceil((txright-txleft)/deltatx)+1;
% 循环结果为记录在数组A中，A的第一列为tx值，第二列为对应的deltaA
A(:,1)=txleft:deltatx:txright;
A(:,2)=zeros(n,1);% 设置为全0数组相当于初始化，提升运行速度
while(deltatx>1e-4)% 小数点后太多位数没用，拟合曲线与实际曲线的误差远比这点位数大
for tx=txleft:deltatx:txright
% 使用求得的pp()函数确定A1和A2的形状
A1x=ta:deltat:tx; A1y=ppval(pp,A1x);
A2x=tx:deltat:tb; A2y=ppval(pp,A2x);
% 使用polyarea()计算A1和A2
A1 = polyarea([A1x tx],[A1y tx*k1+b1]);
A2 = polyarea([A2x tx],[A2y tx*k3+b3]);
A(ii,2)=A2-A1;
ii=ii+1;
end
% 找到abs(deltaA)最小的位置，确定下一次循环的参数
% deltatx除以10后，以tx0加减deltatx作为下一次的范围，直接分成20份
[~,i0]=min(abs(A(:,2)));tx0=A(i0,1);deltaA=A(i0,2);
txleft=tx0-deltatx;txright=tx0+deltatx;
deltatx=deltatx/10;n=21;
clear A
A(:,1)=txleft:deltatx:txright;A(:,2)=zeros(n,1);
ii=1;
end
% tx0,deltaA
%-------------step3---------------
%计算修正后的面积差deltaAfix，不要求
theta=24.5;%室温
A1fix=polyarea([ta ta tx0 tx0],[ta*k1+b1 theta theta tx0*k1+b1]);% S1+S4
A2fix=polyarea([tx0 tx0 tb tb],[theta tx0*k3+b3 tb*k3+b3 theta]);% S3+S5
deltaAfix=A2fix-A1fix;
c_water=4.18;c_container=0.389;c_ice=1.80;% 比热容(J/(g*K))
m_water=147.370;m_container=139.43;m_ice=34.935;%质量(g)
T_0=0;T_1=-4;T_2=k1*ta+b1;T_3=k3*tb+b3;% 书中的T0,T1,T2和T3
T_2fix=tx0*k1+b1;T_3fix=tx0*k3+b3;% 修正后的T2和T3
Lorigin=c_ice*(T_1-T_0)-(c_water*m_ice*(T_3-T_0)+ ...
(c_water*m_water+c_container*m_container)*(T_3-T_2))/m_ice;% 原始熔解热
Lfix=c_ice*(T_1-T_0)-(c_water*m_ice*(T_3fix-T_0)+ ...
(c_water*m_water+c_container*m_container)*(T_3fix-T_2fix))/m_ice;% 修正熔解热
% K=Lfixed*m_ice/deltaAfix % 系数K,不要求
% 整理结果，根据需求增减
result=[k1,b1,k3,b3,tx0,deltaA,deltaAfix,T_2,T_3,T_2fix,T_3fix,Lorigin,Lfix];
%辅助线
ftheta=plot([-10 1750],theta.*[1 1],'k--');
f11=plot(ta*[1 1],[T_2,theta],'k--');
f41=plot(tb*[1 1],[theta,13.8],'k--');
fleft=plot([ta,tx0],[ta,tx0].*k1+b1,'r--');
fright=plot([tx0,tb],[tx0,tb].*k3+b3,'r--');
fx=plot(tx0*[1 1],[T_2fix,T_3fix],'r--');
% 标注S1-S5,坐标需要手动确定
text(670,30,'S1');
text(690,23.5,'S2');
text(780,15,'S3');
text(645,26,'S4');
text(900,20,'S5');
% 此处应分节



function [k,b,r,sse] = zuixiaoercheng(x,y)
% 数据验证
assert(numel(x)>=2, '至少需要2个数据点');
assert(~all(diff(x)==0), 'x值不能全相同');
if numel(x) ~= numel(y)
    error('x和y的元素数量不一致');
end

n = numel(x);  % 提前定义n
xbar = mean(x);
ybar = mean(y);

numerator = sum(x.*y) - n*xbar*ybar;
denominator = sum(x.^2) - n*xbar^2;

% 处理分母接近零的情况
if abs(denominator) < 1e-10
    warning('分母接近零，启用稳健计算');
    k = (y(end)-y(1))/(x(end)-x(1));  % 改用端点斜率
else
    k = numerator / denominator;
end

b = ybar - k*xbar;
y_0 = k.*x + b;

% 计算相关系数r
cov_xy = sum(x.*y) - n*xbar*ybar;
std_x = sqrt(sum(x.^2) - n*xbar^2);
std_y = sqrt(sum(y.^2) - n*ybar^2);
r = cov_xy / (std_x * std_y);

sse = sum((y - y_0).^2);
end

