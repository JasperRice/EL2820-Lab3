function stopTimerFunction(~,~,magLev)
    disp('timer stopped');
    levFcn.deleteAllTimers;
    magLev.WriteData(0);
    magLev.plotData;
end