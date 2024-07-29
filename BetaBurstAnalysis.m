%% Initial Commands + Intro to features
clc;
clear;

% 01 ---> TBN: Total Burst Number
% 02 ---> TBT: Total Burst Time
% 03 ---> ABT: Average Burst Time
% 04 ---> MBT: Maximum Burst Time
% 05 ---> ABA: Average Burst Amplitude
% 06 ---> MBA: Maximum Burst Amplitude
% 07 ---> ABOT: Average Burst Occurrence Time
% 08 ---> MBOT: Maximum Burst Occurrence Time
% 09 ---> ABE: Average Burst Energy
% 10 ---> MBE: Maximum Burst Energy

%% Loading Dataset
load("READY4DL_500.mat");

%% Defining Vectors that Contain Features of a Dataset:
ALL_TBN_C3 = zeros(1,6); ALL_TBN_Cz = zeros(1,6); ALL_TBN_C4 = zeros(1,6); % For 6 Available Dataset
ALL_TBT_C3 = zeros(1,6); ALL_TBT_Cz = zeros(1,6); ALL_TBT_C4 = zeros(1,6); % For 6 Available Dataset
ALL_ABT_C3 = zeros(1,6); ALL_ABT_Cz = zeros(1,6); ALL_ABT_C4 = zeros(1,6); % For 6 Available Dataset
ALL_MBT_C3 = zeros(1,6); ALL_MBT_Cz = zeros(1,6); ALL_MBT_C4 = zeros(1,6); % For 6 Available Dataset
ALL_ABA_C3 = zeros(1,6); ALL_ABA_Cz = zeros(1,6); ALL_ABA_C4 = zeros(1,6); % For 6 Available Dataset
ALL_MBA_C3 = zeros(1,6); ALL_MBA_Cz = zeros(1,6); ALL_MBA_C4 = zeros(1,6); % For 6 Available Dataset
ALL_ABOT_C3 = zeros(1,6); ALL_ABOT_Cz = zeros(1,6); ALL_ABOT_C4 = zeros(1,6); % For 6 Available Dataset
ALL_MBOT_C3 = zeros(1,6); ALL_MBOT_Cz = zeros(1,6); ALL_MBOT_C4 = zeros(1,6); % For 6 Available Dataset
ALL_ABE_C3 = zeros(1,6); ALL_ABE_Cz = zeros(1,6); ALL_ABE_C4 = zeros(1,6); % For 6 Available Dataset
ALL_MBE_C3 = zeros(1,6); ALL_MBE_Cz = zeros(1,6); ALL_MBE_C4 = zeros(1,6); % For 6 Available Dataset

%-------------------------------------------------------------------------

%% Dataset 1/6: ------ HC_GVS_OFF ------

% Storing Variables --->
TBN_C3_HC_GVS_OFF = zeros(22,60); TBN_Cz_HC_GVS_OFF = zeros(22,60); TBN_C4_HC_GVS_OFF = zeros(22,60);
TBT_C3_HC_GVS_OFF = zeros(22,60); TBT_Cz_HC_GVS_OFF = zeros(22,60); TBT_C4_HC_GVS_OFF = zeros(22,60);
ABT_C3_HC_GVS_OFF = zeros(22,60); ABT_Cz_HC_GVS_OFF = zeros(22,60); ABT_C4_HC_GVS_OFF = zeros(22,60);
MBT_C3_HC_GVS_OFF = zeros(22,60); MBT_Cz_HC_GVS_OFF = zeros(22,60); MBT_C4_HC_GVS_OFF = zeros(22,60);
ABA_C3_HC_GVS_OFF = zeros(22,60); ABA_Cz_HC_GVS_OFF = zeros(22,60); ABA_C4_HC_GVS_OFF = zeros(22,60);
MBA_C3_HC_GVS_OFF = zeros(22,60); MBA_Cz_HC_GVS_OFF = zeros(22,60); MBA_C4_HC_GVS_OFF = zeros(22,60);
ABOT_C3_HC_GVS_OFF = zeros(22,60); ABOT_Cz_HC_GVS_OFF = zeros(22,60); ABOT_C4_HC_GVS_OFF = zeros(22,60);
MBOT_C3_HC_GVS_OFF = zeros(22,60); MBOT_Cz_HC_GVS_OFF = zeros(22,60); MBOT_C4_HC_GVS_OFF = zeros(22,60);
ABE_C3_HC_GVS_OFF = zeros(22,60); ABE_Cz_HC_GVS_OFF = zeros(22,60); ABE_C4_HC_GVS_OFF = zeros(22,60);
MBE_C3_HC_GVS_OFF = zeros(22,60); MBE_Cz_HC_GVS_OFF = zeros(22,60); MBE_C4_HC_GVS_OFF = zeros(22,60);

for i = 1:1:22
    for j = 1:1:60
        Data = ALL_HC_GVS_OFF(i,j);
        Data = Data{1};
        % Extracting Channels 12 (C3), 13 (Cz), and 14(C4) -->
        [Signal_C3, Signal_Cz, Signal_C4] = Channel_Extracter(Data);
        % Filtering Beta Band (13-30 Hz) -->
        [Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4] = Filter_Applier(Signal_C3, Signal_Cz, Signal_C4);
        % Finding a Suitable Threshold -->
        [Threshold_C3, Threshold_Cz, Threshold_C4] = Threshold_Finder(Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4);
        % Extracting Features from Signal
        [TBN_C3, TBT_C3, ABT_C3, MBT_C3, ABA_C3, MBA_C3, ABOT_C3, MBOT_C3, ABE_C3, MBE_C3] = Feature_Finder(Filtered_Signal_C3, Threshold_C3);
        [TBN_Cz, TBT_Cz, ABT_Cz, MBT_Cz, ABA_Cz, MBA_Cz, ABOT_Cz, MBOT_Cz, ABE_Cz, MBE_Cz] = Feature_Finder(Filtered_Signal_Cz, Threshold_Cz);
        [TBN_C4, TBT_C4, ABT_C4, MBT_C4, ABA_C4, MBA_C4, ABOT_C4, MBOT_C4, ABE_C4, MBE_C4] = Feature_Finder(Filtered_Signal_C4, Threshold_C4);
        TBN_C3_HC_GVS_OFF(i,j) = TBN_C3; TBN_Cz_HC_GVS_OFF(i,j) = TBN_Cz; TBN_C4_HC_GVS_OFF(i,j) = TBN_C4;
        TBT_C3_HC_GVS_OFF(i,j) = TBT_C3; TBT_Cz_HC_GVS_OFF(i,j) = TBT_Cz; TBT_C4_HC_GVS_OFF(i,j) = TBT_C4;
        ABT_C3_HC_GVS_OFF(i,j) = ABT_C3; ABT_Cz_HC_GVS_OFF(i,j) = ABT_Cz; ABT_C4_HC_GVS_OFF(i,j) = ABT_C4;
        MBT_C3_HC_GVS_OFF(i,j) = MBT_C3; MBT_Cz_HC_GVS_OFF(i,j) = MBT_Cz; MBT_C4_HC_GVS_OFF(i,j) = MBT_C4;
        ABA_C3_HC_GVS_OFF(i,j) = ABA_C3; ABA_Cz_HC_GVS_OFF(i,j) = ABA_Cz; ABA_C4_HC_GVS_OFF(i,j) = ABA_C4;
        MBA_C3_HC_GVS_OFF(i,j) = MBA_C3; MBA_Cz_HC_GVS_OFF(i,j) = MBA_Cz; MBA_C4_HC_GVS_OFF(i,j) = MBA_C4;
        ABOT_C3_HC_GVS_OFF(i,j) = ABOT_C3; ABOT_Cz_HC_GVS_OFF(i,j) = ABOT_Cz; ABOT_C4_HC_GVS_OFF(i,j) = ABOT_C4;
        MBOT_C3_HC_GVS_OFF(i,j) = MBOT_C3; MBOT_Cz_HC_GVS_OFF(i,j) = MBOT_Cz; MBOT_C4_HC_GVS_OFF(i,j) = MBOT_C4;
        ABE_C3_HC_GVS_OFF(i,j) = ABE_C3; ABE_Cz_HC_GVS_OFF(i,j) = ABE_Cz; ABE_C4_HC_GVS_OFF(i,j) = ABE_C4;
        MBE_C3_HC_GVS_OFF(i,j) = MBE_C3; MBE_Cz_HC_GVS_OFF(i,j) = MBE_Cz; MBE_C4_HC_GVS_OFF(i,j) = MBE_C4;
    end
end

ALL_TBN_C3(1) = sum(TBN_C3_HC_GVS_OFF, "all")/numel(TBN_C3_HC_GVS_OFF);
ALL_TBN_Cz(1) = sum(TBN_Cz_HC_GVS_OFF, "all")/numel(TBN_Cz_HC_GVS_OFF);
ALL_TBN_C4(1) = sum(TBN_C4_HC_GVS_OFF, "all")/numel(TBN_C4_HC_GVS_OFF);

ALL_TBT_C3(1) = sum(TBT_C3_HC_GVS_OFF, "all")/numel(TBT_C3_HC_GVS_OFF);
ALL_TBT_Cz(1) = sum(TBT_Cz_HC_GVS_OFF, "all")/numel(TBT_Cz_HC_GVS_OFF);
ALL_TBT_C4(1) = sum(TBT_C4_HC_GVS_OFF, "all")/numel(TBT_C4_HC_GVS_OFF);

