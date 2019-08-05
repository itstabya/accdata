%%

%tvn = trial accuracy vs neural activity

%% question 1 does reward influence behavior in the next trial? 

% steps - ONLY LOOK AT THE BLUE NEURONS (GROUPED FROM 3 AND 4) combine2n


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
        prdata = [prdata, response_times(t)];
    else %has to be a member of previously wrong
        pwdata = [pwdata, response_times(t)];
    end
end

scatter(ones(length(prdata), 1), prdata,'b')
hold on
scatter(ones(length(pwdata), 1) + 1, pwdata, 'r')
legend('Previously right', 'Previously wrong')

% count the frequency of each one
pr_counts = [];
pw_counts = [];
for c = 1:10
    pr_counts = [pr_counts, sum(prdata(:) == c)];p
    pw_counts = [pw_counts, sum(pwdata(:) == c)];
end

%% question 2 - 
 

 