% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAlaplacedis
% ------------------------------------------------------------------------------
% Description: MVAlaplacedis plots three probability density functions (left) and  
%              three cumulative density functions (right) of the Laplace-distribution 
%              with different scale (L1 stands for Laplace-distribution
%              with scale 1, etc.).
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Two plots of pdf (left) and cdf (right) of Laplace-distributions.              
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Wolfgang Haerdle 20091002; Matlab: Awdesch Melzer 20120229
% ------------------------------------------------------------------------------

%Clear variables and close windows
clear all;
close all;
clc;

%Laplace Distribution

xx = -6:0.1:6;

% Laplace location 0, scale 1
theta = 0; % location
lam = 1;   % scale

lappdf1 = 1/(2*lam)*exp(-abs(xx-theta)/lam);
lapcdf1 = 1/2*exp((xx-theta)/lam).*(xx<=theta) + (1 - 1/2*exp((theta-xx)/lam)).*(xx>theta);

% Laplace location 0, scale 1.5
theta = 0; % location
lam = 1.5;   % scale

lappdf15 = 1/(2*lam)*exp(-abs(xx-theta)/lam);
lapcdf15 = 1/2*exp((xx-theta)/lam).*(xx<=theta) + (1 - 1/2*exp((theta-xx)/lam)).*(xx>theta);

% Laplace location 0, scale 2
theta = 0; % location
lam = 2;   % scale

lappdf2 = 1/(2*lam)*exp(-abs(xx-theta)/lam);
lapcdf2 = 1/2*exp((xx-theta)/lam).*(xx<=theta) + (1 - 1/2*exp((theta-xx)/lam)).*(xx>theta);

% Plot of Laplace distributions scale 1-2
subplot(1,2,1)
hold on
box on
plot(xx, lappdf1, 'Color','k','Linewidth',2.5)
plot(xx, lappdf15, 'Color','b','Linewidth',2.5)
plot(xx, lappdf2, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.52])
xlim([-6,6])
title('PDF of Laplace distribution')
legend('L1','L1.5','L2','Location','NorthWest')
hold off

subplot(1,2,2)
hold on
box on
plot(xx, lapcdf1, 'Color','k','Linewidth',2.5)
plot(xx, lapcdf15, 'Color','b','Linewidth',2.5)
plot(xx, lapcdf2, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,1])
xlim([-6,6])
title('CDF of Laplace distribution')
legend('L1','L1.5','L2','Location','NorthWest')
hold off

