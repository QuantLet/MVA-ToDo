%% clear all variable
clear all
close all
clc

%% set input
p = 0.5;
n = 5; % vary n = 35; n = 5

bsamplem = binornd(1, 0.5,n,1000);                       %Random generation of the binomial distribution with parameters 1000*n and 0.5
[bden xi] = ksdensity((mean(bsamplem) - p)/sqrt(p*(1-p)/n));  %Compute kernel density estimate

%% plot
hold on
plot(xi,bden,'b','Linewidth',2.5)
xlabel('1000 Random Samples') 
ylabel('Estimated and Normal Density')
ylim([0, 0.45]) %Plot kernel density

plot(xi, normpdf(xi), 'r', 'Linewidth',2.5) %Plot normal density
hold off
str = sprintf('Asymptotic Distribution, n = %f ',n);
title(str)
