function mainLoop(~, ~, magLev)
%% Counter Updating
magLev.counter = magLev.counter + 1;

%% Data Reading
magLev.ReadData; % Reads all defined inputs at the same time.

%% Data Printing
% disp('t = ');
% disp(magLev.counter);
% disp('data');
% disp(magLev.y(magLev.counter));

%% Data Writing
magLev.WriteData(magLev.u(magLev.counter));

end