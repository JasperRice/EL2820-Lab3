function y = getData(u, Ts)
    %% CLEAR PREVIOUS EXPERIMENTS
    levFcn.FreshClear;

    %% INITIALIZE SYSTEM
    config.Ts = Ts;
    config.NumSampleToHistory = 10; %12000;
    config.max_vol_in = 10;
    config.max_vol = 1.1;
    config.N = length(u);
    config.u = u;
    config.length = [8 10];
    config.cal = [1.3065 2.8319];
    magLev = System(config);

    %% INITIALIZE TIMER
    magLev.Timer = timer;
    magLev.Timer.ExecutionMode = 'fixedRate';
    magLev.Timer.Period = magLev.Ts;
    magLev.Timer.TimerFcn = {@levFcn.mainLoop, magLev}; % MAIN LOOP EXECUTED BY TIMER
    magLev.Timer.StartFcn = @(~,~) disp('Running experiment...');
    magLev.Timer.StopFcn = {@levFcn.stopTimerFunction, magLev};
    magLev.Timer.TasksToExecute = magLev.N;

    %% START EXPERIMENT
    start(magLev.Timer);
    while ~isempty(timerfindall)
    end
    y = magLev.y;
    
end