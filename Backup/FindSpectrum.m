close all
clear all
clc

%% Definition

lims = [2 8];
DAQ_duration = 40; %inlcudes identification data and validation data
sampling_period = 0.001; %sampling period
no_points = DAQ_duration/sampling_period;
no_experiments = 5;
for i=1:no_experiments
    rng('shuffle')
    u(i,:) = generateUWhiteNoise(lims, no_points);
end

%% Experiment

for i=1:no_experiments
    y(i,:) = getData(u(i,:).',sampling_period);
    y = y.';
end

Fs = 100;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = no_points;        % Length of signal = no_points
f = (0:(L/2))/L;

for i=1:no_experiments
    Y(i,:) = fft(y(i,:)-mean(y(i,:),2));
    P2(i,:) = abs(Y(i,:));
    P1(i,:) = P2(i,1:L/2+1);
    PSD(i,:) = (1/(50*L))*P1(i,:).^2;
    P1(i,2:end-1) = 2*PSD(i,2:end-1);
end

P1_AVG = mean(P1);

%% Plot

figure
plot(f,P1_AVG)
title(sp(2), 'Single-Sided Amplitude Spectrum of y(t)')
legend('\alpha = 0.00','\alpha = 0.25','\alpha = 0.50','\alpha = 0.75','\alpha = 1.00')
axis([0 inf 0 15])
xlabel('f (Hz)')
ylabel('|P1(f)|')