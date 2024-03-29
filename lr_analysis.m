%%

%max/min neural activity and corresponding index
[left_max, lmaxi] = max(all_left);
[left_min, lmini] = min(all_left);
[right_max, rmaxi] = max(all_right);
[right_min, rmini] = min(all_right);

%all_left and all_right are both 20 timeframes x 180 neurons


%% PLOTS

figure(1)
scatter(x, lmaxi)
hold on
scatter(x, lmini, 'r')
title('Time of Max and Min of Left Stim')
legend('max', 'min')
xlabel('Neuron #')
ylabel('Timeframe')

figure(2)
scatter(x, left_max)
hold on
scatter(x, left_min, 'r')
title('Neural Activity of Max and Min of Left Stim')
legend('max', 'min')
xlabel('Neuron #')
ylabel('Neural Activity')

figure(3)
scatter(x, rmaxi)
hold on
scatter(x, rmini, 'r')
title('Time of Max and Min of Right Stim')
legend('max', 'min')
xlabel('Neuron #')
ylabel('Timeframe')

figure(4)
scatter(x, right_max)
hold on
scatter(x, right_min, 'r')
title('Neural Activity of Max and Min of Right Stim')
ylim([-1, 2])
legend('max', 'min')
xlabel('Neuron #')
ylabel('Neural Activity')

%% counting how many neurons for each 
%recall that we're doing 23 timeframes
tfs = 23;
lmaxc = zeros(tfs, 1); %lmax = left max count
lminc = zeros(tfs, 1);
rmaxc = zeros(tfs, 1);
rminc = zeros(tfs, 1);
for i = 1:tfs
    lmaxc(i) = sum(lmaxi(:) == i);
    lminc(i) = sum(lmini(:) == i);
    rmaxc(i) = sum(rmaxi(:) == i);
    rminc(i) = sum(rmini(:) == i);
end

figure(5)
plot(lmaxc)
hold on
plot(lminc, 'r')
title('Neuron Max/Min Count Per Timeframe on Left Stim')
legend('max', 'min')
xlabel('Timeframe')
ylabel('Neuron Count')

figure(6)
plot(rmaxc)
hold on
plot(rminc, 'r')
title('Neuron Max/Min Count Per Timeframe on Right Stim')
legend('max', 'min')
xlabel('Timeframe')
ylabel('Neuron Count')