ALL_ABT_C3(1) = sum(ABT_C3_HC_GVS_OFF, "all")/numel(ABT_C3_HC_GVS_OFF);
ALL_ABT_Cz(1) = sum(ABT_Cz_HC_GVS_OFF, "all")/numel(ABT_Cz_HC_GVS_OFF);
ALL_ABT_C4(1) = sum(ABT_C4_HC_GVS_OFF, "all")/numel(ABT_C4_HC_GVS_OFF);

ALL_MBT_C3(1) = sum(MBT_C3_HC_GVS_OFF, "all")/numel(MBT_C3_HC_GVS_OFF);
ALL_MBT_Cz(1) = sum(MBT_Cz_HC_GVS_OFF, "all")/numel(MBT_Cz_HC_GVS_OFF);
ALL_MBT_C4(1) = sum(MBT_C4_HC_GVS_OFF, "all")/numel(MBT_C4_HC_GVS_OFF);

ALL_ABA_C3(1) = sum(ABA_C3_HC_GVS_OFF, "all")/numel(ABA_C3_HC_GVS_OFF);
ALL_ABA_Cz(1) = sum(ABA_Cz_HC_GVS_OFF, "all")/numel(ABA_Cz_HC_GVS_OFF);
ALL_ABA_C4(1) = sum(ABA_C4_HC_GVS_OFF, "all")/numel(ABA_C4_HC_GVS_OFF);

ALL_MBA_C3(1) = sum(MBA_C3_HC_GVS_OFF, "all")/numel(MBA_C3_HC_GVS_OFF);
ALL_MBA_Cz(1) = sum(MBA_Cz_HC_GVS_OFF, "all")/numel(MBA_Cz_HC_GVS_OFF);
ALL_MBA_C4(1) = sum(MBA_C4_HC_GVS_OFF, "all")/numel(MBA_C4_HC_GVS_OFF);

ALL_ABOT_C3(1) = sum(ABOT_C3_HC_GVS_OFF, "all")/numel(ABOT_C3_HC_GVS_OFF);
ALL_ABOT_Cz(1) = sum(ABOT_Cz_HC_GVS_OFF, "all")/numel(ABOT_Cz_HC_GVS_OFF);
ALL_ABOT_C4(1) = sum(ABOT_C4_HC_GVS_OFF, "all")/numel(ABOT_C4_HC_GVS_OFF);

ALL_MBOT_C3(1) = sum(MBOT_C3_HC_GVS_OFF, "all")/numel(MBOT_C3_HC_GVS_OFF);
ALL_MBOT_Cz(1) = sum(MBOT_Cz_HC_GVS_OFF, "all")/numel(MBOT_Cz_HC_GVS_OFF);
ALL_MBOT_C4(1) = sum(MBOT_C4_HC_GVS_OFF, "all")/numel(MBOT_C4_HC_GVS_OFF);

ALL_ABE_C3(1) = sum(ABE_C3_HC_GVS_OFF, "all")/numel(ABE_C3_HC_GVS_OFF);
ALL_ABE_Cz(1) = sum(ABE_Cz_HC_GVS_OFF, "all")/numel(ABE_Cz_HC_GVS_OFF);
ALL_ABE_C4(1) = sum(ABE_C4_HC_GVS_OFF, "all")/numel(ABE_C4_HC_GVS_OFF);

ALL_MBE_C3(1) = sum(MBE_C3_HC_GVS_OFF, "all")/numel(MBE_C3_HC_GVS_OFF);
ALL_MBE_Cz(1) = sum(MBE_Cz_HC_GVS_OFF, "all")/numel(MBE_Cz_HC_GVS_OFF);
ALL_MBE_C4(1) = sum(MBE_C4_HC_GVS_OFF, "all")/numel(MBE_C4_HC_GVS_OFF);

%-------------------------------------------------------------------------

%% Dataset 2/6: ------ HC_GVS_ON ------

% Storing Variables --->
TBN_C3_HC_GVS_ON = zeros(22,60); TBN_Cz_HC_GVS_ON = zeros(22,60); TBN_C4_HC_GVS_ON = zeros(22,60);
TBT_C3_HC_GVS_ON = zeros(22,60); TBT_Cz_HC_GVS_ON = zeros(22,60); TBT_C4_HC_GVS_ON = zeros(22,60);
ABT_C3_HC_GVS_ON = zeros(22,60); ABT_Cz_HC_GVS_ON = zeros(22,60); ABT_C4_HC_GVS_ON = zeros(22,60);
MBT_C3_HC_GVS_ON = zeros(22,60); MBT_Cz_HC_GVS_ON = zeros(22,60); MBT_C4_HC_GVS_ON = zeros(22,60);
ABA_C3_HC_GVS_ON = zeros(22,60); ABA_Cz_HC_GVS_ON = zeros(22,60); ABA_C4_HC_GVS_ON = zeros(22,60);
MBA_C3_HC_GVS_ON = zeros(22,60); MBA_Cz_HC_GVS_ON = zeros(22,60); MBA_C4_HC_GVS_ON = zeros(22,60);
ABOT_C3_HC_GVS_ON = zeros(22,60); ABOT_Cz_HC_GVS_ON = zeros(22,60); ABOT_C4_HC_GVS_ON = zeros(22,60);
MBOT_C3_HC_GVS_ON = zeros(22,60); MBOT_Cz_HC_GVS_ON = zeros(22,60); MBOT_C4_HC_GVS_ON = zeros(22,60);
ABE_C3_HC_GVS_ON = zeros(22,60); ABE_Cz_HC_GVS_ON = zeros(22,60); ABE_C4_HC_GVS_ON = zeros(22,60);
MBE_C3_HC_GVS_ON = zeros(22,60); MBE_Cz_HC_GVS_ON = zeros(22,60); MBE_C4_HC_GVS_ON = zeros(22,60);

for i = 1:1:22
    for j = 1:1:60
        Data = ALL_HC_GVS_ON(i,j);
        Data = Data{1};
        % Extracting Channels 12 (C3), 13 (Cz), and 14(C4) -->
        [Signal_C3, Signal_Cz, Signal_C4] = Channel_Extracter(Data);
        % Filtering Beta Band (13-30 Hz) -->
        [Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4] = Filter_Applier(Signal_C3, Signal_Cz, Signal_C4);
        % Finding a Suitable Threshold -->
        [Threshold_C3, Threshold_Cz, Threshold_C4] = Threshold_Finder(Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4);
        % Extracting Features from Signal
        [TBN_C3, TBT_C3, ABT_C3, MBT_C3, ABA_C3, MBA_C3, ABOT_C3, MBOT_C3, ABE_C3, MBE_C3] = Feature_Finder(Filtered_Signal_C3, Threshold_C3);
        [TBN_Cz, TBT_Cz, ABT_Cz, MBT_Cz, ABA_Cz, MBA_Cz, ABOT_Cz, MBOT_Cz, ABE_Cz, MBE_Cz] = Feature_Finder(Filtered_Signal_Cz, Threshold_Cz);
        [TBN_C4, TBT_C4, ABT_C4, MBT_C4, ABA_C4, MBA_C4, ABOT_C4, MBOT_C4, ABE_C4, MBE_C4] = Feature_Finder(Filtered_Signal_C4, Threshold_C4);
        TBN_C3_HC_GVS_ON(i,j) = TBN_C3; TBN_Cz_HC_GVS_ON(i,j) = TBN_Cz; TBN_C4_HC_GVS_ON(i,j) = TBN_C4;
        TBT_C3_HC_GVS_ON(i,j) = TBT_C3; TBT_Cz_HC_GVS_ON(i,j) = TBT_Cz; TBT_C4_HC_GVS_ON(i,j) = TBT_C4;
        ABT_C3_HC_GVS_ON(i,j) = ABT_C3; ABT_Cz_HC_GVS_ON(i,j) = ABT_Cz; ABT_C4_HC_GVS_ON(i,j) = ABT_C4;
        MBT_C3_HC_GVS_ON(i,j) = MBT_C3; MBT_Cz_HC_GVS_ON(i,j) = MBT_Cz; MBT_C4_HC_GVS_ON(i,j) = MBT_C4;
        ABA_C3_HC_GVS_ON(i,j) = ABA_C3; ABA_Cz_HC_GVS_ON(i,j) = ABA_Cz; ABA_C4_HC_GVS_ON(i,j) = ABA_C4;
        MBA_C3_HC_GVS_ON(i,j) = MBA_C3; MBA_Cz_HC_GVS_ON(i,j) = MBA_Cz; MBA_C4_HC_GVS_ON(i,j) = MBA_C4;
        ABOT_C3_HC_GVS_ON(i,j) = ABOT_C3; ABOT_Cz_HC_GVS_ON(i,j) = ABOT_Cz; ABOT_C4_HC_GVS_ON(i,j) = ABOT_C4;
        MBOT_C3_HC_GVS_ON(i,j) = MBOT_C3; MBOT_Cz_HC_GVS_ON(i,j) = MBOT_Cz; MBOT_C4_HC_GVS_ON(i,j) = MBOT_C4;
        ABE_C3_HC_GVS_ON(i,j) = ABE_C3; ABE_Cz_HC_GVS_ON(i,j) = ABE_Cz; ABE_C4_HC_GVS_ON(i,j) = ABE_C4;
        MBE_C3_HC_GVS_ON(i,j) = MBE_C3; MBE_Cz_HC_GVS_ON(i,j) = MBE_Cz; MBE_C4_HC_GVS_ON(i,j) = MBE_C4;
    end
