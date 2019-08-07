ert = []; %exact reward times
est = []; %exact stimulus times

%loop through
%check for which ones are one
%loop to same index in data.response.reward
    %check if zero - put zero
    %else, data.response.rewardtimes, corresponding index
indexes = find(data.response.reward);

for t  = 1:length(goodtrials)
    if goodtrials(t) %this should only trigger 173 times
        est = [est, data.response.trialstart(t)];
        if data.response.reward(t)
            track = length(find(data.response.reward(1:t)));
            ert = [ert, data.response.rewardtimes(track)];
        else
            ert = [ert, 0];
        end
    end
end

eresponset = [];

for t = 1:173
    if ert(t) == 0;
        eresponset = [eresponset, 0];
    else
    eresponset = [eresponset, ert(t) - est(t)];
    end
end

        