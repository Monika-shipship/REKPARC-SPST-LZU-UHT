% 通用夫琅禾费衍射模拟（支持任意形状孔径）
clear; clc; close all;

%% 参数设置（用户可修改部分）
shape = 'circle'; % 孔径形状: 'circle', 'sector', 'custom'
f = 2;           % 透镜焦距 [m]
lambda = 532e-9; % 光波长 [m]
A = 1;           % 入射光振幅 [a.u.]
N = 2048;        % 采样点数
aperture_size = 5e-3; % 孔径面尺寸 [m]（±范围）
screen_scale = 0.015; % 观察屏显示范围 [m]（±值）

% 形状参数（根据所选形状填写）
R = 1e-3;        % 圆形/扇形半径 [m]
theta_range = [30, 150]; % 扇形角度范围 [度]

%% 生成孔径函数
[u, v] = meshgrid(linspace(-aperture_size, aperture_size, N));

switch lower(shape)
    case 'circle'
        aperture = double(hypot(u, v) <= R);
        
    case 'sector'
        [theta, rho] = cart2pol(u, v);
        theta_deg = mod(rad2deg(theta), 360);
        aperture = double( (rho <= R) & ...
                          (theta_deg >= theta_range(1)) & ...
                          (theta_deg <= theta_range(2)) );
        
    case 'custom'
        % 在此处添加自定义孔径函数（示例为两个交叉矩形）
        a = 0.8e-3; b = 0.2e-3;
        aperture = double( (abs(u) < a/2 & abs(v) < b/2) | ...
                          (abs(v) < a/2 & abs(u) < b/2) );
        
    otherwise
        error('不支持的形状类型');
end

%% FFT计算衍射场
% 计算傅里叶变换
U_fft = fft2(aperture);
U_fft = fftshift(U_fft); % 零频移到中心

% 转换为物理坐标系
delta_fx = 1/(2*aperture_size); % 频率分辨率 [1/m]
fx = linspace(-delta_fx, delta_fx, N) * lambda*f;
[x, y] = meshgrid(fx, fx); % 观察屏坐标 [m]

% 计算强度分布
I = abs(U_fft).^2;
I = I/max(I(:)); % 归一化

%% 可视化设置
figure('Name','衍射光强分布','Position', [100 100 1000 800], 'Color','k')

% 对数显示增强细节
I_display = log10(I + 1e-6);

% 绘制衍射图样
imagesc([-screen_scale, screen_scale]*1e3,...
        [-screen_scale, screen_scale]*1e3,...
        I_display);
colormap(turbo(256)); % 使用高动态范围色图
axis square;
colorbar('Ticks',linspace(min(I_display(:)),max(I_display(:)),5),...
         'TickLabels',10.^linspace(min(I_display(:)),max(I_display(:)),5));
title_str = sprintf('孔径类型: %s | 焦距%.1fm | 波长%.1fnm',...
              shape, f, lambda*1e9);
title(title_str, 'Color','w','FontSize',14)
xlabel('X方向 [mm]', 'Color','w');
ylabel('Y方向 [mm]', 'Color','w');
set(gca, 'Color','k', 'XColor','w', 'YColor','w', 'FontSize',12);

% 叠加孔径示意图
hold on;
plot_scale = 0.08; % 示意图相对尺寸
rectangle('Position',[-screen_scale*1e3*plot_scale, -screen_scale*1e3*plot_scale,...
                      2*screen_scale*1e3*plot_scale, 2*screen_scale*1e3*plot_scale],...
          'EdgeColor','w','LineWidth',1);
imshow(imresize(aperture,0.1*N),'XData',[-screen_scale*1e3*plot_scale,0],...
       'YData',[-screen_scale*1e3*plot_scale,0]);
