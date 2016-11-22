%% clear all variables
clear
clc
close all

%% load data
x = load('carc.txt');
M = x(:, 2);
W = x(:, 8);
C = x(:, 13);

%% plot
gscatter(M,W,C,'krb','*o+',8)       % scatterplot of mileage vs weight grouping by country
title('Car Data')
xlabel('Mileage (X2)')
ylabel('Weight (X8)')
h = legend('USA','JAPAN','EUROPE',1); % the #1 controls for the position of the legend
set(h,'Interpreter','none')         % sets the legend on the plot