close all
clear all
clc
%% Definition

Ts = 0.001;
t = 0;
i = 0;
stair_height = 0.1; %amperage jump
stair_width = 0.2; %time for each step
stair_signal(1) = 0;
while max(stair_signal)<=10
    i = i+1;
    if t>= stair_width
        stair_signal(i+1) = stair_signal(i) + stair_height;
        t = 0;
    else
        stair_signal(i+1) = stair_signal(i);
    end
    t = t + Ts;
end
stair_signal = stair_signal(1,1:end-2);
t = 0:Ts:(length(stair_signal)*Ts);
t = t(1,1:end-1);
figure
plot(t,stair_signal)
xlabel('Time (s)')
ylabel('Stair Input (A)')

uPoints = getStationaryAverages(stair_signal, (10/stair_height+1), 0.6);

%% Experiment

y = getData(stair_signal.',Ts);
% y = y.';
yPoints = getStationaryAverages(y, (10/stair_height+1), 0.6);

%% Plot

figure
plot(uPoints,yPoints);
xlabel('Input (A)')
ylabel('Output (m)')
