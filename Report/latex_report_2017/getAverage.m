function bar_v = getAverage(v, tail)
    bar_v = mean(v(length(v)*tail/100 + 1 : end));
end