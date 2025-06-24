% 菲涅尔衍射通用模拟程序（支持任意形状孔径）
clear; clf; close all; clc;

%% 参数设置（用户可修改部分）
shape = 'circle';     % 孔径形状: 'circle','sector','custom'
lambda = 532e-9;      % 波长[m]
A = 1;                % 入射光振幅[a.u.]
z = 0.5;              % 传播距离[m]
N = 2048;             % 采样点数（建议2的幂次）
aperture_size = 5e-3; % 孔径面物理尺寸[m]
screen_size = 10e-3;  % 观察面显示尺寸[m]

% 形状参数（根据所选形状填写）
R = 1e-3;             % 圆形/扇形半径[m]
theta_range = [30,150]; % 扇形角度[度]

%% 生成坐标网格
dx = aperture_size / N; % 孔径面采样间隔
x = linspace(-aperture_size/2, aperture_size/2, N);
y = x; % 保持方形区域
[X,Y] = meshgrid(x,y);

%% 生成孔径函数（与之前相同）
aperture = zeros(N);
switch lower(shape)
    case 'circle'
        aperture(hypot(X,Y) <= R) = 1;
        
    case 'sector'
        [theta, rho] = cart2pol(X,Y);
        theta_deg = mod(rad2deg(theta),360);
        aperture( (rho <= R) & (theta_deg >= theta_range(1)) & ...
                 (theta_deg <= theta_range(2)) ) = 1;
        
    case 'custom'
        % 示例：带圆孔的矩形
        aperture( abs(X)<1e-3 & abs(Y)<2e-3 ) = 1;
        aperture( hypot(X+0.5e-3, Y) < 0.3e-3 ) = 1;
end

%% 菲涅尔传播计算（角谱法）
k = 2*pi/lambda; % 波数
U0 = A * aperture; % 初始场

% 计算角谱传递函数
fx = fftshift((-N/2:N/2-1)/(N*dx)); % 空间频率坐标
[FX,FY] = meshgrid(fx,fx);
H = exp(1i*k*z*sqrt(1 - (lambda*FX).^2 - (lambda*FY).^2)); % 精确传递函数

% 实施传播
U0_fft = fft2(fftshift(U0));
U1 = fftshift(ifft2(U0_fft .* H));

%% 观察面强度计算
I = abs(U1).^2;
I = I/max(I(:)); % 归一化

%% 观察面坐标计算（自动缩放）
output_dx = lambda*z/(N*dx); % 观察面采样间隔
output_x = (-N/2:N/2-1)*output_dx;

%% 数据可视化
figure('Color','k','Position',[100 200 1200 500])

% 孔径面显示
subplot(121)
imagesc(x*1e3,y*1e3,aperture)
axis image; colormap(gray)
title('孔径面形状','Color','w')
xlabel('x [mm]'); ylabel('y [mm]')
set(gca,'Color','k','XColor','w','YColor','w')

% 衍射图样显示
subplot(122)
imagesc(output_x*1e3, output_x*1e3, log10(I+1e-6))
axis image; colormap(turbo)
colorbar('Ticks',linspace(-6,0,5),...
         'TickLabels',{'1e-6','1e-4.5','1e-3','1e-1.5','1'})
title(sprintf('菲涅尔衍射图样(z=%.2fm, λ=%.1fnm)',z,lambda*1e9),'Color','w')
xlabel('x [mm]'); ylabel('y [mm]')
set(gca,'Color','k','XColor','w','YColor','w')

% 添加特征尺寸标注
hold on
plot([-1 1]*screen_size/2*1e3, [1 1]*screen_size/2*1e3*0.8, 'w--')
text(0, screen_size*1e3*0.82, sprintf('显示范围: %.1fmm',screen_size*1e3),...
    'Color','w','HorizontalAlignment','center')
