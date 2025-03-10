%% Howto create a log-file
% 2024-08-24
%
% HTW Dresden, faculty of electrical engineering
% measurement engineering
% Prof. Matthias Henker
% ---------------------------------------------------------------------
% This is a simple sample script within a series of howto-files.
%
% This sample script shows how to save all messages to a log-file.
% For debugging or documentation it is sometimes sensible to save all
% messages of the command window to a file. A simple solution is to use
% the 'diary' function of Matlab. All displayed output in the command
% window can be mirrowed and saved to a file.
%
%   - for further reading type 'doc diary'
%
% just start this script (short cut 'F5') and get inspired

%% here we start

CleanMatlab = true; % true or false

% optionally clean Matlab
if CleanMatlab  % set to true/false to enable/disable cleaning
    clear;      % clear all variables from the workspace (see 'help clear')
    close all;  % close all figures
    clc;        % clear command window
end

% -------------------------------------------------------------------------
%% here we go

% we start with some preparations (save the current time)
TimeStampStart  = datetime('now', TimeZone = 'local', Format = 'yyyy-MM-dd__HH-mm-ss');

% set diary filename
diary(['myLogFile_' char(TimeStampStart) '.txt']);
diary on;                     % start logging
disp(char(45*ones(1,79)));    % line of '-' (ASCII-char 45 is '-')
disp(mfilename('fullpath'));  % print m-filename first
disp(['Test Script starts at: ' char(TimeStampStart)]);
disp(' ');

% this is a placeholder for your actual code
x = (1 : 0.5 : 3)   %#ok<NOPTS>
y = log10(x)        %#ok<NOPTS>
pause(1);

% print out text and numbers
disp(['some notes: ' num2str(y(end), '%0.3f')]);

% a more sophisticated way to print out messages
formatSpec = "We want to start the lecture at: %d:%d %s";
A1 = 09;
A2 = 20;
A3 = 'a.m.';
messageString = sprintf(formatSpec, A1, A2, A3);
disp(messageString);


% all done
disp(' ');
disp('Log-File Test Done.');
disp(' ');

% at the end of the file we stop logging
TimeStampEnd = datetime('now', TimeZone = 'local', Format = 'yyyy-MM-dd__HH-mm-ss');
%
disp(['Test Script started at: ' char(TimeStampStart)]);
disp(['Test Script ended   at: ' char(TimeStampEnd)]);
disp(char(45*ones(1,79)));    % line of '-'
diary off;                    % stop logging

% now take a look in the saved log-file

return % end of file