end

ALL_TBN_C3(2) = sum(TBN_C3_HC_GVS_ON, "all")/numel(TBN_C3_HC_GVS_ON);
ALL_TBN_Cz(2) = sum(TBN_Cz_HC_GVS_ON, "all")/numel(TBN_Cz_HC_GVS_ON);
ALL_TBN_C4(2) = sum(TBN_C4_HC_GVS_ON, "all")/numel(TBN_C4_HC_GVS_ON);

ALL_TBT_C3(2) = sum(TBT_C3_HC_GVS_ON, "all")/numel(TBT_C3_HC_GVS_ON);
ALL_TBT_Cz(2) = sum(TBT_Cz_HC_GVS_ON, "all")/numel(TBT_Cz_HC_GVS_ON);
ALL_TBT_C4(2) = sum(TBT_C4_HC_GVS_ON, "all")/numel(TBT_C4_HC_GVS_ON);

ALL_ABT_C3(2) = sum(ABT_C3_HC_GVS_ON, "all")/numel(ABT_C3_HC_GVS_ON);
ALL_ABT_Cz(2) = sum(ABT_Cz_HC_GVS_ON, "all")/numel(ABT_Cz_HC_GVS_ON);
ALL_ABT_C4(2) = sum(ABT_C4_HC_GVS_ON, "all")/numel(ABT_C4_HC_GVS_ON);

ALL_MBT_C3(2) = sum(MBT_C3_HC_GVS_ON, "all")/numel(MBT_C3_HC_GVS_ON);
ALL_MBT_Cz(2) = sum(MBT_Cz_HC_GVS_ON, "all")/numel(MBT_Cz_HC_GVS_ON);
ALL_MBT_C4(2) = sum(MBT_C4_HC_GVS_ON, "all")/numel(MBT_C4_HC_GVS_ON);

ALL_ABA_C3(2) = sum(ABA_C3_HC_GVS_ON, "all")/numel(ABA_C3_HC_GVS_ON);
ALL_ABA_Cz(2) = sum(ABA_Cz_HC_GVS_ON, "all")/numel(ABA_Cz_HC_GVS_ON);
ALL_ABA_C4(2) = sum(ABA_C4_HC_GVS_ON, "all")/numel(ABA_C4_HC_GVS_ON);

ALL_MBA_C3(2) = sum(MBA_C3_HC_GVS_ON, "all")/numel(MBA_C3_HC_GVS_ON);
ALL_MBA_Cz(2) = sum(MBA_Cz_HC_GVS_ON, "all")/numel(MBA_Cz_HC_GVS_ON);
ALL_MBA_C4(2) = sum(MBA_C4_HC_GVS_ON, "all")/numel(MBA_C4_HC_GVS_ON);

ALL_ABOT_C3(2) = sum(ABOT_C3_HC_GVS_ON, "all")/numel(ABOT_C3_HC_GVS_ON);
ALL_ABOT_Cz(2) = sum(ABOT_Cz_HC_GVS_ON, "all")/numel(ABOT_Cz_HC_GVS_ON);
ALL_ABOT_C4(2) = sum(ABOT_C4_HC_GVS_ON, "all")/numel(ABOT_C4_HC_GVS_ON);

ALL_MBOT_C3(2) = sum(MBOT_C3_HC_GVS_ON, "all")/numel(MBOT_C3_HC_GVS_ON);
ALL_MBOT_Cz(2) = sum(MBOT_Cz_HC_GVS_ON, "all")/numel(MBOT_Cz_HC_GVS_ON);
ALL_MBOT_C4(2) = sum(MBOT_C4_HC_GVS_ON, "all")/numel(MBOT_C4_HC_GVS_ON);

ALL_ABE_C3(2) = sum(ABE_C3_HC_GVS_ON, "all")/numel(ABE_C3_HC_GVS_ON);
ALL_ABE_Cz(2) = sum(ABE_Cz_HC_GVS_ON, "all")/numel(ABE_Cz_HC_GVS_ON);
ALL_ABE_C4(2) = sum(ABE_C4_HC_GVS_ON, "all")/numel(ABE_C4_HC_GVS_ON);

ALL_MBE_C3(2) = sum(MBE_C3_HC_GVS_ON, "all")/numel(MBE_C3_HC_GVS_ON);
ALL_MBE_Cz(2) = sum(MBE_Cz_HC_GVS_ON, "all")/numel(MBE_Cz_HC_GVS_ON);
ALL_MBE_C4(2) = sum(MBE_C4_HC_GVS_ON, "all")/numel(MBE_C4_HC_GVS_ON);

%-------------------------------------------------------------------------

%% Dataset 3/6: ------ PD_GVSOFF_MEDOFF ------

% Storing Variables --->
TBN_C3_PD_GVSOFF_MEDOFF = zeros(20,60); TBN_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); TBN_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
TBT_C3_PD_GVSOFF_MEDOFF = zeros(20,60); TBT_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); TBT_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
ABT_C3_PD_GVSOFF_MEDOFF = zeros(20,60); ABT_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); ABT_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
MBT_C3_PD_GVSOFF_MEDOFF = zeros(20,60); MBT_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); MBT_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
ABA_C3_PD_GVSOFF_MEDOFF = zeros(20,60); ABA_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); ABA_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
MBA_C3_PD_GVSOFF_MEDOFF = zeros(20,60); MBA_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); MBA_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
ABOT_C3_PD_GVSOFF_MEDOFF = zeros(20,60); ABOT_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); ABOT_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
MBOT_C3_PD_GVSOFF_MEDOFF = zeros(20,60); MBOT_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); MBOT_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
ABE_C3_PD_GVSOFF_MEDOFF = zeros(20,60); ABE_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); ABE_C4_PD_GVSOFF_MEDOFF = zeros(20,60);
MBE_C3_PD_GVSOFF_MEDOFF = zeros(20,60); MBE_Cz_PD_GVSOFF_MEDOFF = zeros(20,60); MBE_C4_PD_GVSOFF_MEDOFF = zeros(20,60);

for i = 1:1:20
    for j = 1:1:60
        Data = ALL_PD_GVSOFF_MEDOFF(i,j);
        Data = Data{1};
        % Extracting Channels 12 (C3), 13 (Cz), and 14(C4) -->
        [Signal_C3, Signal_Cz, Signal_C4] = Channel_Extracter(Data);
        % Filtering Beta Band (13-30 Hz) -->
        [Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4] = Filter_Applier(Signal_C3, Signal_Cz, Signal_C4);
        % Finding a Suitable Threshold -->
        [Threshold_C3, Threshold_Cz, Threshold_C4] = Threshold_Finder(Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4);
        % Extracting Features from Signal
        [TBN_C3, TBT_C3, ABT_C3, MBT_C3, ABA_C3, MBA_C3, ABOT_C3, MBOT_C3, ABE_C3, MBE_C3] = Feature_Finder(Filtered_Signal_C3, Threshold_C3);
        [TBN_Cz, TBT_Cz, ABT_Cz, MBT_Cz, ABA_Cz, MBA_Cz, ABOT_Cz, MBOT_Cz, ABE_Cz, MBE_Cz] = Feature_Finder(Filtered_Signal_Cz, Threshold_Cz);
        [TBN_C4, TBT_C4, ABT_C4, MBT_C4, ABA_C4, MBA_C4, ABOT_C4, MBOT_C4, ABE_C4, MBE_C4] = Feature_Finder(Filtered_Signal_C4, Threshold_C4);
        TBN_C3_PD_GVSOFF_MEDOFF(i,j) = TBN_C3; TBN_Cz_PD_GVSOFF_MEDOFF(i,j) = TBN_Cz; TBN_C4_PD_GVSOFF_MEDOFF(i,j) = TBN_C4;
        TBT_C3_PD_GVSOFF_MEDOFF(i,j) = TBT_C3; TBT_Cz_PD_GVSOFF_MEDOFF(i,j) = TBT_Cz; TBT_C4_PD_GVSOFF_MEDOFF(i,j) = TBT_C4;
        ABT_C3_PD_GVSOFF_MEDOFF(i,j) = ABT_C3; ABT_Cz_PD_GVSOFF_MEDOFF(i,j) = ABT_Cz; ABT_C4_PD_GVSOFF_MEDOFF(i,j) = ABT_C4;
        MBT_C3_PD_GVSOFF_MEDOFF(i,j) = MBT_C3; MBT_Cz_PD_GVSOFF_MEDOFF(i,j) = MBT_Cz; MBT_C4_PD_GVSOFF_MEDOFF(i,j) = MBT_C4;
        ABA_C3_PD_GVSOFF_MEDOFF(i,j) = ABA_C3; ABA_Cz_PD_GVSOFF_MEDOFF(i,j) = ABA_Cz; ABA_C4_PD_GVSOFF_MEDOFF(i,j) = ABA_C4;
        MBA_C3_PD_GVSOFF_MEDOFF(i,j) = MBA_C3; MBA_Cz_PD_GVSOFF_MEDOFF(i,j) = MBA_Cz; MBA_C4_PD_GVSOFF_MEDOFF(i,j) = MBA_C4;
        ABOT_C3_PD_GVSOFF_MEDOFF(i,j) = ABOT_C3; ABOT_Cz_PD_GVSOFF_MEDOFF(i,j) = ABOT_Cz; ABOT_C4_PD_GVSOFF_MEDOFF(i,j) = ABOT_C4;
        MBOT_C3_PD_GVSOFF_MEDOFF(i,j) = MBOT_C3; MBOT_Cz_PD_GVSOFF_MEDOFF(i,j) = MBOT_Cz; MBOT_C4_PD_GVSOFF_MEDOFF(i,j) = MBOT_C4;
        ABE_C3_PD_GVSOFF_MEDOFF(i,j) = ABE_C3; ABE_Cz_PD_GVSOFF_MEDOFF(i,j) = ABE_Cz; ABE_C4_PD_GVSOFF_MEDOFF(i,j) = ABE_C4;
        MBE_C3_PD_GVSOFF_MEDOFF(i,j) = MBE_C3; MBE_Cz_PD_GVSOFF_MEDOFF(i,j) = MBE_Cz; MBE_C4_PD_GVSOFF_MEDOFF(i,j) = MBE_C4;
    end
