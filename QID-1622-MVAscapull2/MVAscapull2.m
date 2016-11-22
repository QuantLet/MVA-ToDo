%% clear all variables
clear all
close all
clc

%% load data
x = load('pullover.dat');

%% plot
scatter(x(:,4),x(:,1),75,'k')

title('Pullovers Data')
xlabel('Sales Assistants (X4)')
ylabel('Sales (X1)')