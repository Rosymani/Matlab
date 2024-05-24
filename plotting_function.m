function [] = plotting_function(num,EMG_biceps,EMG_triceps,x_cursor,y_cursor,x_target,y_target,EMG_interval,EMG_set,kinem_interval,kinem_set)
%The function to observe and help us with plotting

% Pre-processing to get enveloped signals and filtered rectified 
[biceps_filtered,biceps_rectified,biceps_enveloped] = preprocessing_data(EMG_biceps);
[triceps_filtered,triceps_rectified,triceps_enveloped] = preprocessing_data(EMG_triceps);

% Plotting the signalsto be plotted
figure;
subplot(3,2,1);
hold on
plot( EMG_interval,  EMG_biceps(EMG_set),'b')
plot( EMG_interval,  biceps_filtered(EMG_set),'g')
xlabel('time')
ylabel('Amplitude')
title('Raw and Filtered Biceps')
legend('raw signal','filtered signal')

subplot(3,2,2);
hold on
plot( EMG_interval,  EMG_triceps(EMG_set),'b')
plot( EMG_interval,  triceps_filtered(EMG_set),'g')
xlabel('time')
ylabel('Amplitude')
title(' Raw and Filtered Triceps')
legend('raw signal','filtered signal')

subplot(3,2,3);
hold on
plot( EMG_interval,  biceps_rectified(EMG_set),'b')
plot( EMG_interval,  biceps_enveloped(EMG_set),'g')
xlabel('time')
ylabel('Amplitude')
title('Rectified and Enveloped Biceps')
legend('rectified signal','enveloped signal')

subplot(3,2,4);
hold on
plot( EMG_interval,  triceps_rectified(EMG_set),'b')
plot( EMG_interval,  triceps_enveloped(EMG_set),'g')
xlabel('time')
ylabel('Amplitude')
title('Rectified and Enveloped Triceps')
legend('rectified signal','enveloped signal')

subplot(3,2,5);
hold on
plot( kinem_interval, x_cursor(kinem_set),'b')
plot( kinem_interval, y_cursor(kinem_set),'g')
xlabel('time')
ylabel('Position')
title('Movement signal X and Y in time')
legend('x cursor','y cursor')

subplot(3,2,6);
hold on
plot( x_cursor(kinem_set), y_cursor(kinem_set),'b') ;
plot( x_target(kinem_set), y_target(kinem_set),'.','MarkerSize',25,'MarkerFaceColor','green','MarkerEdgeColor','g');
xlabel('x-position')
ylabel('y-position')
title('The XY movement signal together with target')
legend('xy movement','target')

if num ==1
    sgtitle('Set 1 - First set of no force')
elseif num ==6
    sgtitle('Set 6 - First sets of force field')
elseif num ==10
    sgtitle('Set 10 - Last sets of force field')
elseif num ==11
    sgtitle('Set 11- First set of washout')
end
end


