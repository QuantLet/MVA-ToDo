%% clear variables and close windows
clear
close all
clc

%% load data
xx = load('bank2.dat');
x  = [xx(:,5) xx(:,6)];
h  = 1.06*[std(xx(:, 5)) std(xx(:, 6))].* 200.^(-1/5);

% plot
[f1,xi1] = ksdensity(x(:,1));
[f2,xi2] = ksdensity(x(:,2));

contour(f1'*f2,8,'LineWidth',3)
