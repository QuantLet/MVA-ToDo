%% Clear loaded variables and close graphic windows
clear all
close all
clc

%% set input
p  = 0.5;
n  = 85; %vary n=5, n=85

bsample     = binornd(1,0.5,n,2000);          %Random generation of the binomial distribution with parameters 2000*n and 0.5
bsamplem    = (mean(bsample) - p)/sqrt(p*(1-p)/n);
bsamplemstd = [bsamplem(1:1000);bsamplem(1001:2000)]';

%% plot
figure
ksdensity(bsamplemstd)