% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAedfnormal
% ---------------------------------------------------------------------
% Description:  MVAedfnormal draws n observations from a standard normal
%               distribution and plots its empirical distribution function
%               (edf) vs. the normal cumulative distribution function 
%               (cdf). Number of draws can be entered interactively.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       n - number of observations
% ---------------------------------------------------------------------
% Output:       Draws n observations from a standard normal
%               distribution and plots its empirical distribution
%               function (edf) vs. the normal cumulative distribution
%               function (cdf).
% ---------------------------------------------------------------------
% Example:      n=100
%               n=1000
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

close all
clear
clc

disp('Please input number of draws n as') ;
disp(' ') ;
n=input('[n]=');

y = normrnd(0,1,n,1); %Generate standard normal random numbers
cdfplot(y)            %Plot the empirical distribution function

hold on

x = -3:0.1:3;
f = normcdf(x,0,1);   %Generate normal cumulative distribution function

plot(x,f,'r','LineWidth',2.5)
legend('Empirical','Theoretical','Location','NW')
title('EDF and CFD')
xlabel('X')
ylabel('EDF(X), CDF(X)')

hold off