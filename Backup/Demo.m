close all
clear all
clc

%% Definition

load('inputSignalDemo.mat')

t = 0:Ts:N*Ts;
t = t(1,1:end-1);

%% Plot

figure
plot(t,u)
xlabel('Time (s)')
ylabel('Input (A)')

figure
plot(t,y)
xlabel('Time (s)')
ylabel('Output (m)')