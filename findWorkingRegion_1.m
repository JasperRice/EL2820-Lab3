close all;
clear all;
clc;
%% 
Ts = 0.001;
t = 0;
stepHeight = 0.1;
stepWidth = 0.2;
currentMax = 6;

stair_height = 0.1; %amperage jump
stair_width = 0.5; %time for each step

%%
i = 0;
stepSignal(1) = 0;
while max(stepSignal) <= currentMax
    i = i+1;
    if t>= stepWidth
        stepSignal(i+1) = stepSignal(i) + stepHeight;
        t = 0;
    else
        stepSignal(i+1) = stepSignal(i);
    end
    t = t + Ts;
end

t = t.';
stepSignal = stepSignal.';
figure
plot(t, stepSignal)
xlabel('Time (s)')
ylabel('Stair Input (A)')

%%
y = getData(stepSignal, Ts);
yPoints = getStationaryAverages(y, (10/stair_height+1), 0.6);

