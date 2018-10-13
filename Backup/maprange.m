function [fixed_x] = maprange(x,lims)

if lims(1) > lims(2)
    lims_temp = lims(1);
    lims(1) = lims(2);
    lims(2) = lims_temp;
end

des_range = lims(2) - lims(1);
cur_range = max(x) - min(x);

if cur_range == 0
    if max(x) == 1
        for i=1:length(x)
            fixed_x(i) = lims(2);
        end
    else
        for i=1:length(x)
            fixed_x(i) = lims(1);
        end
    end
else
    str_x = x*(des_range/cur_range);
    
    for i=1:length(str_x)
        fixed_x(i) = str_x(i)+(lims(1)-min(str_x));
    end
end

% s = A*u + B
% A = (des_range/cur_range)
% B = (lims(1)-min(str_x))

end

