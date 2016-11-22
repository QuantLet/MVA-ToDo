%% clear all variables
clear
clc
close all

%% load data
x = load('pullover.dat');    

%% plot
scatter(x(:,2),x(:,1),25,'k','SizeData',75)
title('Pullovers Data')
xlabel('Price (X2)')
ylabel('Sales (X1)')
xlim([78 127])
 