end

ALL_TBN_C3(3) = sum(TBN_C3_PD_GVSOFF_MEDOFF, "all")/numel(TBN_C3_PD_GVSOFF_MEDOFF);
ALL_TBN_Cz(3) = sum(TBN_Cz_PD_GVSOFF_MEDOFF, "all")/numel(TBN_Cz_PD_GVSOFF_MEDOFF);
ALL_TBN_C4(3) = sum(TBN_C4_PD_GVSOFF_MEDOFF, "all")/numel(TBN_C4_PD_GVSOFF_MEDOFF);

ALL_TBT_C3(3) = sum(TBT_C3_PD_GVSOFF_MEDOFF, "all")/numel(TBT_C3_PD_GVSOFF_MEDOFF);
ALL_TBT_Cz(3) = sum(TBT_Cz_PD_GVSOFF_MEDOFF, "all")/numel(TBT_Cz_PD_GVSOFF_MEDOFF);
ALL_TBT_C4(3) = sum(TBT_C4_PD_GVSOFF_MEDOFF, "all")/numel(TBT_C4_PD_GVSOFF_MEDOFF);

ALL_ABT_C3(3) = sum(ABT_C3_PD_GVSOFF_MEDOFF, "all")/numel(ABT_C3_PD_GVSOFF_MEDOFF);
ALL_ABT_Cz(3) = sum(ABT_Cz_PD_GVSOFF_MEDOFF, "all")/numel(ABT_Cz_PD_GVSOFF_MEDOFF);
ALL_ABT_C4(3) = sum(ABT_C4_PD_GVSOFF_MEDOFF, "all")/numel(ABT_C4_PD_GVSOFF_MEDOFF);

ALL_MBT_C3(3) = sum(MBT_C3_PD_GVSOFF_MEDOFF, "all")/numel(MBT_C3_PD_GVSOFF_MEDOFF);
ALL_MBT_Cz(3) = sum(MBT_Cz_PD_GVSOFF_MEDOFF, "all")/numel(MBT_Cz_PD_GVSOFF_MEDOFF);
ALL_MBT_C4(3) = sum(MBT_C4_PD_GVSOFF_MEDOFF, "all")/numel(MBT_C4_PD_GVSOFF_MEDOFF);

ALL_ABA_C3(3) = sum(ABA_C3_PD_GVSOFF_MEDOFF, "all")/numel(ABA_C3_PD_GVSOFF_MEDOFF);
ALL_ABA_Cz(3) = sum(ABA_Cz_PD_GVSOFF_MEDOFF, "all")/numel(ABA_Cz_PD_GVSOFF_MEDOFF);
ALL_ABA_C4(3) = sum(ABA_C4_PD_GVSOFF_MEDOFF, "all")/numel(ABA_C4_PD_GVSOFF_MEDOFF);

ALL_MBA_C3(3) = sum(MBA_C3_PD_GVSOFF_MEDOFF, "all")/numel(MBA_C3_PD_GVSOFF_MEDOFF);
ALL_MBA_Cz(3) = sum(MBA_Cz_PD_GVSOFF_MEDOFF, "all")/numel(MBA_Cz_PD_GVSOFF_MEDOFF);
ALL_MBA_C4(3) = sum(MBA_C4_PD_GVSOFF_MEDOFF, "all")/numel(MBA_C4_PD_GVSOFF_MEDOFF);

ALL_ABOT_C3(3) = sum(ABOT_C3_PD_GVSOFF_MEDOFF, "all")/numel(ABOT_C3_PD_GVSOFF_MEDOFF);
ALL_ABOT_Cz(3) = sum(ABOT_Cz_PD_GVSOFF_MEDOFF, "all")/numel(ABOT_Cz_PD_GVSOFF_MEDOFF);
ALL_ABOT_C4(3) = sum(ABOT_C4_PD_GVSOFF_MEDOFF, "all")/numel(ABOT_C4_PD_GVSOFF_MEDOFF);

ALL_MBOT_C3(3) = sum(MBOT_C3_PD_GVSOFF_MEDOFF, "all")/numel(MBOT_C3_PD_GVSOFF_MEDOFF);
ALL_MBOT_Cz(3) = sum(MBOT_Cz_PD_GVSOFF_MEDOFF, "all")/numel(MBOT_Cz_PD_GVSOFF_MEDOFF);
ALL_MBOT_C4(3) = sum(MBOT_C4_PD_GVSOFF_MEDOFF, "all")/numel(MBOT_C4_PD_GVSOFF_MEDOFF);

ALL_ABE_C3(3) = sum(ABE_C3_PD_GVSOFF_MEDOFF, "all")/numel(ABE_C3_PD_GVSOFF_MEDOFF);
ALL_ABE_Cz(3) = sum(ABE_Cz_PD_GVSOFF_MEDOFF, "all")/numel(ABE_Cz_PD_GVSOFF_MEDOFF);
ALL_ABE_C4(3) = sum(ABE_C4_PD_GVSOFF_MEDOFF, "all")/numel(ABE_C4_PD_GVSOFF_MEDOFF);

ALL_MBE_C3(3) = sum(MBE_C3_PD_GVSOFF_MEDOFF, "all")/numel(MBE_C3_PD_GVSOFF_MEDOFF);
ALL_MBE_Cz(3) = sum(MBE_Cz_PD_GVSOFF_MEDOFF, "all")/numel(MBE_Cz_PD_GVSOFF_MEDOFF);
ALL_MBE_C4(3) = sum(MBE_C4_PD_GVSOFF_MEDOFF, "all")/numel(MBE_C4_PD_GVSOFF_MEDOFF);

%-------------------------------------------------------------------------

%% Dataset 4/6: ------ PD_GVSOFF_MEDON ------

% Storing Variables --->
TBN_C3_PD_GVSOFF_MEDON = zeros(20,60); TBN_Cz_PD_GVSOFF_MEDON = zeros(20,60); TBN_C4_PD_GVSOFF_MEDON = zeros(20,60);
TBT_C3_PD_GVSOFF_MEDON = zeros(20,60); TBT_Cz_PD_GVSOFF_MEDON = zeros(20,60); TBT_C4_PD_GVSOFF_MEDON = zeros(20,60);
ABT_C3_PD_GVSOFF_MEDON = zeros(20,60); ABT_Cz_PD_GVSOFF_MEDON = zeros(20,60); ABT_C4_PD_GVSOFF_MEDON = zeros(20,60);
MBT_C3_PD_GVSOFF_MEDON = zeros(20,60); MBT_Cz_PD_GVSOFF_MEDON = zeros(20,60); MBT_C4_PD_GVSOFF_MEDON = zeros(20,60);
ABA_C3_PD_GVSOFF_MEDON = zeros(20,60); ABA_Cz_PD_GVSOFF_MEDON = zeros(20,60); ABA_C4_PD_GVSOFF_MEDON = zeros(20,60);
MBA_C3_PD_GVSOFF_MEDON = zeros(20,60); MBA_Cz_PD_GVSOFF_MEDON = zeros(20,60); MBA_C4_PD_GVSOFF_MEDON = zeros(20,60);
ABOT_C3_PD_GVSOFF_MEDON = zeros(20,60); ABOT_Cz_PD_GVSOFF_MEDON = zeros(20,60); ABOT_C4_PD_GVSOFF_MEDON = zeros(20,60);
MBOT_C3_PD_GVSOFF_MEDON = zeros(20,60); MBOT_Cz_PD_GVSOFF_MEDON = zeros(20,60); MBOT_C4_PD_GVSOFF_MEDON = zeros(20,60);
ABE_C3_PD_GVSOFF_MEDON = zeros(20,60); ABE_Cz_PD_GVSOFF_MEDON = zeros(20,60); ABE_C4_PD_GVSOFF_MEDON = zeros(20,60);
MBE_C3_PD_GVSOFF_MEDON = zeros(20,60); MBE_Cz_PD_GVSOFF_MEDON = zeros(20,60); MBE_C4_PD_GVSOFF_MEDON = zeros(20,60);

