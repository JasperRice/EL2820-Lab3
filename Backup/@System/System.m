% MAGNETIC LEVITATOR 2017
% System class: class for hardware
% --- PROPERTY --- %
% System.session:     DAQ session created for hardware
% System.state:       current two water tank levels.      [1x2]
% System.History:     output history                      [1x1] N:time/Ts
% System.Ts:          system sampling rate                [1x1] default: 0.05
% System.sysInfo:     N & Ts                              [structure]
% --- METHOD --- %
% System.ReadData():  read data, store data.
% System.WriteData(): write data.

classdef System < handle
    properties
        session % DAQ session
        state
        controlSignal
        History
        Ts
        sysInfo
        counter
        N
        Timer
        u
        y
    end
    
    methods
        % --- METHOD: CONSTRUCTOR --- %
        function sys = System(config)
            daqreset; % safe
            sys.sysInfo = config;
            sys.session = daq.createSession('ni');
            % Output (0: lower coil, 1: upper coil)
            addAnalogOutputChannel(sys.session,'Dev1',0,'Voltage');
            % Input (0: lower laser reader, 1: upper laser reader)
            addAnalogInputChannel(sys.session,'Dev1',1,'Voltage');
            
            sys.state           = 0;
            sys.controlSignal   = 0;
            sys.History         = 0;
            sys.Ts              = config.Ts;
            sys.counter         = 0;
            sys.N               = config.N;
            sys.Timer           = timer;
            sys.u               = config.u;
            sys.y               = zeros(sys.N, 1);
        end
        
        % --- METHOD: READ DATA --- %
        function data = ReadData(obj)
            rawData = inputSingleScan(obj.session);
            data = obj.sysInfo.length(1) + diff(obj.sysInfo.length)/diff(obj.sysInfo.cal)*(rawData-obj.sysInfo.cal(1));
            obj.y(obj.counter) = data;
        end
        
        % --- METHOD: WRITE DATA --- %
        function WriteData(obj, data)
            if abs(data) < 10 && data >= 0
                outputSingleScan(obj.session, data);
            else
                disp('Error, input voltage limit reached.');
                outputSingleScan(obj.session, 0);
            end
        end
        
        % --- METHOD: PLOT DATA --- %
        function plotData(obj)
            close all;
            figure
            plot(obj.u);
            hold on;
            plot(obj.y);
            legend('u','y');
        end
    end
end

