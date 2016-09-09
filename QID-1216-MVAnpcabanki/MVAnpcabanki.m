% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcabanki
% ---------------------------------------------------------------------
% Description:  MVAnpcabanki shows a screeplot of the eigenvalues for 
%               the PCA of the standardized Swiss bank notes 
%               (bank2.dat). It computes the correlations between the 
%               variables and the principal components and displays the 
%               first two of them.
% ---------------------------------------------------------------------
% See also:     
%               MVAcpcaiv, MVAnpcabank, MVAnpcafood, MVAnpcahous, 
%               MVAnpcahous, MVAnpcahousi, MVAnpcahousi, MVAnpcatime,
%               MVAnpcausco, MVAnpcausco2, MVAnpcausco2i, MVApcabank,
%               MVApcabanki, MVApcabankr,MVApcasimu, MVApcasimu                            
% ---------------------------------------------------------------------
% Keywords:     PCA, correlation, eigenvalues, screeplot, standardize
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Screeplot of the eigenvalues for the PCA of the 
%               standardized Swiss bank notes ("bank2.dat"). It 
%               computes the correlations between the variables and the 
%               principal components and displays the first two of them.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

% Note: Eigenvectors calculated by Matlab differ in sign to those calculated with
%       Xplore. This causes the plots to be inverted(around the origin or the
%       different axes depending on how many vectors have different signs).

close all
clear
clc

x=load('bank2.dat');
y=vertcat(ones(100,1),zeros(100,1));                % Column with ones and zeros
[n p]=size(x);
m=mean(x);
x=(x-repmat(m,n,1)).*repmat(1./sqrt(var(x)),n,1);   % Standardizes the data matrix
[v e]=eigs(cov(x),p,'la');                          % Eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
e1=(e*ones(p,1))';                                  % Creates column vector of eigenvalues

%Plotting eigenvalues
nr=1:6;
figure(2)
scatter(nr,e1,'k')
box on
xlabel('Index')
ylabel('Lambda')
title('Swiss Bank Notes')
xlim([0.5 6.5])
ylim([0 3.5])

 % to save the plot in pdf or png please uncomment next 2 lines:
 % print -painters -dpdf -r600 MVAnpcabanki01.pdf
 % print -painters -dpng -r600 MVAnpcabanki01.png

m=mean(x);
temp=x-repmat(m,n,1);
r=temp*v;
r(:,7:12)=x;
r=corr(r);
r1=r(7:12,1:2);
r1=[r1(:,1)*(-1) r1(:,2)]; %CORRECTION

figure(1)
hold on
box on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Swiss Bank Notes')
xlabel('First PC')
ylabel('Second PC')

circle = rsmak('circle');
fnplt(circle)

text(r1(1,1),r1(1,2),'X1')
text(r1(2,1),r1(2,2),'X2')
text(r1(3,1),r1(3,2),'X3')
text(r1(4,1),r1(4,2),'X4')
text(r1(5,1),r1(5,2),'X5')
text(r1(6,1),r1(6,2),'X6')
hold off

 % to save the plot in pdf or png please uncomment next 2 lines:
 % print -painters -dpdf -r600 MVAnpcabanki02.pdf
 % print -painters -dpng -r600 MVAnpcabanki02.png