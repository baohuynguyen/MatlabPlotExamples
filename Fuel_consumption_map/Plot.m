% This is an example script for data plot with ICE consumption map
% Provided example data sets:
% ICE_fuel_map_147kW.mat
% Created by Bao-Huy NGUYEN on Sep 2021

close all ;
clear; clc;

%% Internal combustion engine model
% Norminal ICE set: 147-kW (200 hp) for 8-ton truck
ICE.power = 254e3 ; % [kW]
% Speed range of the engine [rad/s]
ICE.Speed_range = (5400/2700)*[73.3 99.48 125.7 151.8 178 204.2 230.4 256.6 282.7];
% Torque range of the engine [N*m]
ICE.Torque_range = [15 55 95 135 175 215 255 295 335 375 415 455 495 535 575 600 630] ;
% Fuel use map (g/s)
load 'ICE_fuel_map_147kW'
ICE.Fuel_map = (ICE.power/147e3)*Fuel_map;
% Limitations of torque and speed of the ICE (Ford website)
ICE.Speed_lim = (5400/2700)*[700 1000 1500 2100 2500 2700]*2*pi/60; % [rad/s]
ICE.Torque_lim = [400 500 600 630 550 450]; % [N.m]

%% Plot setting
font = 'Times New Roman';   % Fontname ('Times New Roman' for article and report, could be 'Arial' for presentation)
fontsize = 14 ;             % Fontsize (8-9 for article, 10-11 for report, 14-16 for presentation)
fontsize_legend = 14 ;      % Legend fontsize (8-9 for article, 10-11 for report, 14-16 for presentation)

fig_unit = 'centimeters' ;  % (centimeters is prefered)
% fig_position = [5 10] ; 	% [width height] (centimeters)
                            % to be modified to display on the screen
% fig_size = [16 5] ;     	% [width height] (centimeters) 
                            % (width <=8.8 for article, <=16 for report, more for presentation)
                            % to be set for each plot
                   
%% ICE fuel map
% Figure creation
fig_position = [5 5] ; % centimeters
fig_size = [16 12] ; % centimeters
figure('units',fig_unit,'position',[fig_position fig_size]);
[T,w]=meshgrid(ICE.Torque_range, ICE.Speed_range);
ICE.Fuel_map_kW=T.*w/1000;
ICE.Fuel_map_gpkWh=ICE.Fuel_map./ICE.Fuel_map_kW*3600;
h1 = plot(ICE.Speed_lim*30/pi, ICE.Torque_lim, 'k--', 'linewidth',2);
hold on
[x1,y1]=contour(w*30/pi,T,ICE.Fuel_map_gpkWh, [350 300 275 250 225 220 200 190 180], 'linewidth',2);
hold off
axe_x= 'Speed [rpm]';% Legend of x axis
axe_y= 'Torque [Nm]';% Legend of y axis
xlabel(axe_x,'Fontname',font,'Fontsize',fontsize)% Labelling x axis
ylabel(axe_y,'Fontname',font,'Fontsize',fontsize)% Labelling y axis
set(gca,'Fontname',font,'fontsize',fontsize);
clabel(x1,y1,'LabelSpacing',216,'Fontname',font,'Fontsize',fontsize_legend);
title('ICE fuel consumption map [g/kWh]','Fontname',font,'FontSize',fontsize)


