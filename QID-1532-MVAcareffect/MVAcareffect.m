%% clear all variables and console and close windows
clear
clc
close all

%% load data
formatSpec = '%s%f%f%s%s%f%f%f%f%f%f%f%f%f';
data       = readtable('carc.dat','Format',formatSpec,'ReadVariableNames',false);

%% Extract factors and build simple regression model for testing the W and D on effect of M
%% fit1
y       = data.Var2;
x1      = data.Var8;
x2      = data.Var11;
x       = [ones(size(x1)),x1,x2];
b       = inv(x'*x)*x'*y;        
[m, n]  = size(x);
df      = m-n;
yhat    = x*b;
r       = y - yhat;
mse     = r'*r./df;
covar   = inv(x'*x).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ')
disp('p-value (for the intercept (first line) and the 2 variables (8 and 11))')
disp(tablex)
   
%% fit2, we add the origin factor into the regression model to check the effect.
x3      = data.Var13;
x       = [x,x3];
b       = inv(x'*x)*x'*y;
[m n]   = size(x);
df      = m-n;
yhat    = x*b;
r       = y - yhat;
mse     = r'*r./df;
covar   = inv(x'*x).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 3 variables (8, 11 and 13))');
disp(tablex)
 
%% the following is used to check whether different levels have different effects on the mileage.
xxx = sortrows(data,13);

%% fit3, c=1   
y1 = xxx(1:52,:);
x       = [ones(52,1) y1.Var8 y1.Var11];
y       = y1.Var2;
b       = inv(x'*x)*x'*y;
[m, n]  = size(x);
df      = m-n;
yhat    = x*b;
r       = y - yhat;
mse     = r'*r./df;
covar   = inv(x'*x).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 2 variables (8, 11)) for C=1');
disp(tablex)

    
%% fit4, c=2
y2 = xxx(53:63,:);
x       = [ones(11,1),y2.Var8,y2.Var11];
y       = y2.Var2;
b       = inv(x'*x)*x'*y;
[m, n]  = size(x);
df      = m-n;
yhat    = x*b;
r       = y - yhat;
mse     = r'*r./df;
covar   = inv(x'*x).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 2 variables (8, 11)) for C=2');
disp(tablex)
   
%% fit5, level c=3
y3      = xxx(63:74,:);
x       = [ones(size(y3.Var1)),y3.Var8,y3.Var11];
y       = y3.Var2;
b       = inv(x'*x)*x'*y;
[m, n]  = size(x);
df      = m-n;
yhat    = x*b;
r       = y - yhat;
mse     = r'*r./df;
covar   = inv(x'*x).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 2 variables (8, 11)) for C=3');
disp(tablex)
 