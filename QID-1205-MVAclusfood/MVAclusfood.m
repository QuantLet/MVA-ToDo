% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAclusfood
% ------------------------------------------------------------------------------
% Description: MVAclusfood performs cluster analysis for the french food data
%              (food.dat) after standardization of the variables. 
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Plot for the Dendrogram of the standardized food.dat after applying
%              the Ward algorithm.
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Zografia Anastasiadou 20100507, Matlab: Awdesch Melzer
%              20120329
% ------------------------------------------------------------------------------

% clear variables and close windows
clear all;
close all;
clc;

%load data
[type, A, B, C, D, E, F, G]=textread('food.dat','%s %f %f %f %f %f %f %f');
food = [A, B, C, D, E, F, G];

% define types of families


% standardize variables

for i=1:7
    f(:,i)=(food(:,i)-mean(food(:,i)))/(sqrt(var(food(:,i))));
end

% euclidean distance matrix
d = pdist(f,'euclidean');
% squared euclidean distance matrix
dd = d.^2;
% cluster analysis with ward algorithm                                          
w = linkage(dd,'ward');

% Dendrogram for the standardized food.dat after Ward algorithm
[H, T] = dendrogram(w,'label',type);
set(H,'LineWidth',2)
title('Ward Dendrogram for French Food', 'FontSize', 14)
ylabel('Squared Euclidean Distance', 'FontSize',12)
box on


