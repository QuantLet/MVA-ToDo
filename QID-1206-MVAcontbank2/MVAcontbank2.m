%% clear variables and close windows
clear
close all
clc

%% load data
xx = load('bank2.dat');
x  = [xx(:,5) xx(:,6)];

% plot
[f1,xi1] = ksdensity(x(:,1));
[f2,xi2] = ksdensity(x(:,2));
[f3,xi3] = ksdensity(x); %jont density;
contour(f1,f2,f3,12, 'LineWidth',3)