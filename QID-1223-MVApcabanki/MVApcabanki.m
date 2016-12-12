%% clear all variables and console and close windows
clear
clc
close all

%% load data
x      = load('bank2.dat');
[n,p]  = size(x);

adjust = (n-1)*cov(x)/n;
[v,e]  = eigs(adjust,p,'la');    % Calculates eigenvalues and eigenvectors and sorts them by size
e1     = (e*ones(p,1))';         % Creates column vector of eigenvalues
s      = sum(e1);
e1     = e1/s;

% change the sign of some eigenvectors . This is done only to make easier
% the comparison with R results.
v(:,[1,2,3,5,6]) = -v(:,[1,2,3,5,6]);

%% plots
%% plot, relative proportion of variance explained by PCs
nr = 1:6;
figure
scatter(nr,e1,75,'k')
xlabel('Index')
ylabel('Variance Explained')
title('Swiss Bank Notes')
xlim([0.5 6.5])
ylim([-0.02 0.8])
box on

m      = mean(x);
temp   = x-repmat(m,n,1);
r      = temp*v;
r      = horzcat(r,x);
r      = corr(r);           % correlation between PCs and variables
r1     = r(7:12,1:2);       % correlation of the two most important PCs and variables

%% plot, correlation of the original variable with the PCs.
figure
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Swiss Bank Notes')
xlabel('First PC')
ylabel('Second PC')
daspect([1,1,1])
plot(exp((-1)^.5*[0:2*pi/360:2*pi]))        % plot unit circle
box on
text(r1(1,1),r1(1,2),'X1')
text(r1(2,1),r1(2,2),'X2')
text(r1(3,1),r1(3,2),'X3')
text(r1(4,1),r1(4,2),'X4')
text(r1(5,1),r1(5,2),'X5')
text(r1(6,1),r1(6,2),'X6')
