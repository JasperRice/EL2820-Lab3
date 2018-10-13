close all
clear all
clc

%% Definition

lims = [-10 10];
DAQ_duration = 40; %inlcudes identification data and validation data
sampling_period = 0.1; %sampling period
no_points = DAQ_duration/sampling_period;
alpha = 0.75;

t = 0:sampling_period:DAQ_duration;
t = t(1,1:end-1);

u = generateBinarySignal(alpha, lims, no_points);

%% Experiment

% y = getData(u.',sampling_period);
% y = y.';

%% Plot

figure
plot(t,u)
xlabel('Time (s)')
ylabel('Input (A)')

% figure
% plot(t,y)
% xlabel('Time (s)')
% ylabel('Output (m)')