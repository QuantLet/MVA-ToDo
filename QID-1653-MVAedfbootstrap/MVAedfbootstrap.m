% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAedfbootstrap
% ---------------------------------------------------------------------
% Description:  MVAedfbootstrap draws 3 bootstrap samples from a 
%               simulate data standard normal dataset and plots their 
%               empirical distribution functions (edf).
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Draws 3 bootstrap samples from a simulate data 
%               standard normal dataset and plots their empirical 
%               distribution functions (edf).
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------


clear
close all
clc

n=100;

x = normrnd(0,1,n,1);
x = sort(x);

aa = [x(2:n),((1:n-1)/n)'];
bb = [x(1:n-1),((1:n-1)/n)'];
cc = [aa;bb];

edf = sort(cc);
edf = [edf(1,1),0;edf;edf(length(edf),1),1];

% First bootstrap sample
xs1 = x(ceil(n*unifrnd(0,1,n,1)));

%Second bootstrap sample
xs2 = x(ceil(n*unifrnd(0,1,n,1)));

% Sorting the first sample
aa1   = [xs1(2:n),((1:n-1)/n)'];
bb1   = [xs1(1:n-1),((1:n-1)/n)'];
cc1   = [aa1;bb1];
edfs1 = sort(cc1);
edfs1 = [edfs1(1,1),0;edfs1;edfs1(length(edfs1),1),1];

% Sorting the second sample
aa2   = [xs2(2:n),((1:n-1)/n)'];
bb2   = [xs2(1:n-1),((1:n-1)/n)'];
cc2   = [aa2;bb2];
edfs2 = sort(cc2);
edfs2 = [edfs2(1,1),0;edfs2;edfs2(length(edfs2),1),1];

hold on
title('EDF and 2 bootstrap EDF''s, n=100');
xlabel('X');
ylabel('edfs[1..3](x)');

plot(edf(:,1),edf(:,2),'Color','k','LineWidth',3.5);
plot(edfs1(:,1),edfs1(:,2),'--r','LineWidth',1.5);
plot(edfs2(:,1),edfs2(:,2),'--b','LineWidth',1.5);

legend('edf','1. bootstrap cdf', '2. bootstrap cdf',2)

hold off