for i = 1:1:20
    for j = 1:1:60
        Data = ALL_PD_GVSOFF_MEDON(i,j);
        Data = Data{1};
        % Extracting Channels 12 (C3), 13 (Cz), and 14(C4) -->
        [Signal_C3, Signal_Cz, Signal_C4] = Channel_Extracter(Data);
        % Filtering Beta Band (13-30 Hz) -->
        [Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4] = Filter_Applier(Signal_C3, Signal_Cz, Signal_C4);
        % Finding a Suitable Threshold -->
        [Threshold_C3, Threshold_Cz, Threshold_C4] = Threshold_Finder(Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4);
        % Extracting Features from Signal
        [TBN_C3, TBT_C3, ABT_C3, MBT_C3, ABA_C3, MBA_C3, ABOT_C3, MBOT_C3, ABE_C3, MBE_C3] = Feature_Finder(Filtered_Signal_C3, Threshold_C3);
        [TBN_Cz, TBT_Cz, ABT_Cz, MBT_Cz, ABA_Cz, MBA_Cz, ABOT_Cz, MBOT_Cz, ABE_Cz, MBE_Cz] = Feature_Finder(Filtered_Signal_Cz, Threshold_Cz);
        [TBN_C4, TBT_C4, ABT_C4, MBT_C4, ABA_C4, MBA_C4, ABOT_C4, MBOT_C4, ABE_C4, MBE_C4] = Feature_Finder(Filtered_Signal_C4, Threshold_C4);
        TBN_C3_PD_GVSOFF_MEDON(i,j) = TBN_C3; TBN_Cz_PD_GVSOFF_MEDON(i,j) = TBN_Cz; TBN_C4_PD_GVSOFF_MEDON(i,j) = TBN_C4;
        TBT_C3_PD_GVSOFF_MEDON(i,j) = TBT_C3; TBT_Cz_PD_GVSOFF_MEDON(i,j) = TBT_Cz; TBT_C4_PD_GVSOFF_MEDON(i,j) = TBT_C4;
        ABT_C3_PD_GVSOFF_MEDON(i,j) = ABT_C3; ABT_Cz_PD_GVSOFF_MEDON(i,j) = ABT_Cz; ABT_C4_PD_GVSOFF_MEDON(i,j) = ABT_C4;
        MBT_C3_PD_GVSOFF_MEDON(i,j) = MBT_C3; MBT_Cz_PD_GVSOFF_MEDON(i,j) = MBT_Cz; MBT_C4_PD_GVSOFF_MEDON(i,j) = MBT_C4;
        ABA_C3_PD_GVSOFF_MEDON(i,j) = ABA_C3; ABA_Cz_PD_GVSOFF_MEDON(i,j) = ABA_Cz; ABA_C4_PD_GVSOFF_MEDON(i,j) = ABA_C4;
        MBA_C3_PD_GVSOFF_MEDON(i,j) = MBA_C3; MBA_Cz_PD_GVSOFF_MEDON(i,j) = MBA_Cz; MBA_C4_PD_GVSOFF_MEDON(i,j) = MBA_C4;
        ABOT_C3_PD_GVSOFF_MEDON(i,j) = ABOT_C3; ABOT_Cz_PD_GVSOFF_MEDON(i,j) = ABOT_Cz; ABOT_C4_PD_GVSOFF_MEDON(i,j) = ABOT_C4;
        MBOT_C3_PD_GVSOFF_MEDON(i,j) = MBOT_C3; MBOT_Cz_PD_GVSOFF_MEDON(i,j) = MBOT_Cz; MBOT_C4_PD_GVSOFF_MEDON(i,j) = MBOT_C4;
        ABE_C3_PD_GVSOFF_MEDON(i,j) = ABE_C3; ABE_Cz_PD_GVSOFF_MEDON(i,j) = ABE_Cz; ABE_C4_PD_GVSOFF_MEDON(i,j) = ABE_C4;
        MBE_C3_PD_GVSOFF_MEDON(i,j) = MBE_C3; MBE_Cz_PD_GVSOFF_MEDON(i,j) = MBE_Cz; MBE_C4_PD_GVSOFF_MEDON(i,j) = MBE_C4;
    end
end

ALL_TBN_C3(4) = sum(TBN_C3_PD_GVSOFF_MEDON, "all")/numel(TBN_C3_PD_GVSOFF_MEDON);
ALL_TBN_Cz(4) = sum(TBN_Cz_PD_GVSOFF_MEDON, "all")/numel(TBN_Cz_PD_GVSOFF_MEDON);
ALL_TBN_C4(4) = sum(TBN_C4_PD_GVSOFF_MEDON, "all")/numel(TBN_C4_PD_GVSOFF_MEDON);

ALL_TBT_C3(4) = sum(TBT_C3_PD_GVSOFF_MEDON, "all")/numel(TBT_C3_PD_GVSOFF_MEDON);
ALL_TBT_Cz(4) = sum(TBT_Cz_PD_GVSOFF_MEDON, "all")/numel(TBT_Cz_PD_GVSOFF_MEDON);
ALL_TBT_C4(4) = sum(TBT_C4_PD_GVSOFF_MEDON, "all")/numel(TBT_C4_PD_GVSOFF_MEDON);

ALL_ABT_C3(4) = sum(ABT_C3_PD_GVSOFF_MEDON, "all")/numel(ABT_C3_PD_GVSOFF_MEDON);
ALL_ABT_Cz(4) = sum(ABT_Cz_PD_GVSOFF_MEDON, "all")/numel(ABT_Cz_PD_GVSOFF_MEDON);
ALL_ABT_C4(4) = sum(ABT_C4_PD_GVSOFF_MEDON, "all")/numel(ABT_C4_PD_GVSOFF_MEDON);

ALL_MBT_C3(4) = sum(MBT_C3_PD_GVSOFF_MEDON, "all")/numel(MBT_C3_PD_GVSOFF_MEDON);
ALL_MBT_Cz(4) = sum(MBT_Cz_PD_GVSOFF_MEDON, "all")/numel(MBT_Cz_PD_GVSOFF_MEDON);
ALL_MBT_C4(4) = sum(MBT_C4_PD_GVSOFF_MEDON, "all")/numel(MBT_C4_PD_GVSOFF_MEDON);

ALL_ABA_C3(4) = sum(ABA_C3_PD_GVSOFF_MEDON, "all")/numel(ABA_C3_PD_GVSOFF_MEDON);
ALL_ABA_Cz(4) = sum(ABA_Cz_PD_GVSOFF_MEDON, "all")/numel(ABA_Cz_PD_GVSOFF_MEDON);
ALL_ABA_C4(4) = sum(ABA_C4_PD_GVSOFF_MEDON, "all")/numel(ABA_C4_PD_GVSOFF_MEDON);

ALL_MBA_C3(4) = sum(MBA_C3_PD_GVSOFF_MEDON, "all")/numel(MBA_C3_PD_GVSOFF_MEDON);
ALL_MBA_Cz(4) = sum(MBA_Cz_PD_GVSOFF_MEDON, "all")/numel(MBA_Cz_PD_GVSOFF_MEDON);
ALL_MBA_C4(4) = sum(MBA_C4_PD_GVSOFF_MEDON, "all")/numel(MBA_C4_PD_GVSOFF_MEDON);

ALL_ABOT_C3(4) = sum(ABOT_C3_PD_GVSOFF_MEDON, "all")/numel(ABOT_C3_PD_GVSOFF_MEDON);
ALL_ABOT_Cz(4) = sum(ABOT_Cz_PD_GVSOFF_MEDON, "all")/numel(ABOT_Cz_PD_GVSOFF_MEDON);
ALL_ABOT_C4(4) = sum(ABOT_C4_PD_GVSOFF_MEDON, "all")/numel(ABOT_C4_PD_GVSOFF_MEDON);

ALL_MBOT_C3(4) = sum(MBOT_C3_PD_GVSOFF_MEDON, "all")/numel(MBOT_C3_PD_GVSOFF_MEDON);
ALL_MBOT_Cz(4) = sum(MBOT_Cz_PD_GVSOFF_MEDON, "all")/numel(MBOT_Cz_PD_GVSOFF_MEDON);
ALL_MBOT_C4(4) = sum(MBOT_C4_PD_GVSOFF_MEDON, "all")/numel(MBOT_C4_PD_GVSOFF_MEDON);

ALL_ABE_C3(4) = sum(ABE_C3_PD_GVSOFF_MEDON, "all")/numel(ABE_C3_PD_GVSOFF_MEDON);
ALL_ABE_Cz(4) = sum(ABE_Cz_PD_GVSOFF_MEDON, "all")/numel(ABE_Cz_PD_GVSOFF_MEDON);
ALL_ABE_C4(4) = sum(ABE_C4_PD_GVSOFF_MEDON, "all")/numel(ABE_C4_PD_GVSOFF_MEDON);

ALL_MBE_C3(4) = sum(MBE_C3_PD_GVSOFF_MEDON, "all")/numel(MBE_C3_PD_GVSOFF_MEDON);
ALL_MBE_Cz(4) = sum(MBE_Cz_PD_GVSOFF_MEDON, "all")/numel(MBE_Cz_PD_GVSOFF_MEDON);
ALL_MBE_C4(4) = sum(MBE_C4_PD_GVSOFF_MEDON, "all")/numel(MBE_C4_PD_GVSOFF_MEDON);

