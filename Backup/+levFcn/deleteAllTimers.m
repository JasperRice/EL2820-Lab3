theTimers = timerfindall;
if ~isempty(theTimers)
    for i = 1:length(theTimers)
        stop(theTimers(i))
        delete(theTimers(i))
    end
end

clear theTimers;
clear i;