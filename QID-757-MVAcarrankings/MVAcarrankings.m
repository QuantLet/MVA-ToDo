% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAcarrankings
% ------------------------------------------------------------------------------
% Description:  MVAcarrankings performs a monotone transformation to the estimated
%               stimulus utilities of the car example (Example 16.1 in MVA) by 
%               applying the pool-adjacent-violators (PAV) algorithm.             
% ------------------------------------------------------------------------------
% Usage:        pava
% ------------------------------------------------------------------------------
% Inputs:       x - the reported preference orderings for the car example
%               y - the fitted values of x                 
% ------------------------------------------------------------------------------
% Output:       Illustrates the PAV algorithm for nonmetric solution for the car
%               example as a scatterplot of the estimated preference orderings 
%               against the revealed ones (monotone estimated preference orderings).
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Awdesch Melzer 20120404
% ------------------------------------------------------------------------------

clear all;
close all;
clc;


% the reported preference orderings
x = [1:6]';
% the estimated preference orderings according to the additive model (16.1) and the metric solution (Table 16.6) in MVA
y = [0.84,2.84,3.16,3.34,5.66,5.16]';
z = [x,y];

% use PAV algorithm
gp = pava(y);
% the reported preference orderings
gp = [x,gp];

figure(1)
hold on
plot(gp,z,'w')
xlabel('Revealed rankings','FontSize',12)
ylabel('Estimated rankings','FontSize',12)
title('Car rankings','FontSize',14)
box on
line(gp(:,1),gp(:,2),'LineWidth',2)
plot(x,y,'ro')
xlim([1,6.5])
text(x(1),y(1)-0.1,'car1','FontSize',12)
text(x(2),y(2)-0.1,'car2','FontSize',12)
text(x(3),y(3)-0.1,'car3','FontSize',12)
text(x(4),y(4)-0.1,'car4','FontSize',12)
text(x(5),y(5)-0.1,'car5','FontSize',12)
text(x(6),y(6)-0.1,'car6','FontSize',12)
hold off
