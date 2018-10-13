close all
clear all
clc

%% Definition

lims = [-10 10];
DAQ_duration = 40; %inlcudes identification data and validation data
sampling_period = 0.1; %sampling period
no_points = DAQ_duration/sampling_period;
no_realizations = 1000;
for i=1:no_realizations
    s_0(i,:) = generateBinarySignal(0.0, lims, no_points);
    s_25(i,:) = generateBinarySignal(0.25, lims, no_points);
    s_50(i,:) = generateBinarySignal(0.50, lims, no_points);
    s_75(i,:) = generateBinarySignal(0.75, lims, no_points);
    s_1(i,:) = generateBinarySignal(1.0, lims, no_points);
end

Fs = 100;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = no_points;        % Length of signal = no_points
f = (0:(L/2))/L;

for i=1:no_realizations
    Y_0(i,:) = fft(s_0(i,:));
    P2_0(i,:) = abs(Y_0(i,:));
    P1_0(i,:) = P2_0(i,1:L/2+1);
    PSD_0(i,:) = (1/(50*L))*P1_0(i,:).^2;
    P1_0(i,2:end-1) = 2*PSD_0(i,2:end-1);
    
    Y_25(i,:) = fft(s_25(i,:));
    P2_25(i,:) = abs(Y_25(i,:));
    P1_25(i,:) = P2_25(i,1:L/2+1);
    PSD_25(i,:) = (1/(50*L))*P1_25(i,:).^2;
    P1_25(i,2:end-1) = 2*PSD_25(i,2:end-1);
    
    Y_50(i,:) = fft(s_50(i,:));
    P2_50(i,:) = abs(Y_50(i,:));
    P1_50(i,:) = P2_50(i,1:L/2+1);
    PSD_50(i,:) = (1/(50*L))*P1_50(i,:).^2;
    P1_50(i,2:end-1) = 2*PSD_50(i,2:end-1);
    
    Y_75(i,:) = fft(s_75(i,:));
    P2_75(i,:) = abs(Y_75(i,:));
    P1_75(i,:) = P2_75(i,1:L/2+1);
    PSD_75(i,:) = (1/(50*L))*P1_75(i,:).^2;
    P1_75(i,2:end-1) = 2*PSD_75(i,2:end-1);
    
    Y_1(i,:) = fft(s_1(i,:));
    P2_1(i,:) = abs(Y_1(i,:));
    P1_1(i,:) = P2_1(i,1:L/2+1);
    PSD_1(i,:) = (1/(50*L))*P1_1(i,:).^2;
    P1_1(i,2:end-1) = 2*PSD_1(i,2:end-1);
end

P1_0_AVG = mean(P1_0);
P1_25_AVG = mean(P1_25);
P1_50_AVG = mean(P1_50);
P1_75_AVG = mean(P1_75);
P1_1_AVG = mean(P1_1);

%% Spectrum from the mathematical expression

Spect0 = spect(f,0);
Spect25 = spect(f,0.25);
Spect50 = spect(f,0.50);
Spect75 = spect(f,0.75);
Spect1 = spect(f,1);

%% Plot

figure('units','normalized','outerposition',[0 0 1 1])
sp(1) = subplot(1,2,1);
hold on
plot(f,Spect0)
plot(f,Spect25)
plot(f,Spect50)
plot(f,Spect75)
plot(f,Spect1)
hold off
title(sp(1), 'Mathematical Spectrum of s(t)')
legend('\alpha = 0.00','\alpha = 0.25','\alpha = 0.50','\alpha = 0.75','\alpha = 1.00')
axis([0 0.5 0 3])
xlabel('f (Hz)')
ylabel('\PHI(\omega)')

sp(2) = subplot(1,2,2);
hold on
plot(f,P1_0_AVG)
plot(f,P1_25_AVG)
plot(f,P1_50_AVG)
plot(f,P1_75_AVG)
plot(f,P1_1_AVG)
hold off
title(sp(2), 'Single-Sided Amplitude Spectrum of s(t)')
legend('\alpha = 0.00','\alpha = 0.25','\alpha = 0.50','\alpha = 0.75','\alpha = 1.00')
axis([0 inf 0 15])
xlabel('f (Hz)')
ylabel('|P1(f)|')