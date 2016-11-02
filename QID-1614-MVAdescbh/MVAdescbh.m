% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdescbh
% ---------------------------------------------------------------------
% Description:  MVAdescbh calculates descriptive statistics for the 
%               Boston housing data and their transformations. 
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Descriptive statistics for the Boston housing data and 
%               their transformations. 
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

close
clear all
clc


x=load('bostonh.dat');
xt=x;

xt(:,1)=log(x(:,1));
xt(:,2)=x(:,2)/10;
xt(:,3)=log(x(:,3));
xt(:,5)=log(x(:,5));
xt(:,6)=log(x(:,6));
xt(:,7)=(power(x(:,7),2.5))/10000;
xt(:,8)=log(x(:,8));
xt(:,9)=log(x(:,9));
xt(:,10)=log(x(:,10));
xt(:,11)=exp(0.4*x(:,11))/1000;
xt(:,12)=x(:,12)/100;
xt(:,13)=sqrt(x(:,13));
xt(:,14)=log(x(:,14));

tablex(:,1)=mean(x)';
tablex(:,2)=median(x)';
tablex(:,3)=var(x)';
tablex(:,4)=sqrt(var(x))';

disp('Table with Mean, Median, Variance, Sqrt(Variance) for Original Data');
disp('     Mean     Median    Variance    SE')
disp(tablex/100)
disp(' x 1.0e+002')

disp('Covariance Matrix Original Data')
disp(cov(x))

disp('Correlation Matrix Original Data')
disp(corr(x))

tablext(:,1)=mean(xt)';
tablext(:,2)=median(xt)';
tablext(:,3)=var(xt)';
tablext(:,4)=sqrt(var(xt))';

disp('Table with Mean, Median, Variance, Sqrt(Variance) for Transformed Data');
disp('     Mean     Median    Variance    SE')
disp(tablext/100)
disp('Covariance Matrix Transformed Data')
disp(cov(xt))
disp('Correlation Matrix Transformed Data')
disp(corr(xt))

