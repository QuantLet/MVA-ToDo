%% clear all variables and console and close windows
clear
clc
close all

%% load data
x = load('bostonh.dat');

%% Transformations
x(:,1)  = log(x(:,1));
x(:,5)  = log(x(:,5));
x(:,8)  = log(x(:,8));
x(:,11) = exp(0.4*x(:,11))/1000;
x(:,13) = sqrt(x(:,13));

v1     = x(x(:,14)<=median(x(:,14)),:);
v2     = x(x(:,14)>median(x(:,14)),:);
x1     = v1(:,[1,5,8,11,13]);
x2     = v2(:,[1,5,8,11,13]);
n1     = length(x1);
n2     = length(x2);
n      = n1+n2;
[~, p] = size(x1);

%% Estimating the mean and the variance
s1   = ((n1-1)/n1)*cov(x1);
s2   = ((n2-1)/n2)*cov(x2);
s    = (n1*s1+n2*s2)/(n1+n2);
ex1  = mean(x1);
ex2  = mean(x2);
sinv = inv(s);
k    = n1*n2*(n-p-1)/(p*(n^2));

%% Computing the test statistic
f = k*(ex1-ex2)*sinv*(ex1-ex2)';
disp('F-statistic')
disp(f)

%% Computing the critical value 
critvalue = finv(0.95,5,500);
disp('critical value')
disp(critvalue)

%% Computes the simultaneous confidence intervals
deltau = (ex1-ex2)'+sqrt(finv(0.95, p, n-p-1)*(1/k)*diag(s));
deltal = (ex1-ex2)'-sqrt(finv(0.95, p, n-p-1)*(1/k)*diag(s));

confint = [deltal,deltau];
disp('Simultaneous confidence intervals')
disp(confint)