%-------------------------------------------------------------------------

%% Dataset 5/6: ------ PD_GVSON_MEDOFF ------

% Storing Variables --->
TBN_C3_PD_GVSON_MEDOFF = zeros(20,60); TBN_Cz_PD_GVSON_MEDOFF = zeros(20,60); TBN_C4_PD_GVSON_MEDOFF = zeros(20,60);
TBT_C3_PD_GVSON_MEDOFF = zeros(20,60); TBT_Cz_PD_GVSON_MEDOFF = zeros(20,60); TBT_C4_PD_GVSON_MEDOFF = zeros(20,60);
ABT_C3_PD_GVSON_MEDOFF = zeros(20,60); ABT_Cz_PD_GVSON_MEDOFF = zeros(20,60); ABT_C4_PD_GVSON_MEDOFF = zeros(20,60);
MBT_C3_PD_GVSON_MEDOFF = zeros(20,60); MBT_Cz_PD_GVSON_MEDOFF = zeros(20,60); MBT_C4_PD_GVSON_MEDOFF = zeros(20,60);
ABA_C3_PD_GVSON_MEDOFF = zeros(20,60); ABA_Cz_PD_GVSON_MEDOFF = zeros(20,60); ABA_C4_PD_GVSON_MEDOFF = zeros(20,60);
MBA_C3_PD_GVSON_MEDOFF = zeros(20,60); MBA_Cz_PD_GVSON_MEDOFF = zeros(20,60); MBA_C4_PD_GVSON_MEDOFF = zeros(20,60);
ABOT_C3_PD_GVSON_MEDOFF = zeros(20,60); ABOT_Cz_PD_GVSON_MEDOFF = zeros(20,60); ABOT_C4_PD_GVSON_MEDOFF = zeros(20,60);
MBOT_C3_PD_GVSON_MEDOFF = zeros(20,60); MBOT_Cz_PD_GVSON_MEDOFF = zeros(20,60); MBOT_C4_PD_GVSON_MEDOFF = zeros(20,60);
ABE_C3_PD_GVSON_MEDOFF = zeros(20,60); ABE_Cz_PD_GVSON_MEDOFF = zeros(20,60); ABE_C4_PD_GVSON_MEDOFF = zeros(20,60);
MBE_C3_PD_GVSON_MEDOFF = zeros(20,60); MBE_Cz_PD_GVSON_MEDOFF = zeros(20,60); MBE_C4_PD_GVSON_MEDOFF = zeros(20,60);

for i = 1:1:20
    for j = 1:1:60
        Data = ALL_PD_GVSON_MEDOFF(i,j);
        Data = Data{1};
        % Extracting Channels 12 (C3), 13 (Cz), and 14(C4) -->
        [Signal_C3, Signal_Cz, Signal_C4] = Channel_Extracter(Data);
        % Filtering Beta Band (13-30 Hz) -->
        [Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4] = Filter_Applier(Signal_C3, Signal_Cz, Signal_C4);
        % Finding a Suitable Threshold -->
        [Threshold_C3, Threshold_Cz, Threshold_C4] = Threshold_Finder(Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4);
        % Extracting Features from Signal
        [TBN_C3, TBT_C3, ABT_C3, MBT_C3, ABA_C3, MBA_C3, ABOT_C3, MBOT_C3, ABE_C3, MBE_C3] = Feature_Finder(Filtered_Signal_C3, Threshold_C3);
        [TBN_Cz, TBT_Cz, ABT_Cz, MBT_Cz, ABA_Cz, MBA_Cz, ABOT_Cz, MBOT_Cz, ABE_Cz, MBE_Cz] = Feature_Finder(Filtered_Signal_Cz, Threshold_Cz);
        [TBN_C4, TBT_C4, ABT_C4, MBT_C4, ABA_C4, MBA_C4, ABOT_C4, MBOT_C4, ABE_C4, MBE_C4] = Feature_Finder(Filtered_Signal_C4, Threshold_C4);
        TBN_C3_PD_GVSON_MEDOFF(i,j) = TBN_C3; TBN_Cz_PD_GVSON_MEDOFF(i,j) = TBN_Cz; TBN_C4_PD_GVSON_MEDOFF(i,j) = TBN_C4;
        TBT_C3_PD_GVSON_MEDOFF(i,j) = TBT_C3; TBT_Cz_PD_GVSON_MEDOFF(i,j) = TBT_Cz; TBT_C4_PD_GVSON_MEDOFF(i,j) = TBT_C4;
        ABT_C3_PD_GVSON_MEDOFF(i,j) = ABT_C3; ABT_Cz_PD_GVSON_MEDOFF(i,j) = ABT_Cz; ABT_C4_PD_GVSON_MEDOFF(i,j) = ABT_C4;
        MBT_C3_PD_GVSON_MEDOFF(i,j) = MBT_C3; MBT_Cz_PD_GVSON_MEDOFF(i,j) = MBT_Cz; MBT_C4_PD_GVSON_MEDOFF(i,j) = MBT_C4;
        ABA_C3_PD_GVSON_MEDOFF(i,j) = ABA_C3; ABA_Cz_PD_GVSON_MEDOFF(i,j) = ABA_Cz; ABA_C4_PD_GVSON_MEDOFF(i,j) = ABA_C4;
        MBA_C3_PD_GVSON_MEDOFF(i,j) = MBA_C3; MBA_Cz_PD_GVSON_MEDOFF(i,j) = MBA_Cz; MBA_C4_PD_GVSON_MEDOFF(i,j) = MBA_C4;
        ABOT_C3_PD_GVSON_MEDOFF(i,j) = ABOT_C3; ABOT_Cz_PD_GVSON_MEDOFF(i,j) = ABOT_Cz; ABOT_C4_PD_GVSON_MEDOFF(i,j) = ABOT_C4;
        MBOT_C3_PD_GVSON_MEDOFF(i,j) = MBOT_C3; MBOT_Cz_PD_GVSON_MEDOFF(i,j) = MBOT_Cz; MBOT_C4_PD_GVSON_MEDOFF(i,j) = MBOT_C4;
        ABE_C3_PD_GVSON_MEDOFF(i,j) = ABE_C3; ABE_Cz_PD_GVSON_MEDOFF(i,j) = ABE_Cz; ABE_C4_PD_GVSON_MEDOFF(i,j) = ABE_C4;
        MBE_C3_PD_GVSON_MEDOFF(i,j) = MBE_C3; MBE_Cz_PD_GVSON_MEDOFF(i,j) = MBE_Cz; MBE_C4_PD_GVSON_MEDOFF(i,j) = MBE_C4;
    end
end

ALL_TBN_C3(5) = sum(TBN_C3_PD_GVSON_MEDOFF, "all")/numel(TBN_C3_PD_GVSON_MEDOFF);
ALL_TBN_Cz(5) = sum(TBN_Cz_PD_GVSON_MEDOFF, "all")/numel(TBN_Cz_PD_GVSON_MEDOFF);
ALL_TBN_C4(5) = sum(TBN_C4_PD_GVSON_MEDOFF, "all")/numel(TBN_C4_PD_GVSON_MEDOFF);

ALL_TBT_C3(5) = sum(TBT_C3_PD_GVSON_MEDOFF, "all")/numel(TBT_C3_PD_GVSON_MEDOFF);
ALL_TBT_Cz(5) = sum(TBT_Cz_PD_GVSON_MEDOFF, "all")/numel(TBT_Cz_PD_GVSON_MEDOFF);
ALL_TBT_C4(5) = sum(TBT_C4_PD_GVSON_MEDOFF, "all")/numel(TBT_C4_PD_GVSON_MEDOFF);

ALL_ABT_C3(5) = sum(ABT_C3_PD_GVSON_MEDOFF, "all")/numel(ABT_C3_PD_GVSON_MEDOFF);
ALL_ABT_Cz(5) = sum(ABT_Cz_PD_GVSON_MEDOFF, "all")/numel(ABT_Cz_PD_GVSON_MEDOFF);
ALL_ABT_C4(5) = sum(ABT_C4_PD_GVSON_MEDOFF, "all")/numel(ABT_C4_PD_GVSON_MEDOFF);

ALL_MBT_C3(5) = sum(MBT_C3_PD_GVSON_MEDOFF, "all")/numel(MBT_C3_PD_GVSON_MEDOFF);
ALL_MBT_Cz(5) = sum(MBT_Cz_PD_GVSON_MEDOFF, "all")/numel(MBT_Cz_PD_GVSON_MEDOFF);
ALL_MBT_C4(5) = sum(MBT_C4_PD_GVSON_MEDOFF, "all")/numel(MBT_C4_PD_GVSON_MEDOFF);

ALL_ABA_C3(5) = sum(ABA_C3_PD_GVSON_MEDOFF, "all")/numel(ABA_C3_PD_GVSON_MEDOFF);
ALL_ABA_Cz(5) = sum(ABA_Cz_PD_GVSON_MEDOFF, "all")/numel(ABA_Cz_PD_GVSON_MEDOFF);
ALL_ABA_C4(5) = sum(ABA_C4_PD_GVSON_MEDOFF, "all")/numel(ABA_C4_PD_GVSON_MEDOFF);

