% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAsample1000
% ------------------------------------------------------------------------------
% Description: MVAsample1000 produces Gumbel-Hougaard copula sampling for fixed 
%              parameters sigma and theta.
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Produces sample for fixed theta and sigma.
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Awdesch Melzer 20120306
% ------------------------------------------------------------------------------

%clear variables and close windows
clear all;
close all;
clc;


disp('Please input Gumbel parameter theta, Number of observations n] as: [3, 10000]') ;
disp(' ') ;
para = input('[Gumbel parameter theta, Number of observations n] = ');
while length(para) < 2
  disp('Not enough input arguments. Please input in 1*2 vector form like [3, 10000] or [3 10000]');
  para = input('[Gumbel parameter theta, Number of observations n] = ');
end

theta = para(1);
n = para(2);

if (theta<1)	   % Constraint of theta
  disp('Could you please choose a larger theta? Please input again')
  theta=input('theta=');
end



theta = 3;
n = 10000;

U = copularnd('Gumbel',theta,n);
mu = 0; %mean
s = 1;  %std

yx = erfinv(2*U-1).*sqrt(2).*s + mu;


plot(yx(:,1),yx(:,2),'.')
title(['Gumbel Copula, {ittheta} = ',sprintf('%0.2f',theta)])
xlabel('u')
ylabel('v')
xlim([-4,4])
ylim([-4,4])
