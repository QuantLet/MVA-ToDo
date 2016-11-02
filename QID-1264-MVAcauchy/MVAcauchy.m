% ----------------------------------------------------------------------------
% Book:        MVA
% ----------------------------------------------------------------------------
% Quantlet:    MVAcauchy
% ----------------------------------------------------------------------------
% Description: MVAcauchy plots three probability density functions (left) and 
%              three cumulative density functions (right) of the Cauchy 
%              distribution with m = 0 and different scale parameters (C1 stands
%              for a Cauchy distribution with s = 1, etc).
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Two plots of pdf (left) and cdf (right) of Cauchy distributions.              
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Wolfgang Haerdle 20091002; Matlab: Awdesch Melzer 20120229
% ------------------------------------------------------------------------------

% Clear variables and close windows
clear all;
close all;
clc;

y = -6:0.1:6;


% Cauchy distribution t=0, s=1
t = 0;
s = 1;
c1pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;
c1cdf = 0.5 + atan((y-t)/s)/pi;
% Cauchy distribution t=0, s=1.5
t = 0;
s = 1.5;
c15pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;
c15cdf = 0.5 + atan((y-t)/s)/pi;
% Cauchy distribution t=0, s=2
t = 0;
s = 2;
c2pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;
c2cdf = 0.5 + atan((y-t)/s)/pi;

% Plots of Cauchy distributions scale 1-2
subplot(1,2,1)
hold on
box on
plot(y, c1pdf, 'Color','r','Linewidth',2.5)
plot(y, c15pdf, 'Color','b','Linewidth',2.5)
plot(y, c2pdf, 'Color','g','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.4])
xlim([-6,6])
title('PDF of Cauchy distribution')
legend('C1','C1.5','C2','Location','NorthWest')
hold off

subplot(1,2,2)
hold on
box on
plot(y, c1cdf, 'Color','r','Linewidth',2.5)
plot(y, c15cdf, 'Color','b','Linewidth',2.5)
plot(y, c2cdf, 'Color','g','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,1])
xlim([-6,6])
title('CDF of Cauchy distribution')
legend('C1','C1.5','C2','Location','NorthWest')
hold off


