[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAboshousing** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MVAboshousing

Published in: Applied Multivariate Statistical Analysis

Description: Computes the ANCOVA model with Boston housing data. We add binary variable to the ANCOVA model, and try to check the effect of the new factors on the dependent variable.

Keywords: ANCOVA, anova, regression, financial, covariance, linear, linear-model, linear-regression, test

See also: SMSanovapull, SMSdete2pull

Author: Mengmeng Guo
Author[Matlab]: Awdesch Melzer

Submitted: Mon, July 07 2014 by Philipp Gschoepf
Submitted[Matlab]: Thu, December 08 2014 by Piedad Castro

Datafile: bostonh.dat

Output: The coefficients of the independent variables and dependent variable.

Example: The model is used for testing the interaction of x4 and x12, and also x4 and x15.

```

### MATLAB Code
```matlab

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

```

automatically created on 2018-05-28

### R Code
```r


# Clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
data = read.table("bostonh.dat")

# First we use the ANOVA model to do the regression
x1  = data[, 1]
x2  = data[, 2]
x3  = data[, 3]
x4  = data[, 4]
x5  = data[, 5]
x6  = data[, 6]
x7  = data[, 7]
x8  = data[, 8]
x9  = data[, 9]
x10 = data[, 10]
x11 = data[, 11]
x12 = data[, 12]
x13 = data[, 13]
x14 = data[, 14]
fit = lm(x14 ~ x4 + x5 + x6 + x8 + x9 + x10 + x11 + x12 + x13)
summary(fit)

# We replace x9 by x15, and also transform x4.
x4  = data[, 4]
n   = length(x4)
for (i in 1:n) {
    if (x4[i] == 0) 
        x4[i] = -1
}
y   = 0
for (i in 1:n) {
    if (x9[i] >= median(x9)) 
        y[i] = 1 else y[i] = -1
}
x15  = y
fit2 = lm(x14 ~ x4 + x5 + x6 + x8 + x10 + x11 + x12 + x13 + x15)
summary(fit2)

# This is used for testing the interaction of x4 and x12, and also x4 and x15.
fit3 = lm(x14 ~ x4 + x5 + x6 + x8 + x10 + x11 + x12 + x13 + x15 + x4 * x12 + x4 * x15)
summary(fit3)

```

automatically created on 2018-05-28