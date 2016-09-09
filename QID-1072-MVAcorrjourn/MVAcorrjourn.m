% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcorrjourn
% ---------------------------------------------------------------------
% Description:  MVAcorrjourn performs a correspondence analysis for the
%               Belgian journal data (journaux.dat), shows the
%               eigenvalues of the singular value decomposition of the
%               chi-matrix and displays graphical its factorial
%               decomposition.
%               Corresponds to example 14.3 in MVA.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Correspondence analysis for the Belgian journal data
%               (journaux.dat), shows the eigenvalues of the singular
%               value decomposition of the chi-matrix and displays
%               graphically its factorial decomposition.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu,
%               Song Song
% ---------------------------------------------------------------------
clear
close all
clc

x=load('journaux.dat');

a=sum(x');
b=sum(x);

e=a'*b/sum(a);

%Chi-matrix
cc=(x-e)./sqrt(e);

[g1,l1,d1]=svd(cc);

%Transforming the data so that the matrix is identical to the one in
%Explore. Obs: the 7-th column of the g matrix in Explore cannot be found
%in the Matlab g matrix
g2=g1(:,1:10);

g(:,1)=g2(:,1);
g(:,2)=g2(:,2);
g(:,3)=-g2(:,3);
g(:,4)=-g2(:,4);
g(:,5)=g2(:,5);
g(:,6)=g2(:,6);
g(:,7)=-g2(:,10);
g(:,8)=-g2(:,7);
g(:,9)=g2(:,9);
g(:,10)=-g2(:,8);

l=diag(l1)';

%Transforming the data so that the matrix is identical to the one in
%Explore
d=d1(:,1);
d(:,2)=d1(:,2);
d(:,3)=-d1(:,3);
d(:,4)=-d1(:,4);
d(:,5)=d1(:,5);
d(:,6)=d1(:,6);
d(:,7)=d1(:,10);
d(:,8)=-d1(:,7);
d(:,9)=d1(:,9);
d(:,10)=-d1(:,8);

ll=l.*l;
aux=cumsum(ll)./sum(ll);
perc=[ll',aux'];
r1=repmat(l,15,1).*g;        %multiplies each column of g with each corresponding element of l
r=r1./repmat(sqrt(a'),1,10); %divides each row of r1  with each corresponding element of sqrt(a)
s1=repmat(l,10,1).*d;        %multiplies each column of d with each corresponding element of l
s=s1./repmat(sqrt(b)',1,10);  %divides each row of s1  with each corresponding element of sqrt(b)

rr=r(:,1:2);
ss=s(:,1:2);

%+car, cas

hold on

types=['va';'vb';'vc';'vd';'ve';'ff';'fg';'fh';'fi';'bj';'bk';'bl';'vm';...
    'fn';'fo'];

for i=1:15
    text(rr(i,1),rr(i,2),types(i,1:2),'Color','b','FontSize',12);
end

regions=['brw';'bxl';'anv';'brf';'foc';'for';'hai';'lig';'lim';'lux'];

for i=1:10
    text(ss(i,1),ss(i,2),regions(i,1:3),'Color','r','FontSize',10);
end
hold on
set(gca,'box','on')
line([-1.5 1.5],[0 0],'Color','k')
line([0 0],[0.6 -1.4],'Color','k')
xlim([-1.1 1.5])
ylim([-1.1 0.6])
title('Journal Data')
xlabel('r_1, s_1')
ylabel('r_2, s_2')



