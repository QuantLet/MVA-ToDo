%% clear all variables and console and close windows
clear
clc
close all

%% load data
x = load('bank2.dat');

% Vector with ones in the first 100 entries and zeros in the rest
% that enables us to use the 'gscatter'command to plot the data in groups.
groups = vertcat(ones(100,1),zeros(100,1));   

[n,p] = size(x);
m     = mean(x);
x     = (x-repmat(m,n,1)).*repmat(1./sqrt(var(x)),n,1);    % standardizes the data matrix
[v,e] = eigs(cov(x),p,'la');      % eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
e1    = diag(e);                  % Creates column vector of eigenvalues

% change the signs of some eigenvector. This is done only to make easier
% the comparison with R results.
v(:,[1,5,6]) = -v(:,[1,5,6]);

x = x*v;    % data multiplied by eigenvectors

%% plot
%% plot, eigenvalues
nr = 1:6;
subplot(2,2,4)
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('Eigenvalues of S')
xlim([0.5 6.5])
ylim([0 3.2])
box on
%% plot of the first vs. second PC
subplot(2,2,1)
gscatter(x(:,1),x(:,2),groups,'br','+o',5,'off')  
xlabel('PC1 ')
ylabel('PC2 ')
title('First vs. Second PC')
%% plot of the second vs. third PC
subplot(2,2,2)
gscatter(x(:,2),x(:,3),groups,'br','+o',5,'off')  
xlabel('PC2 ')
ylabel('PC3 ')
title('Second vs. Third PC')
%% plot of the first vs. third PC
subplot(2,2,3)
gscatter(x(:,1),x(:,3),groups,'br','+o',5,'off')   
xlabel('PC1 ')
ylabel('PC3 ')
title('First vs. Third PC')
