function initPTB
% Mac OSX High Sierra Problem 
% Kernel Patch does not solve it, big issue because of Intel Graphics
% Driver ...
Screen('Preference', 'SkipSyncTests', 1); 
% PsychDebugWindowConfiguration;

% Clear the workspace and the screen
sca;
close all;
clear vars;

% Default settings for PsychToolBox
PsychDefaultSetup(2);
end