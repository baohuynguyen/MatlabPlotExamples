% This is an example script for data plot
% Provided example data sets:
% Time.mat
% DeltaSoC05.mat, DeltaSoC10.mat, DeltaSoC20.mat
% Created by Bao-Huy NGUYEN on May 2019

close all ;

%% Plot setting
font = 'Times New Roman';   % Fontname ('Times New Roman' for article and report, could be 'Arial' for presentation)
fontsize = 14 ;             % Fontsize (8-9 for article, 10-11 for report, 14-16 for presentation)
fontsize_legend = 14 ;      % Legend fontsize (8-9 for article, 10-11 for report, 14-16 for presentation)

fig_unit = 'centimeters' ;  % (centimeters is prefered)
% fig_position = [5 10] ;  	% [width height] (centimeters)
                            % to be modified to display on the screen
% fig_size = [16 5] ;     	% [width height] (centimeters) 
                            % (width <=8.8 for article, <=16 for report, more for presentation)
                            % to be set for each plot
%% SoC plot
% Figure creation
fig_position = [5 10] ; % centimeters
fig_size = [16 10] ; % centimeters
figure('units',fig_unit,'position',[fig_position fig_size]);
% Data loading and plot
load Time ;
hold on
load DeltaSoC05
h1 = plot(Time, SoC_hess, 'k--', 'LineWidth',1.5) ;
load DeltaSoC10
h2 = plot(Time, SoC_hess, 'b-', 'LineWidth',1.5) ;
load DeltaSoC20
h3 = plot(Time, SoC_hess, 'r:', 'LineWidth',1.5) ;
hold off
% Axis setup
axe_x= 'Time [s]' ; % Legend of x axis
limites_x= [0 Time(end)]; % limits of x axis display
% limites_y= [44 52]; % Limits of y axis display
xlabel(axe_x,'Fontname',font,'Fontsize',fontsize) % Labelling x axis
% ylabel(axe_y,'Fontname',font,'Fontsize',fontsize) % Labelling y axis
set(gca,'FontSize',fontsize,'FontName',font)% sizing legend font and font size
legend([h1, h2, h3], {'\it{\DeltaSoC} = 5%', '\it{\DeltaSoC} = 10%', '\it{\DeltaSoC} = 20%'},...
    'Orientation', 'vertical', 'Location', 'Best', 'FontName',font, 'FontSize',fontsize_legend);
xlim(limites_x) % Limits for x axis display  
% ylim(limites_y) % limits for y axis display
title('Battery SoC [%]')
% Grid setup
grid on;
ax = gca ;
ax.GridLineStyle = ':' ;
ax.GridColor = 'k' ;
ax.GridAlpha = 1 ;
box on ;

