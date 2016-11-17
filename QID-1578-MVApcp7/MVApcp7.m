%% clear all variables
clear
close all
clc

%% parameter settings
z1 = [0,2,3,2];
z2 = [3,2,2,1];
z  = [z1;z2];

%% plot
parallelcoords(z,'linewidth',2,'Color','k')
title('Parallel Coordinate Plot')
