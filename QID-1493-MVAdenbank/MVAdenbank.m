%% clear variables and close windows
clear
close all
clc

%% load data
x  = load('bank2.dat');      
x1 = x(1:100,6);
x2 = x(101:200,6);

[f1,xi1] = ksdensity(x1); 
[f2,xi2] = ksdensity(x2);

%% plot
hold on
plot(xi1,f1,'LineWidth',2,'Color','k')
plot(xi2,f2,'LineWidth',2,'Color','r','LineStyle',':')
title('Swiss bank notes')
xlabel('Counterfeit              /             Genuine')
ylabel('Density estimates for diagonals')
hold off