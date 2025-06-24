% 矩形孔夫琅禾费衍射二维强度分布模拟
clear; clc; close all;

%% 用户可调参数（按实际需要修改）
f = 0.5;        % 透镜焦距 [m]
a = 0.2e-3;     % 矩形孔长边 [m]
b = 0.1e+3;     % 矩形孔短边 [m]
A = 1;          % 入射光振幅 [a.u.]
lambda = 532e-9;% 光波长 [m] (绿光)
N = 2048;       % 像素分辨率
screen_size = 0.015; % 观察屏半宽 [m]

%% 物理计算 (不要修改)
% 生成观察屏坐标
[x, y] = meshgrid(linspace(-screen_size, screen_size, N));
k = 2*pi/lambda; % 波数

% 夫琅禾费衍射公式
fx = x / (lambda*f); % 空间频率X分量
fy = y / (lambda*f); % 空间频率Y分量
I = (A*a*b/(lambda*f))^2 * (sinc(a*fx).^2 .* sinc(b*fy).^2);

%% 全屏可视化设置
figure('Name','二维衍射图样','Position', [100 100 1000 800], 'Color','k')

% 对数强度映射（增强弱信号显示）
I_display = log10(I + 1e-6*max(I(:))); % 防止log(0)

% 伪彩色显示
imagesc([-screen_size, screen_size]*1e3,...
        [-screen_size, screen_size]*1e3,...
        I_display);
colormap(jet(256)); % 使用彩虹色系
axis square;
colorbar('Ticks',linspace(min(I_display(:)),max(I_display(:)),5),...
         'TickLabels',10.^linspace(min(I_display(:)),max(I_display(:)),5));
title(sprintf('矩形孔衍射光强分布 (a=%.1fmm, b=%.1fmm, f=%.1fm)',...
      a*1e3, b*1e3, f), 'Color','w','FontSize',14)
xlabel('X方向 [mm]', 'Color','w');
ylabel('Y方向 [mm]', 'Color','w');
set(gca, 'Color','k', 'XColor','w', 'YColor','w', 'FontSize',12);

% 叠加十字准线
hold on;
plot([0 0], [-screen_size screen_size]*1e3, 'w--', 'LineWidth',0.5);
plot([-screen_size screen_size]*1e3, [0 0], 'w--', 'LineWidth',0.5);

% 添加比例标尺
scale_length = 2e3*lambda*f/(a+b); % 特征条纹间距
rectangle('Position',[screen_size*1e3-3,-screen_size*1e3+0.5, 2,0.3],...
          'FaceColor','w','EdgeColor','none');
text(screen_size*1e3-3.2, -screen_size*1e3+1,...
     sprintf('%.1fmm',scale_length*1e3),'Color','w','FontSize',10);
