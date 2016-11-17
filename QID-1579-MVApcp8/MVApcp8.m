%% clear all variables
clear
close all
clc

%% parameter setting 
z1 = [0,2,3,2];
z2 = [3,2,2,1];
z = [z1;z2];

xx = 0.99:0.01:4;
x  = 1:4;
zz = spline(x,z,xx);

%% plot
plot(x,z,'o',xx,zz, 'linewidth', 2, 'Color','k')
set(gca,'XTick',1:1:4,'YTick',0:0.5:3, 'xlim', [0.95 4.05], 'ylim', [-0.05 3.05])

title('Parallel Coordinate Plot with Cubic Spline')
xlabel('Coordinate')
ylabel('Coordinate Value')

text(1.5,1.4,'A')
text(1.5,2.5,'B')