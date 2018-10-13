function [bar_y] = getStationaryAverages(y_step, Nwr, tail)

wrLen = length(y_step)/Nwr;

for i=1:Nwr
    bar_y(i) = getAverage(y_step((i-1)*wrLen+1:(i)*wrLen),tail);
end

end

