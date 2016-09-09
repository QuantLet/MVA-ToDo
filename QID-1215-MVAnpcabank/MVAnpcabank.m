% -------------------------------------------------------------------------
% Book:         MVA
% -------------------------------------------------------------------------
% Quantlet:     MVAnpcabank
% -------------------------------------------------------------------------
% Description:  MVAnpcabank performs PCA for the standardized Swiss bank 
%               notes (bank2.dat) data and shows the first three principal 
%               components in two-dimensional scatterplots.  Additionally, 
%               a screeplot of the eigenvalues is displayed.
% -------------------------------------------------------------------------
% Usage:        -
% -------------------------------------------------------------------------
% Inputs:       None
% -------------------------------------------------------------------------
% Output:       Two-dimensional scatterplots of the first three principal
%               components of the standardized Swiss bank notes data 
%               (bank2.dat). Additionally, a screeplot of the eigenvalues 
%               is displayed.
% -------------------------------------------------------------------------
% Example:      -
% -------------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% -------------------------------------------------------------------------

% Note: Matlab decomposes matrixes differently from Xplore(MVA book), and
% hence some of the eigenvectors have different signs. This does not change
% the results, but it does change the order of the graph by inverting the
% axes around the origin (Not always, and not necessarily all of the axis;
% it depends on which eigenvectors we choose to plot)

close all
clear
clc

x=load('bank2.dat');

y=vertcat(ones(100,1),zeros(100,1));                 % Column with ones and zeros

[n p]=size(x);
m=mean(x);

x=(x-repmat(m,n,1)).*repmat(1./sqrt(var(x)),n,1);    % Standardizes the data matrix
[v e]=eigs(cov(x),p,'la');                           % Eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
e1=(e*ones(p,1))';                                   % Creates column vector of eigenvalues

nr=1:6;
subplot(2,2,4)
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('Eigenvalues of S')
xlim([0.5 6.5])
ylim([0 3.2])
hold on

x=x*v;

%Plot of the first vs. second PC
subplot(2,2,1)
gscatter(x(:,1),x(:,2),y,'br','+o',5,'off')  
xlabel('PC1 ')
ylabel('PC2 ')
title('First vs. Second PC')

%Plot of the second vs. third PC
subplot(2,2,2)
gscatter(x(:,2),x(:,3),y,'br','+o',5,'off')  
xlabel('PC2 ')
ylabel('PC3 ')
title('Second vs. Third PC')

%Plot of the first vs. third PC
subplot(2,2,3)
gscatter(x(:,1),x(:,3),y,'br','+o',5,'off')   
xlabel('PC1 ')
ylabel('PC3 ')
title('First vs. Third PC')