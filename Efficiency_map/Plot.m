% This is an example script for data plot with efficiency map
% Provided example data sets:
% EM_data.mat
% Created by Bao-Huy NGUYEN on May 2019

close all ;

%% Plot setting
font = 'Times New Roman';   % Fontname ('Times New Roman' for article and report, could be 'Arial' for presentation)
fontsize = 10 ;             % Fontsize (8-9 for article, 10-11 for report, 14-16 for presentation)
fontsize_legend = 11 ;      % Legend fontsize (8-9 for article, 10-11 for report, 14-16 for presentation)

fig_unit = 'centimeters' ;  % (centimeters is prefered)
% fig_position = [5 10] ; 	% [width height] (centimeters)
                            % to be modified to display on the screen
% fig_size = [16 5] ;     	% [width height] (centimeters) 
                            % (width <=8.8 for article, <=16 for report, more for presentation)
                            % to be set for each plot
                      
%% Data loading
load EM_data

%% Plotting  ---------------------------------------------------

%% Electrical machine efficiency map
% Figure creation
fig_position = [5 10] ; % centimeters
fig_size = [16 12] ; % centimeters
figure('units',fig_unit,'position',[fig_position fig_size]);
% Plot the efficiency map
[x1,y1] = contour(EM.Speed_range, EM.Torque_range, EM.Eff, [94 92 90 85 80 75 70 60 50 30], 'linewidth', 2, 'ShowText', 'on') ;
hold on
% Plot the limitations (if any)
plot(EM.Speed_lim, EM.Torque_peak_lim, 'k--', 'linewidth',3);
plot(EM.Speed_lim, -EM.Torque_peak_lim, 'k--', 'linewidth',3);
% Plot the results (operation points)
plot(Results.Speed, Results.Torque, 'ro', 'MarkerSize',8);
hold off 
axe_x= 'Speed [rpm]';% Legend of x axis
axe_y= 'Torque [Nm]';% Legend of y axis
xlabel(axe_x,'Fontname',font,'Fontsize',fontsize)% Labelling x axis
ylabel(axe_y,'Fontname',font,'Fontsize',fontsize)% Labelling y axis
set(gca,'Fontname',font,'fontsize',fontsize);
xlim([0 3500]);
% ylim([0 max(EM.Torque_peak_lim)]);
% Labeling the efficiency (numbers on the curves)
clabel(x1,y1,'LabelSpacing',150,'Fontname',font,'Fontsize',fontsize_legend); 
title('Electrical machine efficiency map [%]','Fontname',font,'FontSize',fontsize_legend)










