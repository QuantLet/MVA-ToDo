% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcausco2i
% ---------------------------------------------------------------------
% Description:  MVAnpcausco2i shows a screeplot of the eigenvalues for
%               the PCA of the standardized US company data (uscomp2.dat). 
%               It computes the correlations between the variables and the 
%               principal components and displays the first two of them.
% ---------------------------------------------------------------------
% See also:     MVAnpcabank, MVAnpcabank, MVAnpcabanki, MVAnpcafood, 
%               MVAnpcahous, MVAnpcahous, MVAnpcahousi, MVAnpcatime,
%               MVAnpcausco, MVAnpcausco,MVAnpcausco2, MVApcabank, 
%               MVApcabanki, MVApcabankr
% ---------------------------------------------------------------------
% Keywords:     PCA, correlation, eigenvalues, screeplot, standardize
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Screeplot of the eigenvalues for the PCA of the
%               standardized US company data (uscomp2.dat).
%               It computes the correlations between the variables and
%               the principal components and displays the first two of
%               them.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu,
%               Song Song
% ---------------------------------------------------------------------


close all
clc
clear

[Company,A,S,MV,P,CF,E,Sector]=textread('uscomp2.dat','%s %f %f %f %f %f %f %s');

x=horzcat(A,S,MV,P,CF,E);
x=vertcat(x(1:37,:),x(39,:),x(41:79,:));
[n p]=size(x);
m=mean(x);
x=(x-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x)/n),n,1);        % Standardizes the data matrix
[v e]=eigs((n-1)*cov(x)/n,p,'la');                               % Eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it))
e1=(e*ones(p,1))';                                               % Creates column vector of eigenvalues
x=x-repmat(m,n,1);
r=x*v;
r(:,7:12)=x(:,1:6);
r=corr(r);                                                       % Correlation between PCs and variables
r1(:,1)=(-1)*r(7:12,1);    %CORRECTION (as R)                    % Correlation of the two most important PCs and variables
r1(:,2)=r(7:12,2);                                               % Multiply here the second PC by -1 for the same output as in the MVA book



 % Polar coordinates
figure(1)
hold on
box on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('U.S. Company Data')
xlabel('First PC')
ylabel('Second PC')
daspect([1,1,1])
plot(exp((-1)^.5*[0:2*pi/360:2*pi]))                             % plot unit circle

for i=1:length(r1)
text(r1(i,1),r1(i,2),strcat('X',int2str(i)))
end
hold off
 % to save the plot in pdf or png please uncomment next 2 lines:
 % print -painters -dpdf -r600 MVAnpcausco2i01.pdf
 % print -painters -dpng -r600 MVAnpcausco2i01.png


 % Eigenvalues
nr=1:6;
figure(2)
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('U.S. Company Data')
xlim([0.5 6.5])
ylim([-0.2 3.5])
box on



 % to save the plot in pdf or png please uncomment next 2 lines:
 % print -painters -dpdf -r600 MVAnpcausco2i02.pdf
 % print -painters -dpng -r600 MVAnpcausco2i02.png
