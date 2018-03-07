%% 2D Plots for Visualization of Trajectories

% Using the script block given in Lab; Implementation of instructions for 
% graphical representation of trajectories followed by the robot during the tests.
% This script computes and plots all the paths covered by the robot during
% the tests.

files = dir('*.mat'); 
for file = files'
    filename = load(file.name);
figure
        plot(filename.dataMoCap.pos_x,filename.dataMoCap.pos_y);
    title(file.name)
    axis([-2 2 -2 2])
end