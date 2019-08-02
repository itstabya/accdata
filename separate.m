function [r, b] = separate(c, combine1n, combine2n)
    cr = cell(1, 180);
    cb = cell(1, 180);
    for n = 1:180
        if ismember(n, combine1n);
            cr{n} = c{n};
        else ismember(n, combine2n);
                cb{n} = c{n};
        end
    end
    r = cell2mat(cr);
    b = cell2mat(cb);
            
            