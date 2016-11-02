% ----------------------------------------------------------------------------
% EBook         MVA3
% ----------------------------------------------------------------------------
% Quantlet      MVAboshousing 
% ----------------------------------------------------------------------------
% Description   Computes the ANCOVA model with Boston housing data.
% ----------------------------------------------------------------------------
% Usage         MVAboshousing
% ----------------------------------------------------------------------------
% Input         Boston housing data
% ----------------------------------------------------------------------------
% Output        The coefficients of the independent variables and dependent variable.
% ----------------------------------------------------------------------------
% Example       Here we add binary variable to the ANCOVA model,and try to check
%               The effect of the new factors on the dependent variable.
% ----------------------------------------------------------------------------
% Author        Awdesch Melzer 20120315
% ----------------------------------------------------------------------------

clear all;
close all;
clc;

% First we use the ANCOVA model to do the regression
data = load('bostonh.dat');

x = [ones(size(data(:,1))), data(:,4:6),data(:,8),data(:,10:13)];
y = data(:,14);
b = inv(x'*x)*x'*y;
[m n]=size(x);
df = m-n;
yhat = x*b;
r = y - yhat;
mse = r'*r./df;
covar = inv(x'*x).*mse;
se = sqrt(diag(covar));
t = b./se;
t2 = abs(t);
k = t2.^2./(df + t2.^2);
p = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex = [];
for i=1:n 
      tablex(i,1)=b(i);
      tablex(i,2)=se(i);
      tablex(i,3)=t(i);
      tablex(i,4)=Pvalues(i);
end
disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 9 variables (4, 5, 6, 8, 10, 11, 12 and 13))');
tablex


  
% We add replace x9 by x15, and also transform x4.

x4 = data(:,4);
x5 = data(:,5);
x6 = data(:,6);
x8 = data(:,8);
x10 = data(:,10);
x11 = data(:,11);
x12 = data(:,12);
x13 = data(:,13);
y = data(:,14);

one = ones(size(x4));


x4 = data(:,4);
n = length(x4); 

for i = 1:n
   if x4(i)==0
   x4(i)=-1;
   end
end
   xx = 0;
   x9 = data(:,9);
   for i = 1:n
   if x9(i)>= median(x9)
   xx(i)= 1;
   else 
   xx(i) = -1;
   end
   x15 = xx;
   end

x = [one, x4,x5,x6,x8,x10,x11,x12,x13, x15'];
b = inv(x'*x)*x'*y;
[m n]=size(x);
df = m-n;
yhat = x*b;
r = y - yhat;
mse = r'*r./df;
covar = inv(x'*x).*mse;
se = sqrt(diag(covar));
t = b./se;
t2 = abs(t);
k = t2.^2./(df + t2.^2);
p = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex = [];
for i=1:n 
      tablex(i,1)=b(i);
      tablex(i,2)=se(i);
      tablex(i,3)=t(i);
      tablex(i,4)=Pvalues(i);
end
disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 10 variables (transformed 4, 5, 6, 8, 10, 11, 12 ,13 and 15))');
tablex
   

   
% Here is used for testing the interaction of x4 and x12, and also x4 and x15
x12 = data(:,12);
xx = [x, x4.*x12,x4.*x15'];
b = inv(xx'*xx)*xx'*y;
[m n]=size(xx);
df = m-n;
yhat = xx*b;
r = y - yhat;
mse = r'*r./df;
covar = inv(xx'*xx).*mse;
se = sqrt(diag(covar));
t = b./se;
t2 = abs(t);
k = t2.^2./(df + t2.^2);
p = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex = [];
for i=1:n 
      tablex(i,1)=b(i);
      tablex(i,2)=se(i);
      tablex(i,3)=t(i);
      tablex(i,4)=Pvalues(i);
end
disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 12 variables ')
disp('(transformed 4, 5, 6, 8, 10, 11, 12 ,13, 15 and the interactions of 4 with 12 and 4 with 15))');
tablex
