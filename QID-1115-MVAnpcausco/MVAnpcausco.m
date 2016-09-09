% -------------------------------------------------------------------------
% Book:         MVA
% -------------------------------------------------------------------------
% Quantlet:     MVAnpcausco
% -------------------------------------------------------------------------
% Description:  MVAnpcausco performs a PCA for the standarized US company 
%               data (uscomp2.dat) and shows the first two principal 
%               components a screeplot of the eigenvalues.
% -------------------------------------------------------------------------
% Usage:        -
% -------------------------------------------------------------------------
% Inputs:       None
% -------------------------------------------------------------------------
% Output:       PCA for the standarized US company data (uscomp2.dat) and 
%               shows the first two principal components a screeplot of 
%               the eigenvalues.
% -------------------------------------------------------------------------
% Example:      -
% -------------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% -------------------------------------------------------------------------

% Note: Eigenvalues and Eigenvectors calculated in this function differ to the ones in the
%       MVA book. This is because Matlab decomposes matrixes in a different
%       manner. However, this should not change the analysis in any meaningful way. 

close all
clear
clc

[Company,A,S,MV,P,CF,E,Sector]=textread('uscomp2.dat','%s %f %f %f %f %f %f %s');
Sector=char(Sector);                % Used to name the coordinates
Sector = sscanf(Sector,'%1c');      % Makes string with first character of the sectors
Sector=Sector(1:79);
Sector(1:2)='H';                    % Changes character according to book description
Sector(53:63)='*';                  % Changes character according to book description
Sector(74:79)='*';                  % Changes character according to book description

x=horzcat(A,S,MV,P,CF,E);
[n p]=size(x);
m=mean(x);
x=(x-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x)/n),n,1);      % Standardizes the data matrix
[v e]=eigs((n-1)*cov(x)/n,p,'la');                             % Eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
e1=(e*ones(p,1))';                                             % Creates column vector of eigenvalues
x=x*v;

%Eigenvalues
subplot(2,1,2)
subplot('Position',[0.1 0.1 0.8 0.15])
nr=1:6;
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('Eigenvalues of S')
xlim([0.5 6.5])
ylim([-1.5 6])
hold on

%First vs Second PC
subplot(2,1,1)
subplot('Position',[0.1 0.4 0.8 0.5])
title('First vs. Second PC')
xlabel('PC 1')
ylabel('PC 2')
xlim([-1.5 18])
ylim([-5 2])
hold on

for i=1:79
    text(x(i,1),x(i,2),Sector(i))    % Places text on the coordinates
end