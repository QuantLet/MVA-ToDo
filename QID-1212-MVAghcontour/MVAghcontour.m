% ------------------------------------------------------------------------------
% Book:         MVA                                                 
% ------------------------------------------------------------------------------
% Quantlet:     MVAghcontour
% ------------------------------------------------------------------------------
% Description:  MVAghcontour gives contour plots of Gumbel-Hougard copula for 
%               different theta values (1, 2, 3, 10, 30 and 100)
% ------------------------------------------------------------------------------
% Usage:        gumbelcopula
% ------------------------------------------------------------------------------
% Inputs:       None
% ------------------------------------------------------------------------------
% Output:       Produces contour plots of the Gumbel-Hougard copula.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Awdesch Melzer 20120301
% ------------------------------------------------------------------------------

% clear variables and close windows
clear all;
close all;
clc;

% Gumbel H Copula is defined as: C(u,v) = exp - ( (-log u)^theta + (-log v)^theta )^(1/theta)


N = 21;
v = 0:0.05:1;
u = v;
[uu vv] = meshgrid(u,v);

for i = 1:6
   theta = [1, 2, 3, 10, 30, 100];
subplot(2,3,i)
w = gumbelcopula(uu, vv, theta(i));
x = contour(w);
str = sprintf('Theta = %f',theta(i)); 
title(str);
set(gca,'XTick',[0 4.2 8.4 12.6 16.8 21])
set(gca,'XTickLabel',['0.0'; '0.2'; '0.4'; '0.6'; '0.8'; '1.0']);
set(gca,'YTick',[0 4.2 8.4 12.6 16.8 21])
set(gca,'YTickLabel',['0.0';'0.2'; '0.4'; '0.6'; '0.8'; '1.0']);
  xlabel('u');
  ylabel('v');
end
