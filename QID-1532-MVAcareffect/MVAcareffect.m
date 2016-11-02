% ----------------------------------------------------------------------------
% Book        MVA3
% ----------------------------------------------------------------------------
% Quantlet     MVAcareffect
% ----------------------------------------------------------------------------
% Description  Computes the effect of weight and the displacement 
%              on the mileage.
% ----------------------------------------------------------------------------
% Usage        MVAcareffect
% ----------------------------------------------------------------------------
% Input        Car dataset
% ----------------------------------------------------------------------------
% Output       The effects of the weight and the displacement on the mileage. 
% ----------------------------------------------------------------------------
% Example      We put in the car data,use linear regression, then we can get  
%              The coefficents of the regressors.
% ----------------------------------------------------------------------------  
% Remark       This program is also used to check whether the origin of the car 
%              has effect on the response,  also different levels 
% ----------------------------------------------------------------------------
% Author       Awdesch Melzer 20120315
% ----------------------------------------------------------------------------


clear all
close all
clc

   
% This is the simple regression for testing the W and D on effect of M
data = load('carc.txt');
y = data(:,2);
x1 = data(:,8);
x2 = data(:,11);
x = [ones(size(x1)),x1,x2];
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
disp('p-value (for the intercept (first line) and the 2 variables (8 and 11))');
tablex


   
   
% We add the origin factor into the regression model to check the effect.
   x3 = data(:,13);
   x = [x,x3];
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
disp('p-value (for the intercept (first line) and the 3 variables (8, 11 and 13))');
tablex
   
% The following is used to check whether different levels have different effects on the mileage.

xxx = sortrows(data,13);
% c=1   
   y1 = xxx(1:52,:);
   x = [ones(52,1),y1(:,8),y1(:,11)];
   y = y1(:,2);
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
disp('p-value (for the intercept (first line) and the 2 variables (8, 11)) for C=1');
tablex
      
   % c=2
   y2 = xxx(53:63,:);
   x = [ones(11,1),y2(:,8),y2(:,11)];
   y = y2(:,2);
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
disp('p-value (for the intercept (first line) and the 2 variables (8, 11)) for C=2');
tablex
   
% c=3
   y3 = xxx(63:74,:);
   
   x = [ones(size(y3(:,1))),y3(:,8),y3(:,11)];
   y = y3(:,2);
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
disp('p-value (for the intercept (first line) and the 2 variables (8, 11)) for C=3');
tablex
 