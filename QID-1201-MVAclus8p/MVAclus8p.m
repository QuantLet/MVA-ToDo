% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAclus8p
% ------------------------------------------------------------------------------
% Description: MVAclus8p performs cluster analysis for 8 data points.
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      x - 8x1 vector
%              y - 8x1 vector
% ------------------------------------------------------------------------------
% Output:      Plot for the 8 data points and for the Dendrogram of the 8 data 
%              points after applying the Single linkage algorithm.
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Zografia Anastasiadou 20100503; Matlab: Awdesch Melzer
%              20120329
% ------------------------------------------------------------------------------

% clear variables, close windows
clear all;
close all;
clc;

% create matrix from 8 data points
x = [5,2,-2,-3,-2,-2,1,1]';
y = [-3,-4,-1,0,-2,4,2,4]';   
xs = [x,y]; 

% Plot for the 8 data points
figure(1)
hold on
line(xs([1,2,5,3,4,3,7,8,6],1),xs([1,2,5,3,4,3,7,8,6],2),'Linewidth',2);
xlim([-3.3,5.3])
ylim([-4.3,4.3])
xlabel('first coordinate','FontSize',12)
ylabel('second coordinate','FontSize',12)
title('8 points','FontSize',14)
text(xs(:,1),xs(:,2),['1','2','3','4','5','6','7','8']','FontSize',14)
box on
hold off

% Draw line segments between pairs of points 
% euclidean distance matrix
d = pdist(xs,'euclidean');

% squared euclidean distance matrix
dd = d.^2;

% cluster analysis with single linkage algorithm                                                  

ss = linkage(dd,'single');

% Dendrogram for the 8 data points after Single linkage
% The actual dendrogram differs from the in R produced plot due to
% differences in the linkage function

figure(2)

[H,T] = dendrogram(ss,'colorthreshold','default');
set(H,'LineWidth',2)
title('Single Linkage Dendrogram - 8 points','FontSize',14)
ylabel('Squared Euclidean Distance','FontSize',12)
box on
