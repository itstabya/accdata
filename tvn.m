%% tvn - looking at Trial accuracy Vs Neural activity
%% question 1 does reward influence behavior in the next trial? 

%Does reward influence behavior in the next trial?
 %hypothesis - guessing that incorrect is going to be a slower reaction time

% prt is previously right trials
% pwt is previously wrong trials

response_times = [];
% reward onset - stimulus onset = response time

for t = 1:173
    if ropt(t) == 0; %this means there was no reward
        response_times = [response_times, 0];
    else;
        response_times = [response_times, ropt(t) - sopt(t)];
    end
end


prdata = []; %previously right data
pwdata = []; %previously wrong data

for t = 1:173
    if ismember(t, prt); %previously right
        prdata = [prdata, eresponset(t)];
    else %has to be a member of previously wrong
        pwdata = [pwdata, eresponset(t)];
    end
end


% count the frequency of each one
pr_counts = [];
pw_counts = [];
for c = 1:10
    pr_counts = [pr_counts, sum(prdata(:) == c)];
    pw_counts = [pw_counts, sum(pwdata(:) == c)];
end
% 
% scatter(ones(length(prdata), 1), prdata);
% hold on
% scatter(zeros(length(pwdata), 1), pwdata);

%difficult to do this analysis because there's so few trials 
%% question 2 - 
%does the neural activity influence behavior on the next trial?

% only looking at neurons of combine2n (total of 81 neurons)
% only concerned about previously correct
%look at the max from timeframes from 10 to 15
peaks = [];
 for n = 1:length(combine2)
     peak = max(combine2(10:15, n:n));
     peaks = [peaks, peak];
 end
 
 %153 correct trials 
 %81 neurons
 
 %only working with prt (previously correct trials), 151 total
 next_wrong = [];
 next_right = [];
 for t = 1:length(prt)
     trial_num = prt(t);
     if ismember(trial_num, ct)
         next_right = [next_right, trial_num];
     else
         next_wrong = [next_wrong, trial_num];
     end
 end

 nrr = []; %next right responses
 
 for t = 1:length(next_right)
     trial_num = next_right(t);
     nrr = [nrr, eresponset(trial_num)];
 end

nwr = []; %next wrong responses 

for t = 1:length(next_wrong)
    trial_num = next_wrong(t);
    nwr = [nwr, eresponset(trial_num)];
end
     
 neurons = combine2n;
 rtvsa = cell(length(neurons), 1);
 for n = 1:length(neurons)
     rtvsa{n} = cell(2, 1);
     rtvsa{n}{1} = []; %next_correct
     rtvsa{n}{2} = []; %next_incorrect
     
     for t = 1:length(prt)
         trial_num = prt(t);
         stim = sopt(trial_num);
         t1 = stim;
         t2 = stim + 10;
         %activity peak of this trial
         apt = max(neural_act_mat{trial_num}(t1:t2, n:n));
 
         %separating into correct / incorrect
         if ismember(trial_num, ct); %the next (technically current) is correct
             rtvsa{n}{1} = [rtvsa{n}{1}, apt];
         else %next is wrong
             rtvsa{n}{2} = [rtvsa{n}{2}, apt];
         end
     end
 end
             
%% plotting code
%plotting one specific neuron

% neuron_number = 1;
% scatter(rtvsa{neuron_number}{1}, nrr)
% hold on
% scatter(rtvsa{neuron_number}{2}, nwr)

corrs = [];
for n = 1:5
    figure(n)
    scatter(rtvsa{n}{1}, nrr)
    hold on
    scatter(rtvsa{n}{2}, nwr)
    corrs(n) = corr(rtvsa{n}{1}', nrr');
    xlabel('Activity on Correct Trial')
    ylabel('Response Time on Following Trial')
    legend('Correct next trial', 'Incorrect next trial')
    title('Neural Activity Influence on Behavior')
end

%%