ALL_MBA_C3(5) = sum(MBA_C3_PD_GVSON_MEDOFF, "all")/numel(MBA_C3_PD_GVSON_MEDOFF);
ALL_MBA_Cz(5) = sum(MBA_Cz_PD_GVSON_MEDOFF, "all")/numel(MBA_Cz_PD_GVSON_MEDOFF);
ALL_MBA_C4(5) = sum(MBA_C4_PD_GVSON_MEDOFF, "all")/numel(MBA_C4_PD_GVSON_MEDOFF);

ALL_ABOT_C3(5) = sum(ABOT_C3_PD_GVSON_MEDOFF, "all")/numel(ABOT_C3_PD_GVSON_MEDOFF);
ALL_ABOT_Cz(5) = sum(ABOT_Cz_PD_GVSON_MEDOFF, "all")/numel(ABOT_Cz_PD_GVSON_MEDOFF);
ALL_ABOT_C4(5) = sum(ABOT_C4_PD_GVSON_MEDOFF, "all")/numel(ABOT_C4_PD_GVSON_MEDOFF);

ALL_MBOT_C3(5) = sum(MBOT_C3_PD_GVSON_MEDOFF, "all")/numel(MBOT_C3_PD_GVSON_MEDOFF);
ALL_MBOT_Cz(5) = sum(MBOT_Cz_PD_GVSON_MEDOFF, "all")/numel(MBOT_Cz_PD_GVSON_MEDOFF);
ALL_MBOT_C4(5) = sum(MBOT_C4_PD_GVSON_MEDOFF, "all")/numel(MBOT_C4_PD_GVSON_MEDOFF);

ALL_ABE_C3(5) = sum(ABE_C3_PD_GVSON_MEDOFF, "all")/numel(ABE_C3_PD_GVSON_MEDOFF);
ALL_ABE_Cz(5) = sum(ABE_Cz_PD_GVSON_MEDOFF, "all")/numel(ABE_Cz_PD_GVSON_MEDOFF);
ALL_ABE_C4(5) = sum(ABE_C4_PD_GVSON_MEDOFF, "all")/numel(ABE_C4_PD_GVSON_MEDOFF);

ALL_MBE_C3(5) = sum(MBE_C3_PD_GVSON_MEDOFF, "all")/numel(MBE_C3_PD_GVSON_MEDOFF);
ALL_MBE_Cz(5) = sum(MBE_Cz_PD_GVSON_MEDOFF, "all")/numel(MBE_Cz_PD_GVSON_MEDOFF);
ALL_MBE_C4(5) = sum(MBE_C4_PD_GVSON_MEDOFF, "all")/numel(MBE_C4_PD_GVSON_MEDOFF);

%-------------------------------------------------------------------------

%% Dataset 6/6: ------ PD_GVSON_MEDON ------

% Storing Variables --->
TBN_C3_PD_GVSON_MEDON = zeros(20,60); TBN_Cz_PD_GVSON_MEDON = zeros(20,60); TBN_C4_PD_GVSON_MEDON = zeros(20,60);
TBT_C3_PD_GVSON_MEDON = zeros(20,60); TBT_Cz_PD_GVSON_MEDON = zeros(20,60); TBT_C4_PD_GVSON_MEDON = zeros(20,60);
ABT_C3_PD_GVSON_MEDON = zeros(20,60); ABT_Cz_PD_GVSON_MEDON = zeros(20,60); ABT_C4_PD_GVSON_MEDON = zeros(20,60);
MBT_C3_PD_GVSON_MEDON = zeros(20,60); MBT_Cz_PD_GVSON_MEDON = zeros(20,60); MBT_C4_PD_GVSON_MEDON = zeros(20,60);
ABA_C3_PD_GVSON_MEDON = zeros(20,60); ABA_Cz_PD_GVSON_MEDON = zeros(20,60); ABA_C4_PD_GVSON_MEDON = zeros(20,60);
MBA_C3_PD_GVSON_MEDON = zeros(20,60); MBA_Cz_PD_GVSON_MEDON = zeros(20,60); MBA_C4_PD_GVSON_MEDON = zeros(20,60);
ABOT_C3_PD_GVSON_MEDON = zeros(20,60); ABOT_Cz_PD_GVSON_MEDON = zeros(20,60); ABOT_C4_PD_GVSON_MEDON = zeros(20,60);
MBOT_C3_PD_GVSON_MEDON = zeros(20,60); MBOT_Cz_PD_GVSON_MEDON = zeros(20,60); MBOT_C4_PD_GVSON_MEDON = zeros(20,60);
ABE_C3_PD_GVSON_MEDON = zeros(20,60); ABE_Cz_PD_GVSON_MEDON = zeros(20,60); ABE_C4_PD_GVSON_MEDON = zeros(20,60);
MBE_C3_PD_GVSON_MEDON = zeros(20,60); MBE_Cz_PD_GVSON_MEDON = zeros(20,60); MBE_C4_PD_GVSON_MEDON = zeros(20,60);

for i = 1:1:20
    for j = 1:1:60
        Data = ALL_PD_GVSON_MEDON(i,j);
        Data = Data{1};
        % Extracting Channels 12 (C3), 13 (Cz), and 14(C4) -->
        [Signal_C3, Signal_Cz, Signal_C4] = Channel_Extracter(Data);
        % Filtering Beta Band (13-30 Hz) -->
        [Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4] = Filter_Applier(Signal_C3, Signal_Cz, Signal_C4);
        % Finding a Suitable Threshold -->
        [Threshold_C3, Threshold_Cz, Threshold_C4] = Threshold_Finder(Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4);
        % Extracting Features from Signal
        [TBN_C3, TBT_C3, ABT_C3, MBT_C3, ABA_C3, MBA_C3, ABOT_C3, MBOT_C3, ABE_C3, MBE_C3] = Feature_Finder(Filtered_Signal_C3, Threshold_C3);
        [TBN_Cz, TBT_Cz, ABT_Cz, MBT_Cz, ABA_Cz, MBA_Cz, ABOT_Cz, MBOT_Cz, ABE_Cz, MBE_Cz] = Feature_Finder(Filtered_Signal_Cz, Threshold_Cz);
        [TBN_C4, TBT_C4, ABT_C4, MBT_C4, ABA_C4, MBA_C4, ABOT_C4, MBOT_C4, ABE_C4, MBE_C4] = Feature_Finder(Filtered_Signal_C4, Threshold_C4);
        TBN_C3_PD_GVSON_MEDON(i,j) = TBN_C3; TBN_Cz_PD_GVSON_MEDON(i,j) = TBN_Cz; TBN_C4_PD_GVSON_MEDON(i,j) = TBN_C4;
        TBT_C3_PD_GVSON_MEDON(i,j) = TBT_C3; TBT_Cz_PD_GVSON_MEDON(i,j) = TBT_Cz; TBT_C4_PD_GVSON_MEDON(i,j) = TBT_C4;
        ABT_C3_PD_GVSON_MEDON(i,j) = ABT_C3; ABT_Cz_PD_GVSON_MEDON(i,j) = ABT_Cz; ABT_C4_PD_GVSON_MEDON(i,j) = ABT_C4;
        MBT_C3_PD_GVSON_MEDON(i,j) = MBT_C3; MBT_Cz_PD_GVSON_MEDON(i,j) = MBT_Cz; MBT_C4_PD_GVSON_MEDON(i,j) = MBT_C4;
        ABA_C3_PD_GVSON_MEDON(i,j) = ABA_C3; ABA_Cz_PD_GVSON_MEDON(i,j) = ABA_Cz; ABA_C4_PD_GVSON_MEDON(i,j) = ABA_C4;
        MBA_C3_PD_GVSON_MEDON(i,j) = MBA_C3; MBA_Cz_PD_GVSON_MEDON(i,j) = MBA_Cz; MBA_C4_PD_GVSON_MEDON(i,j) = MBA_C4;
        ABOT_C3_PD_GVSON_MEDON(i,j) = ABOT_C3; ABOT_Cz_PD_GVSON_MEDON(i,j) = ABOT_Cz; ABOT_C4_PD_GVSON_MEDON(i,j) = ABOT_C4;
        MBOT_C3_PD_GVSON_MEDON(i,j) = MBOT_C3; MBOT_Cz_PD_GVSON_MEDON(i,j) = MBOT_Cz; MBOT_C4_PD_GVSON_MEDON(i,j) = MBOT_C4;
        ABE_C3_PD_GVSON_MEDON(i,j) = ABE_C3; ABE_Cz_PD_GVSON_MEDON(i,j) = ABE_Cz; ABE_C4_PD_GVSON_MEDON(i,j) = ABE_C4;
        MBE_C3_PD_GVSON_MEDON(i,j) = MBE_C3; MBE_Cz_PD_GVSON_MEDON(i,j) = MBE_Cz; MBE_C4_PD_GVSON_MEDON(i,j) = MBE_C4;
    end
end

