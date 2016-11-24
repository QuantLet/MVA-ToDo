%% clear variables and close windows
clear all
close all
clc

%% set input
theta = 3;
n     = 10000;
U     = copularnd('Gumbel',theta,n);
mu    = 0; %mean
s     = 1;  %std
yx    = erfinv(2*U-1).*sqrt(2).*s + mu;

%% plot
plot(yx(:,1),yx(:,2),'.')
title(['Gumbel Copula, {ittheta} = ',sprintf('%0.2f',theta)])
xlabel('u')
ylabel('v')
xlim([-4,4])
ylim([-4,4])
