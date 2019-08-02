

function [array] = loop_across(neural_mat, trial_list, timeframe_list, k)
    tfs = 23;
    cell_container = cell(tfs, 1);
    for i = 1:length(trial_list) 
        trial_num = trial_list(i);
        start = timeframe_list(trial_num) - 6; %always 6 timeframes before 
        
        for j = 1:length(cell_container)
            cell_container{j} = [cell_container{j}, neural_mat{trial_num}(start + j, k)];
        end
    end
    
    array = cell2mat(cell_container);


end
