function FresnelDiffractionAppPro
    % 创建主界面
    fig = uifigure('Name', '全功能衍射模拟器', 'Position', [100 100 1200 700]);
    
    % 坐标系设置
    ax1 = uiaxes(fig, 'Position', [50 320 400 300]);  % 孔径形状
    ax2 = uiaxes(fig, 'Position', [500 320 400 300]); % 衍射图样
    ax3 = uiaxes(fig, 'Position', [950 320 200 300]); % 参数状态
    
    % 控制面板
    panel = uipanel(fig, 'Position', [50 50 1100 250], 'Title','控制面板',...
                   'BackgroundColor',[0.95 0.95 0.95]);
    
    % 基础参数控件
    uilabel(panel, 'Position',[20 200 80 20], 'Text','波长(nm):');
    lambdaSlider = uislider(panel, 'Position',[100 200 200 3],...
                          'Limits',[400 700], 'Value',532,...
                          'ValueChangingFcn',@updateAll);
    
    uilabel(panel, 'Position',[20 160 80 20], 'Text','距离(m):');
    zSlider = uislider(panel, 'Position',[100 160 200 3],...
                     'Limits',[0.1 5], 'Value',0.5,...
                     'ValueChangingFcn',@updateAll);
    
    % 形状选择器
    shapeSelector = uidropdown(panel, 'Position',[350 200 120 20],...
                              'Items',{'圆形','矩形','双缝','多缝','三角形','六边形','自定义'},...
                              'ValueChangedFcn',@shapeChanged);
    
    % 动态参数组
    paramPanel = uipanel(panel, 'Position',[350 50 300 140],...
                        'Title','形状参数', 'BackgroundColor',[0.9 0.9 0.9]);
    
    % 预设参数控件
    initParams();
    
    % 初始化参数
    N = 512;              % 采样点数（建议2的幂次）
    aperture_size = 5e-3; % 孔径面物理尺寸[m]
    [X,Y] = meshgrid(linspace(-aperture_size/2, aperture_size/2, N));
    current_aperture = zeros(N);
    
    % 首次更新
    updateAll();
    
    % 核心函数定义
    %% 参数控件初始化
    function initParams()
        % 圆参数
        uilabel(paramPanel, 'Position',[10 100 50 20],'Text','半径(mm):','Visible','off','Tag','circleLabel');
        uieditfield(paramPanel, 'Position',[70 100 50 20], 'Value','1',...
                  'ValueChangedFcn',@updateAll, 'Visible','off','Tag','circleR');
        
        % 矩形参数
        uilabel(paramPanel, 'Position',[10 100 50 20],'Text','宽(mm):','Visible','off','Tag','rectWLabel');
        uieditfield(paramPanel, 'Position',[70 100 50 20], 'Value','2',...
                  'ValueChangedFcn',@updateAll, 'Visible','off','Tag','rectW');
        uilabel(paramPanel, 'Position',[130 100 50 20],'Text','高(mm):','Visible','off','Tag','rectHLabel');
        uieditfield(paramPanel, 'Position',[180 100 50 20], 'Value','1',...
                  'ValueChangedFcn',@updateAll, 'Visible','off','Tag','rectH');
        
        % 双缝参数
        uilabel(paramPanel, 'Position',[10 100 50 20],'Text','缝宽(μm):','Visible','off','Tag','slitWLabel');
        uieditfield(paramPanel, 'Position',[70 100 50 20], 'Value','50',...
                  'ValueChangedFcn',@updateAll, 'Visible','off','Tag','slitW');
        uilabel(paramPanel, 'Position',[130 100 50 20],'Text','间距(mm):','Visible','off','Tag','slitDLabel');
        uieditfield(paramPanel, 'Position',[180 100 50 20], 'Value','0.5',...
                  'ValueChangedFcn',@updateAll, 'Visible','off','Tag','slitD');
        
        % 三角形参数
        uilabel(paramPanel, 'Position',[10 100 50 20],'Text','边长(mm):','Visible','off','Tag','triLabel');
        uieditfield(paramPanel, 'Position',[70 100 50 20], 'Value','1.5',...
                  'ValueChangedFcn',@updateAll, 'Visible','off','Tag','triSize');
        
        % 六边形参数
        uilabel(paramPanel, 'Position',[10 100 50 20],'Text','直径(mm):','Visible','off','Tag','hexLabel');
        uieditfield(paramPanel, 'Position',[70 100 50 20], 'Value','2',...
                  'ValueChangedFcn',@updateAll, 'Visible','off','Tag','hexD');


        % 多缝参数（垂直排列）
        multiY = 100;
        uilabel(paramPanel, 'Position',[10 multiY 80 20],'Text','数量:',...
               'Tag','multiNumLabel','Visible','off');
        uieditfield(paramPanel, 'Position',[90 multiY 50 20], 'Value','3',...
                  'Tag','multiNum','Visible','off','ValueChangedFcn',@updateAll);
        
        uilabel(paramPanel, 'Position',[10 multiY-30 80 20],'Text','缝宽(μm):',...
               'Tag','multiWLabel','Visible','off');
        uieditfield(paramPanel, 'Position',[90 multiY-30 50 20], 'Value','50',...
                  'Tag','multiW','Visible','off','ValueChangedFcn',@updateAll);
              
        uilabel(paramPanel, 'Position',[10 multiY-60 80 20],'Text','间距(mm):',...
               'Tag','multiDLabel','Visible','off');
        uieditfield(paramPanel, 'Position',[90 multiY-60 50 20], 'Value','0.5',...
                  'Tag','multiD','Visible','off','ValueChangedFcn',@updateAll);
              
        uilabel(paramPanel, 'Position',[10 multiY-90 80 20],'Text','缝高(mm):',...
               'Tag','multiHLabel','Visible','off');
        uieditfield(paramPanel, 'Position',[90 multiY-90 50 20], 'Value','2',...
                  'Tag','multiH','Visible','off','ValueChangedFcn',@updateAll);

    end

    %% 形状切换回调
    function shapeChanged(~,~)
        hideAllParams(); % 先隐藏所有参数
        switch shapeSelector.Value
            case '圆形'
                set(findobj(paramPanel,'Tag','circleLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','circleR'),'Visible','on');
                
            case '矩形'
                set(findobj(paramPanel,'Tag','rectWLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','rectW'),'Visible','on');
                set(findobj(paramPanel,'Tag','rectHLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','rectH'),'Visible','on');
                
            case '双缝'
                set(findobj(paramPanel,'Tag','slitWLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','slitW'),'Visible','on');
                set(findobj(paramPanel,'Tag','slitDLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','slitD'),'Visible','on');
                
            case '多缝'
                controlY = 100;
                set(findobj(paramPanel,'Tag','multiNumLabel'), 'Visible','on','Position',[10 controlY 80 20]);
                set(findobj(paramPanel,'Tag','multiNum'), 'Visible','on','Position',[90 controlY 50 20]);


                %set(findobj(paramPanel,'Tag','multiNumLabel'),'Visible','on');
                %set(findobj(paramPanel,'Tag','multiNum'),'Visible','on');
                set(findobj(paramPanel,'Tag','multiWLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','multiW'),'Visible','on');
                set(findobj(paramPanel,'Tag','multiDLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','multiD'),'Visible','on');
                set(findobj(paramPanel,'Tag','multiHLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','multiH'),'Visible','on');

            case '三角形'
                set(findobj(paramPanel,'Tag','triLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','triSize'),'Visible','on');
                
            case '六边形'
                set(findobj(paramPanel,'Tag','hexLabel'),'Visible','on');
                set(findobj(paramPanel,'Tag','hexD'),'Visible','on');
        end
        updateAll();
    end

    %% 动态隐藏所有参数
    function hideAllParams()
        params = {'circle','rect','slit','tri','hex'};
        for p = params
            set(findobj(paramPanel,'Tag',[p{1} 'Label']),'Visible','off');
            set(findobj(paramPanel,'Tag',[p{1} 'R']),'Visible','off');
            set(findobj(paramPanel,'Tag',[p{1} 'W']),'Visible','off');
            set(findobj(paramPanel,'Tag',[p{1} 'H']),'Visible','off');
            set(findobj(paramPanel,'Tag',[p{1} 'D']),'Visible','off');
        end
    end

    %% 全局更新函数
    function updateAll(~,~)
        % 添加输入验证
        validateParams();
        % 生成孔径
        current_aperture = createAperture();
        
        % 计算衍射
        lambda = lambdaSlider.Value * 1e-9;
        z = zSlider.Value;
        [I, output_x] = calculateFresnel(current_aperture, z, lambda);
        
        % 更新显示
        updateDisplays(I, output_x);
        updateParamMonitor();
    end

    function validateParams()
    if strcmp(shapeSelector.Value,'多缝')
        num = str2double(get(findobj(paramPanel,'Tag','multiNum'),'Value'));
        num = max(1, min(20, round(num))); % 限制1-20
        set(findobj(paramPanel,'Tag','multiNum'),'Value',num2str(num));
    end
