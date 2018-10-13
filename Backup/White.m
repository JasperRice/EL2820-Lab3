close all
clear all
clc

%% Definition

lims = [6 7.5];
DAQ_duration = 40; %inlcudes identification data and validation data
sampling_period = 0.001; %sampling period
no_points = DAQ_duration/sampling_period;
rng('shuffle')
u = generateUWhiteNoise(lims, no_points);

t = 0:sampling_period:DAQ_duration;
t = t(1,1:end-1);

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