%% clear all variables and console and close windows
clear
clc
close all

%% create matrix of 8 data points
x  = [5,2,-2,-3,-2,-2,1,1]';
y  = [-3,-4,-1,0,-2,4,2,4]';   
xs = [x,y]; 

%% Plot for the 8 data points
figure(1)
hold on
line(xs([1,2,5,3,4,3,7,8,6],1),xs([1,2,5,3,4,3,7,8,6],2),'Linewidth',2);
xlim([-3.3,5.3])
ylim([-4.3,4.3])
xlabel('price conciousness','FontSize',12)
ylabel('brand loyalty','FontSize',12)
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

%% Dendrogram for the 8 data points after Single linkage
% This dendrogram differs from the one produced in R produced plot due to
% differences in the linkage function
figure(2)
[H,T] = dendrogram(ss,'colorthreshold','default');
set(H,'LineWidth',2)
title('Single Linkage Dendrogram - 8 points','FontSize',14)
ylabel('Squared Euclidean Distance','FontSize',12)
box on
