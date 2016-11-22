%% clear all variable
clear all
close all
clc

%% set input
p = 0.5;
n = 5;
n2 = 35;

bsamplem = binornd(1, 0.5,n,1000);                       %Random generation of the binomial distribution with parameters 1000*n and 0.5
[bden xi] = ksdensity((mean(bsamplem) - p)/sqrt(p*(1-p)/n));  %Compute kernel density estimate


bsamplem2 = binornd(1, 0.5,n2,1000);                       %Random generation of the binomial distribution with parameters 1000*n and 0.5
[bden2 xi2] = ksdensity((mean(bsamplem2) - p)/sqrt(p*(1-p)/n2));  %Compute kernel density estimate

%% plot figure 1 n = 1
hold on
figure(1)
plot(xi,bden,'b','Linewidth',2.5)
xlabel('1000 Random Samples') 
ylabel('Estimated and Normal Density')
ylim([0, 0.45]) %Plot kernel density
plot(xi, normpdf(xi), 'r', 'Linewidth',2.5) %Plot normal density
hold off
str = sprintf('Asymptotic Distribution, n = %f ',n);
title(str)

%% plot fig 2 n = 35
figure(2)
plot(xi2,bden2,'b','Linewidth',2.5)
hold on
xlabel('1000 Random Samples') 
ylabel('Estimated and Normal Density')
ylim([0, 0.45]) %Plot kernel density
plot(xi2, normpdf(xi2), 'r', 'Linewidth',2.5) %Plot normal density

str2 = sprintf('Asymptotic Distribution, n = %f ',n2);
title(str2)