end

    %% 孔径生成函数
    function aperture = createAperture()
        mm2m = @(x) x*1e-3; % 单位转换函数
        
        switch shapeSelector.Value
            case '圆形'
                R = str2double(get(findobj(paramPanel,'Tag','circleR'),'Value'));
                aperture = hypot(X, Y) <= mm2m(R);
                
            case '矩形'
                w = mm2m(str2double(get(findobj(paramPanel,'Tag','rectW'),'Value')));
                h = mm2m(str2double(get(findobj(paramPanel,'Tag','rectH'),'Value')));
                aperture = (abs(X) <= w/2) & (abs(Y) <= h/2);
                
            case '双缝'
                slitW = str2double(get(findobj(paramPanel,'Tag','slitW'),'Value'))*1e-6;
                slitD = mm2m(str2double(get(findobj(paramPanel,'Tag','slitD'),'Value')));
                aperture = (abs(Y) <= slitW/2) & ...
                          (abs(X - slitD/2) <= 0.1e-3 | abs(X + slitD/2) <= 0.1e-3);
                      

            case '多缝'
                % 获取参数并转换单位
                num = str2double(get(findobj(paramPanel,'Tag','multiNum'),'Value'));
                w = str2double(get(findobj(paramPanel,'Tag','multiW'),'Value'))*1e-6;  % μm→m
                d = mm2m(str2double(get(findobj(paramPanel,'Tag','multiD'),'Value')));  % mm→m
                h = mm2m(str2double(get(findobj(paramPanel,'Tag','multiH'),'Value')));  % mm→m
                
                % 计算对称位置
                x_pos = (-(num-1)/2:(num-1)/2)*d;
                
                % 生成各缝
                aperture = false(size(X));
                for k = 1:num
                    slit = (abs(X - x_pos(k)) <= w/2) & (abs(Y) <= h/2);
                    aperture = aperture | slit;
                end
            

            case '三角形'
                trisize = mm2m(str2double(get(findobj(paramPanel,'Tag','triSize'),'Value')));
                % 生成旋转的正三角形
                theta = linspace(0, 2*pi, 4);
                xv = trisize*cos(theta);
                yv = trisize*sin(theta);
                aperture = inpolygon(X,Y,xv,yv);
                
            case '六边形'
                D = mm2m(str2double(get(findobj(paramPanel,'Tag','hexD'),'Value')));
                theta = linspace(0, 2*pi, 7);
                xv = D/2*cos(theta);
                yv = D/2*sin(theta);
                aperture = inpolygon(X,Y,xv,yv);
                
            case '自定义'
                % 示例：旋转的风车形状
                blades = 4;
                theta = atan2(Y,X);
                r = hypot(X,Y);
                aperture = (r <= 1e-3) & (mod(theta*blades/(2*pi),1) < 0.5);
        end
    end

    %% 显示更新函数
    function updateDisplays(I, output_x)
        imagesc(ax1, X(1,:)*1e3, Y(:,1)*1e3, current_aperture);
        axis(ax1, 'image'); colormap(ax1, gray);
        
        imagesc(ax2, output_x*1e3, output_x*1e3, log10(I+1e-6));
        axis(ax2, 'image'); colormap(ax2, turbo);
    end

    %% 参数监控显示
    function updateParamMonitor()
        cla(ax3);
        text(ax3, 0.1,0.8, sprintf('当前参数:\nλ = %d nm\nz = %.2f m',...
             lambdaSlider.Value, zSlider.Value),...
             'FontSize',10);
        axis(ax3, 'off');
    end

    %% 衍射计算函数 (优化版本)
    function [I, output_x] = calculateFresnel(aperture, z, lambda)
        % 角谱法快速计算
        N = size(aperture,1);
        dx = aperture_size / N;
        k = 2*pi / lambda;
        
        % 空间频率计算
        fx = fftshift((-N/2:N/2-1)/(N*dx));
        [FX, FY] = meshgrid(fx, fx);
        
        % 传递函数 (包含二次相位项补偿)
        H = exp(1i*k*z) .* exp(-1i*pi*lambda*z*(FX.^2 + FY.^2));
        
        % 传播计算
        U0_fft = fft2(aperture);
        U1 = ifft2(U0_fft .* H);
        
        I = abs(U1).^2;
        I = I / max(I(:));
        output_x = (-N/2:N/2-1)*(lambda*z/(N*dx));
    end
end
