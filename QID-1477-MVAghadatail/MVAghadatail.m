% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAghadatail
% ------------------------------------------------------------------------------
% Description: MVAghadatail plots four probability density functions (left) and  
%              four tails (right) in comparison of the NIG, the Laplace, the Cauchy
%              and the Gauss distribution
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Two plots of pdf (left) and tails (right) of NIG, Laplace, Cauchy
%              and Gauss distribution.              
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Wolfgang Haerdle 20091002; Matlab: Awdesch Melzer 20120229
% ------------------------------------------------------------------------------

% Clear variables and close windows
clear all;
close all;
clc;


% Graphical comparison of the NIG distribution and normal distribution
xx = -6:0.1:6;

% Gaussian pdf
gaussianpdf = normpdf(xx);

% Laplace pdf
theta = 0; % location
lam = 1;   % scale

lappdf1 = 1/(2*lam)*exp(-abs(xx-theta)/lam);

% Cauchy distribution t=0, s=1
y = xx;
t = 0;
s = 1;
c1pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;

% Normal Inverse Gaussian
alpha = 1;
beta = 0;
delta = 1; 
mu = 0;    % mean
lam = -1/2;
nigpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );


subplot(1,2,1)
hold on
box on
plot(xx, lappdf1, 'Color','k','Linewidth',2.5,'LineStyle','--')
plot(xx, nigpdf, 'Color','g','Linewidth',2.5)
plot(xx, c1pdf,'o', 'Color','b','Linewidth',1)
plot(xx, gaussianpdf, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.55])
title('Distribution comparison')
legend('Laplace','NIG','Cauchy','Gaussian','Location','NorthWest')
hold off

subplot(1,2,2)
hold on
box on
plot(xx, lappdf1, 'Color','k','Linewidth',2.5,'LineStyle','--')
plot(xx, nigpdf, 'Color','g','Linewidth',2.5)
plot(xx, c1pdf,'o', 'Color','b','Linewidth',1)
plot(xx, gaussianpdf, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.02])
xlim([-5,-4])
title('Tail comparison')
legend('Laplace','NIG','Cauchy','Gaussian','Location','NorthWest')
hold off

