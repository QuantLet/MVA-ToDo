% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp8
% ---------------------------------------------------------------------
% Description:  Computes curve parallel coordinates plots.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       z1 - first data point
%               z2 - second data point
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plot with cubic spline.
% ---------------------------------------------------------------------
% Example:      z1 = [0,2,3,2];
%               z2 = [3,2,2,1];
%               For two given data points, cubic spline is used to 
%               construct the parallel coordinates plot.
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

clear
close all
clc

z1=[0,2,3,2];
z2=[3,2,2,1];
z=[z1;z2];

xx=0.99:0.01:4;
x=1:4;

zz=spline(x,z,xx);

plot(x,z,'o',xx,zz, 'linewidth', 2, 'Color','k')
set(gca,'XTick',1:1:4,'YTick',0:0.5:3, 'xlim', [0.95 4.05], 'ylim', [-0.05 3.05])

title('Parallel Coordinate Plot with Cubic Spline')
xlabel('Coordinate')
ylabel('Coordinate Value')

text(1.5,1.4,'A')
text(1.5,2.5,'B')