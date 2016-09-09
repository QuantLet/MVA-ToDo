% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcatime
% ---------------------------------------------------------------------
% Description:  MVAnpcatime performs a PCA for the standardized time 
%               budget data (timebudget.dat) and shows the first two
%               principal components in for the individuals and the 
%               variables. 
%               Need "rsmak" function.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       PCA for the standardized time budget data (timebudget.dat)
%               and shows the first two principal components in for
%               the individuals and the variables. 
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

% Note: Eigenvectors calculated by matlab differ in sign to those calculated with
%       Xplore. This causes the plots to be inverted(around the origin or the
%       different axes depending on how many vectors have different signs).

clear
clc
close all

x1=load('timebudget.dat');

[n p]=size(x1);
m=mean(x1);
x=(x1-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x1)),n,1);        % Standardizes Data

% First figure
[v1 e1]=eigs((x*x')/n,n,'la');                                   % Decomposes matrix and sorts eigenvalues and vectors by size
e=(e1*ones(n,1))';                                               % Creates column vector of eigenvalues

w(:,1)=v1(:,1).*sqrt(e(1));
w(:,2)=v1(:,2).*sqrt(e(2));

figure(1);
hold on;
line([-0.18 0.12],[0 0],'Color','k')
line([0 0],[-0.12 0.12],'Color','k')
xlim([-0.18 0.12]);
ylim([-0.12 0.12]);
title('Time Budget Data');
xlabel('First Factor - Individuals');
ylabel('Second Factor - Individuals');

fams=['maus'
      'waus'
      'wnus'
      'mmus'
      'wmus'
      'msus'
      'wsus'
      'mawe'
      'wawe'
      'wnwe'
      'mmwe'
      'wmwe'
      'mswe'
      'wswe'
      'mayo'
      'wayo'
      'wnyo'
      'mmyo'
      'wmyo'
      'msyo'
      'wsyo'
      'maes'
      'waes'
      'wnes'
      'mmes'
      'wmes'
      'mses'
      'wses'];

for i=1:length(w)
    text(w(i,1),w(i,2),fams(i,1:4),'FontSize',12,'FontWeight','bold');
end;  
hold off;

% Second figure
[v2 e2]=eigs(x'*x,p,'la');
ee=(e2*ones(p,1))';           % Creates column vector of eigenvalues

z(:,1)=v2(:,1)*sqrt(ee(1));   % First PC
z(:,2)=v2(:,2)*sqrt(ee(2));   % Second PC

figure(2);
hold on
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
xlim([-1.2 1.2]);
ylim([-1.2 1.2]);
circle = rsmak('circle');
fnplt(circle);
title('Time Budget Data');
xlabel('First Factor - Expenditures');
ylabel('Second Factor - Expenditures');

namez=['prof'
       'tran'
       'hous'
       'kids'
       'shop'
       'pers'
       'eati'
       'slee'
       'tele'
       'leis'];
       
for i=1:length(z)
    text(z(i,1),z(i,2),namez(i,1:4),'FontSize',12,'FontWeight','bold');
end;  
hold off;



