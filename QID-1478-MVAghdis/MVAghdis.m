% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAghdis
% ------------------------------------------------------------------------------
% Description: MVAghdis plots three probability density functions (left) and  
%              three cumulative density functions (right) of the GH, Hyperbolic 
%              and NIG distributions.
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Two plots of pdf (left) and cdf (right) of GH, Hyperbolic and NIG
%              distributions.              
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Wolfgang Haerdle 20091002; Matlab: Awdesch Melzer 20120229
% ------------------------------------------------------------------------------

% Clear variables and close windows
clear all;
close all;
clc

% Generalised Hyperbolic Distribution
y = -6:0.1:6;
xx = y;
alpha = 1;
beta = 0;
delta = 1; 
mu = 0;    % mean
lam = 0.5; % lambda

% Generalized Hyperbolic

ghpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );

ghcdf = cumsum(ghpdf)/10;

% Normal Inverse Gaussian

 lam = -1/2;
 nigpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );
nigcdf = cumsum(nigpdf)/10;

% Hyperbolic

lam = 1;

hyppdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );
hypcdf = cumsum(hyppdf)/10;

% PDF plots
subplot(1,2,1)
hold on
box on
plot(y,ghpdf,'Color','k','Linewidth',2.5)
plot(y,nigpdf,'Color','b','Linewidth',2.5)
plot(y,hyppdf,'Color','r','Linewidth',2.5)
ylim([0,0.55]);
xlim([-6,6]);
xlabel('X');
ylabel('Y');
title('PDF of GH, HYP and NIG');
legend('GH','NIG','HYP','Location','NorthWest')

hold off
% CDF plots
subplot(1,2,2)
hold on
box on
plot(y,ghcdf,'Color','k','Linewidth',2.5)
plot(y,nigcdf,'Color','b','Linewidth',2.5)
plot(y,hypcdf,'Color','r','Linewidth',2.5)
xlabel('X');
ylabel('Y');
xlim([-6,6]);
title('CDF of GH, HYP and NIG');
legend('GH','NIG','HYP','Location','NorthWest')

hold off
