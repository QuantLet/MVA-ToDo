% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAmixture
% ------------------------------------------------------------------------------
% Description: MVAmixture plots two probability density functions (left) and  
%              two cumulative density functions (right) of Gaussian mixture and
%              Gaussian distributions.
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Two plots of pdf (left) and cdf (right) of Gaussian mixture and
%              Gaussian distributions.              
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Wolfgang Haerdle 20091002; Matlab: Awdesch Melzer 20120229
% ------------------------------------------------------------------------------

% Clear variables and close windows
clear all;
close all;
clc;

%Gaussian Mixture and Gaussian distribution

x = -6:0.01:6;

gaussmixpdf = 1./(5*(2*pi).^(1/2))*(4*exp(-x.^2/2)+1/3*exp(-x.^2/18));
gaussmixcdf = 0.8*normcdf(x,0,0.1)+0.2*normcdf(x,0,0.9);
gausspdf = normpdf(x);
gausscdf = normcdf(x);

% Plot of Gaussian and Gaussian mixture distributions
subplot(1,2,1)
hold on
box on
plot(x, gaussmixpdf, 'Color','b','Linewidth',2.5)
plot(x, gausspdf, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.42])
xlim([-6,6])
title('PDF of a Gaussian mixture and Gaussian')
legend('Gaussian mixture','Gaussian','Location','SouthOutside')
hold off

subplot(1,2,2)
hold on
box on
plot(x, gaussmixcdf, 'Color','b','Linewidth',2.5)
plot(x, gausscdf, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,1])
xlim([-6,6])
title('CDF of a Gaussian mixture and Gaussian')
legend('Gaussian mixture','Gaussian','Location','SouthOutside')
hold off
