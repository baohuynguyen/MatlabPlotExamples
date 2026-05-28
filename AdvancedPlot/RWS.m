% Reduce
% White 
% Space
% 1: Yes    (manual)
% 0: No     (automatic)
Reduce_white_space = 1 ;
% You can tune the below multiply ratios
if Reduce_white_space == 1 % Only care if Yes
    % 1 pt = 0.035 cm; pt is a computer point
    left = 3.5*0.035*fontsize ;     % to give space for y axis numbers (if label, increase)
    right = 4*0.035*fontsize ;      % to give space for figure x axis final number
    bottom = 3.5*0.035*fontsize ;   % to give space for x axis numbers and label
    top = 1.5*0.035*fontsize ;      % to give space for figure title
    ax_height = fig_size(2) - bottom - top ;
    ax_width = fig_size(1) - left - right ;
end