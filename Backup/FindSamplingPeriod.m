close all
clear all
clc

%% Definition

wrMin = 2;
wrMax = 8;
step_time = 2;
step_total_duration = 10;
Ts = 0.001;
for i=1:(step_time/Ts)
    step_signal(i) = wrMin;
end
for i=(step_time/Ts+1):(step_total_duration/Ts)
    step_signal(i) = wrMax;
end

t = 0:Ts:(length(step_signal)*Ts);
t = t(1,1:end-1);
figure
plot(t,step_signal)
xlabel('Time (s)')
ylabel('Step Input (A)')

%% Experiment

y = getData(step_signal.',Ts);
y = y.';

%% Plot

figure
hold on
plot(t,step_signal)
plot(t,y)
hold off
legend('Step Input','System Output')
xlabel('Time (s)')
ylabel('Input (A), Output (m)')