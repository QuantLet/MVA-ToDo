% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAsimcibh
% ---------------------------------------------------------------------
% Description:  MVAsimcibh tests the equality of 2 groups of Boston
%               Housing data. It computes the F-statistic and the 
%               critical value of the test and the simultaneous 
%               confidence intervals.  
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       F-statistic, critical value of the test and the 
%               simultaneous confidence intervals.   
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

close all
clear 
clc

format long
x=load('bostonh.dat');

%Transformations
x(:,1)=log(x(:,1));
x(:,5)=log(x(:,5));
x(:,8)=log(x(:,8));
x(:,11)=exp(0.4*x(:,11))/1000;
x(:,13)=sqrt(x(:,13));

j=0;
k=0;
for i=1:length(x)
    if or(x(i,14)<median(x(:,14)),x(i,14)==median(x(:,14)))
        j=j+1;
        v1(j,:)=x(i,:);
    else
         k=k+1;
         v2(k,:)=x(i,:);
    end
end

x1=[v1(:,1),v1(:,5),v1(:,8),v1(:,11),v1(:,13)];
x2=[v2(:,1),v2(:,5),v2(:,8),v2(:,11),v2(:,13)];

n1 = length(x1);
n2 = length(x2);
n = n1+n2;
a = size(x1);
p = a(2);

% Estimating the mean and the variance
s1 = ((n1-1)/n1)*cov(x1);
s2 = ((n2-1)/n2)*cov(x2);
s = (n1*s1+n2*s2)/(n1+n2);
ex1 = mean(x1);
ex2 = mean(x2);
sinv = inv(s);
k = n1*n2*(n-p-1)/(p*(n^2));

% Computing the test statistic
f = k*(ex1-ex2)*sinv*(ex1-ex2)';
disp('F-statistic')
disp(f)

% Computing the critical value 
critvalue = finv(0.95,5,500);
disp('critical value')
disp(critvalue)

% Computes the simultaneous confidence intervals
deltau = (ex1-ex2)'+sqrt(finv(0.95, p, n-p-1)*(1/k)*diag(s));
deltal = (ex1-ex2)'-sqrt(finv(0.95, p, n-p-1)*(1/k)*diag(s));

confint=[deltal,deltau];
disp('Simultaneous confidence intervals')
disp(confint)





