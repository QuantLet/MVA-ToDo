%% clear variables and close windows
clear
close all
clc

%% load data
xx = load('bank2.dat');

x1 = xx(:,5);
x2 = xx(:,6);
xi = [x1 x2];

%% compute bivariate kernel and plot contours
ksdensity(xi,'PlotFcn','contour') % it requires Matlab 2016
title('Swiss bank Notes' )
