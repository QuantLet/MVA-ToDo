%% clear all variables and console and close windows
clear
clc
close all

%% load data
data = load('bankrupt.txt');

%% set variables  
y  = data(:, 6);
x3 = data(:, 3);
x4 = data(:, 4);
x5 = data(:, 5);

%% compute logit model
[b, dev, stats] = glmfit([x3, x4, x5], [y ones(length(y), 1)], 'binomial', 'link', 'logit');

%% display results
disp('Statistics table of estimated coefficients, std. errors, test statistic and p-values');
disp('for the intercept (first line) and variables 3 to 5(lines 2 to 4)')
disp([stats.beta, stats.se, stats.t, stats.p])

