function [bar_v] = getAverage(v,tail)

tail_length = round(tail*length(v));

% bar_v = v(end-tail_length:end);

bar_v = mean(v(end-tail_length:end));

end

