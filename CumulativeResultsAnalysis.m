%% Initial Commands
clc; clear;

%% Loading Elicited Results
load('Workspace.mat');

%% Cumulative Analysis for All 6 Datasets --->
clc;
x_axis = 1:1:6;

% Define dataset names and titles for the plots
Features = {'TBN', 'TBT', 'ABT', 'MBT', 'ABA', 'MBA', 'ABOT', 'MBOT', 'ABE', 'MBE'};
titles = {
    'Total Number of Bursts in a Sample (Mean of Dataset)', ...
    'Total Time Spent in Burst in a Sample (Mean of Dataset)', ...
    'Average Time Spent in Burst in a Sample (Mean of Dataset)', ...
    'Maximum Time Spent in Burst in a Sample (Mean of Dataset)', ...
    'Average Amplitude of Bursts in a Sample (Mean of Dataset)', ...
    'Maximum Amplitude of Bursts in a Sample (Mean of Dataset)', ...
    'Average Time of Burst Occurrence in a Sample (Mean of Dataset)', ...
    'Occurrence Time of Highest Burst in a Sample (Mean of Dataset)', ...
    'Average Energy of Bursts in a Sample (Mean of Dataset)', ...
    'Maximum Energy of Bursts in a Sample (Mean of Dataset)'
};
ylabels = {
    'Number of Bursts', ...
    'Time (msec)', ...
    'Time (msec)', ...
    'Time (msec)', ...
    'Scaled Amplitude', ...
    'Scaled Amplitude', ...
    'Time (msec)', ...
    'Time (msec)', ...
    'Energy', ...
    'Energy'
};

% Loop through each dataset and create the plots
for i = 1:length(Features)
    figure;
    plot(x_axis, eval(['ALL_', Features{i}, '_C3']), 'b--o', 'LineWidth', 1);
    hold on;
    plot(x_axis, eval(['ALL_', Features{i}, '_Cz']), 'r--o', 'LineWidth', 1);
    plot(x_axis, eval(['ALL_', Features{i}, '_C4']), 'g--o', 'LineWidth', 1);
    hold off;
    legend('Channel C3', 'Channel Cz', 'Channel C4');
    title(titles{i}, 'Interpreter', 'latex');
    xlabel('Dataset', 'Interpreter', 'latex');
    ylabel(ylabels{i}, 'Interpreter', 'latex');
end