ALL_TBN_C3(6) = sum(TBN_C3_PD_GVSON_MEDON, "all")/numel(TBN_C3_PD_GVSON_MEDON);
ALL_TBN_Cz(6) = sum(TBN_Cz_PD_GVSON_MEDON, "all")/numel(TBN_Cz_PD_GVSON_MEDON);
ALL_TBN_C4(6) = sum(TBN_C4_PD_GVSON_MEDON, "all")/numel(TBN_C4_PD_GVSON_MEDON);

ALL_TBT_C3(6) = sum(TBT_C3_PD_GVSON_MEDON, "all")/numel(TBT_C3_PD_GVSON_MEDON);
ALL_TBT_Cz(6) = sum(TBT_Cz_PD_GVSON_MEDON, "all")/numel(TBT_Cz_PD_GVSON_MEDON);
ALL_TBT_C4(6) = sum(TBT_C4_PD_GVSON_MEDON, "all")/numel(TBT_C4_PD_GVSON_MEDON);

ALL_ABT_C3(6) = sum(ABT_C3_PD_GVSON_MEDON, "all")/numel(ABT_C3_PD_GVSON_MEDON);
ALL_ABT_Cz(6) = sum(ABT_Cz_PD_GVSON_MEDON, "all")/numel(ABT_Cz_PD_GVSON_MEDON);
ALL_ABT_C4(6) = sum(ABT_C4_PD_GVSON_MEDON, "all")/numel(ABT_C4_PD_GVSON_MEDON);

ALL_MBT_C3(6) = sum(MBT_C3_PD_GVSON_MEDON, "all")/numel(MBT_C3_PD_GVSON_MEDON);
ALL_MBT_Cz(6) = sum(MBT_Cz_PD_GVSON_MEDON, "all")/numel(MBT_Cz_PD_GVSON_MEDON);
ALL_MBT_C4(6) = sum(MBT_C4_PD_GVSON_MEDON, "all")/numel(MBT_C4_PD_GVSON_MEDON);

ALL_ABA_C3(6) = sum(ABA_C3_PD_GVSON_MEDON, "all")/numel(ABA_C3_PD_GVSON_MEDON);
ALL_ABA_Cz(6) = sum(ABA_Cz_PD_GVSON_MEDON, "all")/numel(ABA_Cz_PD_GVSON_MEDON);
ALL_ABA_C4(6) = sum(ABA_C4_PD_GVSON_MEDON, "all")/numel(ABA_C4_PD_GVSON_MEDON);

ALL_MBA_C3(6) = sum(MBA_C3_PD_GVSON_MEDON, "all")/numel(MBA_C3_PD_GVSON_MEDON);
ALL_MBA_Cz(6) = sum(MBA_Cz_PD_GVSON_MEDON, "all")/numel(MBA_Cz_PD_GVSON_MEDON);
ALL_MBA_C4(6) = sum(MBA_C4_PD_GVSON_MEDON, "all")/numel(MBA_C4_PD_GVSON_MEDON);

ALL_ABOT_C3(6) = sum(ABOT_C3_PD_GVSON_MEDON, "all")/numel(ABOT_C3_PD_GVSON_MEDON);
ALL_ABOT_Cz(6) = sum(ABOT_Cz_PD_GVSON_MEDON, "all")/numel(ABOT_Cz_PD_GVSON_MEDON);
ALL_ABOT_C4(6) = sum(ABOT_C4_PD_GVSON_MEDON, "all")/numel(ABOT_C4_PD_GVSON_MEDON);

ALL_MBOT_C3(6) = sum(MBOT_C3_PD_GVSON_MEDON, "all")/numel(MBOT_C3_PD_GVSON_MEDON);
ALL_MBOT_Cz(6) = sum(MBOT_Cz_PD_GVSON_MEDON, "all")/numel(MBOT_Cz_PD_GVSON_MEDON);
ALL_MBOT_C4(6) = sum(MBOT_C4_PD_GVSON_MEDON, "all")/numel(MBOT_C4_PD_GVSON_MEDON);

ALL_ABE_C3(6) = sum(ABE_C3_PD_GVSON_MEDON, "all")/numel(ABE_C3_PD_GVSON_MEDON);
ALL_ABE_Cz(6) = sum(ABE_Cz_PD_GVSON_MEDON, "all")/numel(ABE_Cz_PD_GVSON_MEDON);
ALL_ABE_C4(6) = sum(ABE_C4_PD_GVSON_MEDON, "all")/numel(ABE_C4_PD_GVSON_MEDON);

ALL_MBE_C3(6) = sum(MBE_C3_PD_GVSON_MEDON, "all")/numel(MBE_C3_PD_GVSON_MEDON);
ALL_MBE_Cz(6) = sum(MBE_Cz_PD_GVSON_MEDON, "all")/numel(MBE_Cz_PD_GVSON_MEDON);
ALL_MBE_C4(6) = sum(MBE_C4_PD_GVSON_MEDON, "all")/numel(MBE_C4_PD_GVSON_MEDON);

%-------------------------------------------------------------------------

%% Defining Required Functions for Beta Burst Analysis of C3, Cz, C4

% Extracting Channels from Data
function [Signal_C3, Signal_Cz, Signal_C4] = Channel_Extracter(Data)
    Signal_C3 = transpose(Data(:,12));
    Signal_Cz = transpose(Data(:,13));
    Signal_C4 = transpose(Data(:,14));
end

% Filtering Beta Oscillations
function [Filtered_Signal_C3, Filtered_Signal_Cz, Filtered_Signal_C4] = Filter_Applier(Signal_C3, Signal_Cz, Signal_C4)
    % Defining Sampling Frequency
    fs = 500;

    % New Modified Bandpass Filter
    BPFilter = fir1(100,[13, 30]/(fs/2), "bandpass");
    
    Filtered_Signal_C3 = filter(BPFilter, 1, Signal_C3);
    Filtered_Signal_Cz = filter(BPFilter, 1, Signal_Cz);
    Filtered_Signal_C4 = filter(BPFilter, 1, Signal_C4);

end

% Finding Suitable Threshold
function [Threshold_C3, Threshold_Cz, Threshold_C4] = Threshold_Finder(filtered_Signal_C3, filtered_Signal_Cz, filtered_Signal_C4)
    Mean_C3 = sum(filtered_Signal_C3)/length(filtered_Signal_C3);
    Mean_Cz = sum(filtered_Signal_Cz)/length(filtered_Signal_Cz);
    Mean_C4 = sum(filtered_Signal_C4)/length(filtered_Signal_C4);

    STD_C3 = std(filtered_Signal_C3);
    STD_Cz = std(filtered_Signal_Cz);
    STD_C4 = std(filtered_Signal_C4);

    Threshold_C3 = Mean_C3 + 1.5 * STD_C3;
    Threshold_Cz = Mean_Cz + 1.5 * STD_Cz;
    Threshold_C4 = Mean_C4 + 1.5 * STD_C4;
end

% Finding Features of the Signal
function [TBN, TBT, ABT, MBT, ABA, MBA, ABOT, MBOT, ABE, MBE] = Feature_Finder(Filtered_Signal, Threshold)
    % Number of Beta Bursts for sample channel C3 + Total Burst Time (msec)
    % + Average Burst Time (msec)

    Burst_Detector = Filtered_Signal > (Threshold * 1.05); 
    % Ignoring Negligible Peaks by considering 5 percent of error

    burst_starts = find(diff([0, Burst_Detector]) == 1); % Start of bursts
    burst_ends = find(diff([Burst_Detector, 0]) == -1); % End of bursts

    % Ensure that starts and ends are matched correctly
    if length(burst_starts) > length(burst_ends)
        burst_ends(end + 1) = length(Filtered_Signal); % Append last index if needed
    end

    % Count number of bursts
    TBN = length(burst_starts);
    TBT = ((sum(burst_ends - burst_starts))/length(Filtered_Signal))*1000;
    ABT = TBT / TBN;
    MBT = (max(burst_ends - burst_starts) / length(Filtered_Signal))*1000;

    % Finding Average Burst Amplitude (ABA) + Maximum Burst Amplitude (MBA)
    % + Finding Average Burst Occurrence Time (ABOT)
    % + Fidning Maximum Burst Occurrence Time (MBOT)

    Burst_Maximums = zeros(1,TBN);
    Burst_Occurrences = zeros(1,TBN);

    for i = 1:1:TBN
        Burst_Maximums(i) = max(Filtered_Signal(1,(burst_starts(i)):(burst_ends(i))));
        Burst_Occurrences(i) = find(Filtered_Signal(1,(burst_starts(i)): ...
            (burst_ends(i)))==Burst_Maximums(i)) + burst_starts(i) - 1;
    end

    ABA = sum(Burst_Maximums) / length(Burst_Maximums); % Average Burst Amplitude
    MBA = max(Burst_Maximums);
    ABOT = ((sum(Burst_Occurrences) / TBN) / length(Filtered_Signal)) * 1000;

    [~, Temp2] = max(Burst_Maximums);
    MBOT = (Burst_Occurrences(Temp2) / length(Filtered_Signal)) * 1000;
    
    % Finding Burst Energy
    Burst_Energies = zeros(1,TBN);
    for i = 1:1:TBN
        Temp = Filtered_Signal(1,(burst_starts(i)):(burst_ends(i)));
        Burst_Energies(i) = sum(Temp.^2);
    end
    ABE = (sum(Burst_Energies)) / TBN;
    MBE = max(Burst_Energies);
end