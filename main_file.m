% This Program is to perform preprocessing and analysis.
% This is the main script that defines and initiates other functions of
% this project
%EMG data is already given


clear all;
close all;
% 1] To load EMG DATA File
load("EMG_data.mat");
Fs=1000;              %Sampling Frequency is 1000Hz
% Extracting every row which consists of events, biceps and triceps
EMG_events=double(EMG_data(1,:));
EMG_biceps=double(EMG_data(2,:));
EMG_triceps=double(EMG_data(3,:));
EMG_time=(1:size(EMG_data,2))./Fs; 

% 2) Pre-processing the biceps muscle  
%Pre-processing the triceps muscle 
[biceps_filtered,biceps_rectified,biceps_enveloped] = preprocessing_data(EMG_biceps);

[triceps_filtered,triceps_rectified,triceps_enveloped] = preprocessing_data(EMG_triceps);

% 3) To load the kinem_data.mat (motion data)
load("kinem_data.mat");
% Extracting every row (time points, events , x & y cursor and x&y targets)
kinem_time_point=double(kinem_data(1,:));
kinem_events=double(kinem_data(2,:));
x_cursor=double(kinem_data(3,:));
y_cursor=double(kinem_data(4,:));
x_target=double(kinem_data(5,:));
y_target=double(kinem_data(6,:));

% 4) Extracting different set for the given epoch intervals 
extracting_dataset(1,EMG_biceps,EMG_triceps,x_cursor,y_cursor,x_target,y_target,EMG_time,EMG_events,kinem_time_point,kinem_events);
extracting_dataset(6,EMG_biceps,EMG_triceps,x_cursor,y_cursor,x_target,y_target,EMG_time,EMG_events,kinem_time_point,kinem_events);
extracting_dataset(10,EMG_biceps,EMG_triceps,x_cursor,y_cursor,x_target,y_target,EMG_time,EMG_events,kinem_time_point,kinem_events);
extracting_dataset(11,EMG_biceps,EMG_triceps,x_cursor,y_cursor,x_target,y_target,EMG_time,EMG_events,kinem_time_point,kinem_events);
