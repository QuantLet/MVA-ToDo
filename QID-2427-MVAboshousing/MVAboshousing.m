%% clear all variables and console and close windows
clear
clc
close all

%% load data
data = load('bostonh.dat');

%% First we use the ANCOVA model to do the regression
%% fit1
x = [ones(size(data(:, 1))), data(:, 4:6), data(:, 8:13)];
y = data(:, 14);

[m, n]  = size(x);
df      = m - n;
b       = inv(x' * x) * x' * y; 
yhat    = x * b;
r       = y - yhat;
mse     = r' * r./df;
covar   = inv(x' * x).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5 * df)) ;
Pvalues = 2 * (1 - p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 9 variables (4, 5, 6, 8, 10, 11, 12 and 13))');
disp(tablex)


%% fit2, we create x15 and replace x9 with x15, we also transform x4.
data(:, 15) = ones(size(data(:, 1)));
for i = 1:length(data)
   if data(i, 4)==0
       data(i, 4) = -1;
   end
   if data(i, 9) < median(data(:, 9))
       data(i, 15) = -1;
   end   
end

x = [ones(size(data(:, 1))) data(:, 4:6) data(:, 8) data(:, 10:13) data(:, 15)];

[m, n]  = size(x);
df      = m - n;
b       = inv(x' * x) *x' *y; 
yhat    = x * b;
r       = y - yhat;
mse     = r' * r./df;
covar   = inv(x' * x).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1 + sign(t2).*betainc(k, 0.5, 0.5 * df)) ;
Pvalues = 2 * (1 - p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 10 variables (transformed 4, 5, 6, 8, 10, 11, 12 ,13 and 15))');
disp(tablex)
      
%% fit3, testing the interactions of x4 with x12 and x15
xx = [x, data(:, 4).*data(:, 12), data(:, 4).*data(:, 15)];

[m, n]  = size(xx);
df      = m - n;
b       = inv(xx' * xx) * xx' * y;
yhat    = xx * b;
r       = y - yhat;
mse     = r' * r./df;
covar   = inv(xx' * xx).*mse;
se      = sqrt(diag(covar));
t       = b./se;
t2      = abs(t);
k       = t2.^2./(df + t2.^2);
p       = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2 * (1 - p);
tablex  = [b se t Pvalues];

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 12 variables ')
disp('(transformed 4, 5, 6, 8, 10, 11, 12 ,13, 15 and the interactions of 4 with 12 and 4 with 15))');
disp(tablex)
