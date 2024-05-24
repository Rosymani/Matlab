function [] = extracting_dataset(num,EMG_biceps,EMG_triceps,x_cursor,y_cursor,x_target,y_target,EMG_time_points,EMG_events,kinem_time_points,kinem_events)
%This is used to get set of interval

% Total epoch timeline we have given 
timeline_start = 1:96:1057;
timeline_end = 96:96:1152;
% To select the coresponding timeline interval based on the set number
epoch_start = timeline_start(num);
epoch_end = timeline_end(num);

% Selecting the events (cue and go) inorder to segment into sets 
EMG_extract_event = EMG_time_points(EMG_events > 0);
kinem_extract_event=diff((kinem_events  == 2 | kinem_events ==3));
kinem_extract_start = kinem_time_points((kinem_extract_event )< 0);
kinem_extract_end = kinem_time_points((kinem_extract_event) > 0);

if (isempty(EMG_extract_event)==0 && isempty(kinem_extract_start)==0 && isempty(kinem_extract_end)==0)
    % Checking and fiing the interval for the given span
    EMG_set = EMG_time_points> EMG_extract_event(epoch_start) & EMG_time_points< EMG_extract_event(epoch_end);
    kinem_set = kinem_time_points > kinem_extract_start(epoch_start) &kinem_time_points < kinem_extract_end(epoch_end);               
    EMG_interval = EMG_time_points(EMG_set) - EMG_extract_event(epoch_start);
    kinem_interval = kinem_time_points(kinem_set) - kinem_extract_start(epoch_start);
    
    % Plotting the data for the selected set of values
    plotting_function(num,EMG_biceps,EMG_triceps,x_cursor,y_cursor,x_target,y_target,EMG_interval,EMG_set,kinem_interval,kinem_set)

    

end
end

