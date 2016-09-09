% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAclusbank
% ------------------------------------------------------------------------------
% Description:  MVAclusbank performs a PCA and a cluster analysis for 20 randomly
%               chosen bank notes from the swiss bank notes dataset (bank2.dat).
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None
% ------------------------------------------------------------------------------
% Output:       PCA for the 20 randomly chosen bank notes from bank2.dat and 
%               the Dendrogram of them after applying the Ward algorithm.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20100504; Matlab: Awdesch Melzer
%               20120329
% ------------------------------------------------------------------------------

% clear variables and close graphics
clear all
close all
clc

% load data set
data = load('bank2.dat');
names = 1:length(data);

data = [names', data];

rng = RandStream.getGlobalStream;
rng.reset(20)
% sample of 20 randomly chosen bank notes from data

xx = data(randsample(length(data),20),:);
xx1 = xx(:,1)
xx = xx(:,2:7)
% PCA
mu = mean(xx);

m = repmat(mu,20,1);

x = xx-m;
% spectral decomposition
[eve,eva] = eig(cov(x));  
xm = x;
y = xm*eve';
% first two eigenvectors      
ym = y(:,1:2);

% plot PCA
figure(1)
hold on
plot(ym,'w')
xlabel('first PC','FontSize',12)
ylabel('second PC','FontSize',12)
xlim([-3,3])
ylim([-3,3])
title('20 Swiss bank notes', 'FontSize',14)
s = int2str(xx1);
text(ym(:,1),ym(:,2),s,'FontSize',12)
box on
hold off

% euclidean distance matrix
d = pdist(xx,'euclidean');
% squared euclidean distance matrix
dd = d.^2;
% cluster analysis with ward algorithm
w = linkage(dd,'ward');

% Dendrogram for the 20 bank notes after Ward algorithm
figure(2)
[H,T] = dendrogram(w,'colorthreshold','default','labels',s);
set(H,'LineWidth',2)
title('Dendrogram for 20 Swiss bank notes','FontSize',14)
ylabel('Squared Euclidean Distance','FontSize',12)
xlabel('Ward algorithm')
box on
