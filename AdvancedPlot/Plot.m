% This is an example script for advanced data plot
% Provided example data sets:
% Data.mat
% Created by Bao-Huy NGUYEN on May 2019

% Some advanced data plot techniques in this script

% 1) Plot 2 y-axes with different ranges. 
% in this case, it is simulation and experimental results with scale ratio
% Power_adapt_gain. Of course you scale your data yourself.
% Note: when plotting in 2 y-axes, if you zoom the figure by using mouse,
% the scaling ratio is not repected. Just to be careful.

% 2) Reduce the white space of the figure
% Matlab figure has some white spaces (at top, bottom, left, right) which
% are not so good for article and/or report
% The attached script RWS and the commands at the bottom solve this issue
% Disadvantage: using these commands will fix the figure size which is only
% good for writing. If you use the figure to see results on computer
% screen, you may want to disable these commands.

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
load Data

%% Traction current
% Figure creation
fig_position = [5 10] ;
fig_size = [16 6.5] ;
RWS ; % A script to reduce the white space of the figure
figure('units',fig_unit,'position',[fig_position fig_size]);
% Plot setting the left y axis (experimental result)
hold on
yyaxis left 
h2 = plot(time_exp(1:end), i_trac_est(1:end), 'b-', 'LineWidth',2) ;
axe_x= 'Time [s]';% Legend of x axis
axe_y= 'Reduced-scale experimental';% Legend of x axis
limites_y= [-250/Power_adapt_gain 450/Power_adapt_gain]; % Limits of y axis display
ylim(limites_y)% limits for y axis display
xlabel(axe_x)% Labelling x axis
ylabel(axe_y)% Labelling y axis
ax = gca ;
ax.YColor = 'b'; 
ax.FontName = font ;
ax.FontSize = fontsize ;
set(gca,'fontsize',fontsize,'FontName',font)% sizing legend font and font size
% Plot setting the right y axis (simulation result)
yyaxis right 
h1 = plot(time_simu(11:end), i_trac(1:end-10), 'r--', 'LineWidth',1) ;
hold off
axe_y= 'Full-scale simulation';% Legend of x axis
ylabel(axe_y)% Labelling y axis
limites_x= [0 time_simu(end)]; % limits of x axis display
xlim(limites_x)% Limits for x axis display  
limites_y= [-250 450]; % Limits of y axis display
ylim(limites_y)% limits for y axis display
ax = gca ;
ax.YColor = 'r'; 
ax.FontName = font ;
ax.FontSize = fontsize ;
% Common setting for the figure
title('Traction current [A]')
legend([h2 h1], {'\it{i_{\rm{trac HIL}}}', '\it{i_{\rm{trac simu}}}'}, 'Orientation', 'horizon', 'Location', 'best',  'FontName',font, 'fontsize',fontsize_legend);
grid on;
ax = gca ;
ax.GridLineStyle = ':' ;
ax.GridColor = 'k' ;
ax.GridAlpha = 1 ;
ax.XColor = 'k'; 
box on ;
% For reducing the white space
if Reduce_white_space == 1
    ax.Units = fig_unit;
    ax.Position = [left bottom ax_width ax_height];
end

