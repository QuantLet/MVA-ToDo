% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAfactcarm
% ---------------------------------------------------------------------
% Description:  MVAfactcarm performs a factor analysis for the car marks
%               data (carmean.dat) and shows the eigenvalues of r-psi
%               and a plot of the factor loadings for the first two 
%               factors. 
%               Corresponds to example 11.4 in MVA.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Factor analysis for the car marks data (carmean.dat)
%               and shows the eigenvalues of r-psi and a plot of the
%               factor loadings for the first two factors.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu,
%               Song Song
% ---------------------------------------------------------------------

%Note: Matlab decomposes matrices differently from Xplore, and
%hence some of the eigenvectors have different signs. This does not change
%the results, but it does change the order of the graph by inverting the
%axes around the origin (Not always, and not necessarily all of the axis;
%it depends on which eigenvectors we choose to plot)
close all
clear
clc
% Reading a file that does not contain only numerical data
[Type, A, B, C, D, E, F, G, H] = textread('carmean.dat','%s %f %f %f %f %f %f %f %f');
% Constructing matrix with data
x                      = horzcat(A,B,C,D,E,F,G,H);
r                      = corr(x);
m                      = r;
for i=1:length(r)
    m(i,i) = r(i,i)-1;
end
psi(1:8,1:8) = 1;
for i=1:8
    psi(i,i) = 1-max(abs(m(:,i)));
end
% Arranging eigenvalues and eigenvectors
[v, e1] = eigs(r-psi,8,'la');  % Returns eigenvalues and eigenvectors sorted by size
e       = (e1*ones(8,1))';          % Turns Eigenvalue matrix into a row vector
ee      = e(1:2);
vv      = v(:,1:2);
q       = sqrt(ee(1))*vv(:,1);
q(:,2)  = sqrt(ee(2))*vv(:,2);
scatter(q(:,1),q(:,2),'w')
hold on
s = ['economic'
     'service '
     'value   '
     'price   '
     'look    '
     'sporty  '
     'security'
     'easy    '];
for i=1:8
    text(q(i,1),q(i,2),s(i,1:8));
end;
xlim([-1.8 1.05])
ylim([-0.7 0.7])
line([-2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Car Marks Data');
xlabel('First Factor');
ylabel('Second Factor');
hold off
