% set parameter values;
clc;
clear;

%%%%%%%%% default setting %%%%%%%%%%%%
% neurons = [2, 3];
% learning_rate = 0.05;
% niter = 1e5;
%%%%%%%%% default setting %%%%%%%%%%%%

%%%%%%%%% current setting %%%%%%%%%%%%
neurons = [6, 7];
learning_rate = 0.05;
niter = 6e6;
%%%%%%%%% current setting %%%%%%%%%%%%

% try
main_nn(neurons, learning_rate, niter);
