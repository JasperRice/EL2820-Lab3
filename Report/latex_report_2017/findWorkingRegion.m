close all; clear all; clc;
%% Initialization
Ts = 0.001;
t = 0;
i = 1;
maxCurrent = 10;
stairHeight = 0.1;
stairDuration = 0.2;

%% Create Stair Signal
stairSignal(i) = 0;
while true
    t = t + Ts;
    i = i + 1;
    if t < stairDuration
        stairSignal(i) = stairSignal(i-1);
    else
        if stairSignal(i-1) + stairHeight > maxCurrent
            break
        end
        stairSignal(i) = stairSignal(i-1) + stairHeight;
        t = 0;
    end
end
t = 0 : Ts : (length(stairSignal)-1) * Ts;
t = t.';
stairSignal = stairSignal.';

%% Plot Stair Signal and Time
figure
plot(t,stairSignal)
xlabel('Time (s)')
ylabel('Stair Input (A)')

%% Input Signal Amplitudes
averagedU = getStationaryAverages(stairSignal, (maxCurrent/stairHeight+1), 0.6);

%% Conducting Experiment
y = getData(stairSignal, Ts);

%% Averaged Output Signal
averagedY = getStationaryAverages(y, (10/stairHeight+1), 0.6);

%% Plot to Find Working Region
figure
plot(averagedU,averagedY);
xlabel('Input (A)')
ylabel('Output (cm)')
