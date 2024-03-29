%% Analyzing data from trials that satisfy both a particular difficulty level and if correct or not

%% creating the overlapping trials
c1 = intersect(t1, ct);
ic1 = intersect(t1, wt);

c2 = intersect(t2, ct);
ic2 = intersect(t2, wt);

c3 = intersect(t3, ct);
ic3 = intersect(t3, wt);

c4 = intersect(t4, ct);
ic4 = intersect(t4, wt);

%% 
ac1 = cell(1, 180);
aic1 = cell(1, 180);
ac2 = cell(1, 180);
aic2 = cell(1, 180);
ac3 = cell(1, 180);
aic3 = cell(1, 180);
ac4 = cell(1, 180);
aic4 = cell(1, 180);
ac34 = cell(1, 180);

for k = 1:180
    c1_array = loop_across(neural_act_mat, c1, sopt, k);
    ic1_array = loop_across(neural_act_mat, ic1, sopt, k);
    
    c2_array = loop_across(neural_act_mat, c2, sopt, k);
    ic2_array = loop_across(neural_act_mat, ic2, sopt,  k);
    
    c3_array = loop_across(neural_act_mat, c3, sopt, k);
    ic3_array = loop_across(neural_act_mat,ic3, sopt, k);
    
    c4_array = loop_across(neural_act_mat, c4, sopt, k);
    ic4_array = loop_across(neural_act_mat, ic4, sopt, k);
    
    combined34_array = loop_across(neural_act_mat, combined34, sopt, k);
    
    ac1{k} = mean(c1_array, 2);
    aic1{k} = mean(ic1_array, 2);
    ac2{k} = mean(c2_array, 2);
    aic2{k} = mean(ic2_array, 2);
    ac3{k} = mean(c3_array, 2);
    aic3{k} = mean(ic3_array, 2);
    ac4{k} = mean(c4_array, 2);
    aic4{k} = mean(ic4_array, 2);
    ac34{k} = mean(combined34_array, 2);
end
    
all_c1 = cell2mat(ac1);
all_ic1 = cell2mat(aic1);
all_c2 = cell2mat(ac2);
all_ic2 = cell2mat(aic2);
all_c3 = cell2mat(ac3);
all_ic3 = cell2mat(aic3);
all_c4 = cell2mat(ac4);
all_ic4 = cell2mat(aic4);
all_c34 = cell2mat(ac34);
    
%% splitting these cells

% only focusing on level 1 and 2 difficulty levels

%combine 3 and 4 trials  - > make the plots - > classify neurons into red /
%blue

[combine1, combine2, combine1n, combine2n] = split_neurons(ac34);

[correct1r, correct1b] = separate(ac1, combine1n, combine2n);
[correct2r, correct2b] = separate(ac2, combine1n, combine2n);
[incorrect2r, incorrect2b] = separate(aic2, combine1n, combine2n);
[incorrect1r, incorrect1b] = separate(aic1, combine1n, combine2n);
[incorrect2r, incorrect2b] = separate(aic2, combine1n, combine2n);

figure(1)
plot(correct1r, 'r')
hold on
plot(correct1b, 'b')
title('Neural Activity from Correct and Difficulty Level One Trials')
% legend('r neurons from lv 3 + 4', 'b neurons from lv 3 + 4')
xlabel('Timeframe')
ylabel('Neural Activity')

figure(2)
plot(incorrect1r, 'r')
hold on
plot(incorrect1b, 'b')
title('Neural Activity from Incorrect and Difficulty Level One Trials')
% legend('r neurons from lv 3 + 4', 'b neurons from lv 3 + 4')
xlabel('Timeframe')
ylabel('Neural Activity')
