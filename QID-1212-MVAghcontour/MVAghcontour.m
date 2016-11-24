%% clear variables and close windows
clear all
close all
clc
%% set input
N       = 21;
v       = 0:0.05:1;
u       = v;
[uu vv] = meshgrid(u,v);
%% plot contours
for i = 1:6
theta  = [1, 2, 3, 10, 30, 100];
subplot(2,3,i)
gumbel = exp(-(((-log(uu)).^theta(i) ) + ((-log(vv)).^theta(i) )).^(1/theta(i)));
contour(gumbel,'ShowText','on')
str    = sprintf('Theta = %f',theta(i)); 
title(str)
set(gca,'XTick',[0 4.2 8.4 12.6 16.8 21])
set(gca,'XTickLabel',['0.0'; '0.2'; '0.4'; '0.6'; '0.8'; '1.0'])
set(gca,'YTick',[0 4.2 8.4 12.6 16.8 21])
set(gca,'YTickLabel',['0.0';'0.2'; '0.4'; '0.6'; '0.8'; '1.0'])
xlabel('u')
ylabel('v')
end
