% ----------------------------------------------------------------------------
% Book:         MVA
% ----------------------------------------------------------------------------
% Quantlet:    MVAcltbern
% ----------------------------------------------------------------------------
% Description:  MVAcltbern illustrates the (univariate) Central Limit Theorem 
%              (CLT). n*1000 sets of n-dimensional Bernoulli samples are
%              generated and used to approximate the distribution of
%              t = sqrt(n)*(mean(x)-mu)/sigma -> N(0,1). The estimated density 
%              (blue) of t is shown together with the standard normal (red).
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None
% ------------------------------------------------------------------------------
% Output:       Plots the CLT estimate for Bernoulli distributed random 
%               variables together with the standard normal distribution.
% ------------------------------------------------------------------------------
% Example:      Two example are generated with n=5 and n=35.
% ------------------------------------------------------------------------------
% Author:       Wolfgang Haerdle 20091001; Matlab: Awdesch Melzer 20120228 
% ------------------------------------------------------------------------------


clear all
close all
clc

p = 0.5;
n = 5;

bsamplem = binornd(1, 0.5,n,1000);                       %Random generation of the binomial distribution with parameters 1000*n and 0.5
[bden xi] = ksdensity((mean(bsamplem) - p)/sqrt(p*(1-p)/n));  %Compute kernel density estimate
hold on
plot(xi,bden,'b','Linewidth',2.5)
xlabel('1000 Random Samples') 
ylabel('Estimated and Normal Density')
ylim([0, 0.45]) %Plot kernel density
plot(xi, normpdf(xi), 'r', 'Linewidth',2.5) %Plot normal density
hold off

str = sprintf('Asymptotic Distribution, n = %f ',n);
title(str)