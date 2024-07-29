%% Initial Commands
clc; clear;

%% Loading Elicited Results
load('Workspace.mat');

%% Define Features and Datasets
features = {'TBN', 'TBT', 'ABT', 'MBT', 'ABA', 'MBA', 'ABOT', 'MBOT', 'ABE', 'MBE'};
datasets = {'HC_GVS_OFF', 'HC_GVS_ON', 'PD_GVSOFF_MEDOFF', 'PD_GVSOFF_MEDON', 'PD_GVSON_MEDOFF', 'PD_GVSON_MEDON'};

%% Loop through each feature and dataset
for i = 1:length(features)
    for j = 1:length(datasets)
        % Construct variable names dynamically
        data_C3 = eval([features{i}, '_C3_', datasets{j}, '(:)']);
        data_Cz = eval([features{i}, '_Cz_', datasets{j}, '(:)']);
        data_C4 = eval([features{i}, '_C4_', datasets{j}, '(:)']);
        
        % Fit a normal distribution to the data
        pd_C3 = fitdist(data_C3, 'Normal');
        pd_Cz = fitdist(data_Cz, 'Normal');
        pd_C4 = fitdist(data_C4, 'Normal');
        
        % Generate values for the PDF
        x_values_C3 = min(data_C3):0.01:max(data_C3);
        x_values_Cz = min(data_Cz):0.01:max(data_Cz);
        x_values_C4 = min(data_C4):0.01:max(data_C4);
        
        y_values_C3 = pdf(pd_C3, x_values_C3);
        y_values_Cz = pdf(pd_Cz, x_values_Cz);
        y_values_C4 = pdf(pd_C4, x_values_C4);
        
        % Plotting PDF
        figure;
        plot(x_values_C3, y_values_C3, 'b');
        hold on;
        plot(x_values_Cz, y_values_Cz, 'r');
        plot(x_values_C4, y_values_C4, 'g');
        hold off;
        grid on;
        legend('Channel C3', 'Channel Cz', 'Channel C4');
        title(['PDF of ', features{i}, ' for ', datasets{j}], 'Interpreter', 'latex');
        xlabel('Value', 'Interpreter', 'latex');
        ylabel('Density', 'Interpreter', 'latex');
        saveas(gcf, strcat(num2str(i),num2str(j),'_PDF','.jpg'));
%         % Plotting Boxplot
%         % Combine the channels into a single matrix
%         data = [data_C3, data_Cz, data_C4];
%         
%         figure;
%         boxplot(data, 'Labels', {'Channel C3', 'Channel Cz', 'Channel C4'});
%         title(['Boxplot of ', features{i}, ' for ', datasets{j}], 'Interpreter', 'latex');
%         ylabel('Value', 'Interpreter', 'latex');
%         xlabel('EEG Channels', 'Interpreter', 'latex');
    end
end