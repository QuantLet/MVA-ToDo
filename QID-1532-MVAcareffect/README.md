[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAcareffect** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAcareffect

Published in: Applied Multivariate Statistical Analysis

Description: Computes the effect of weight and the displacement on the mileage. Uses linear regression to extract the coefficients of the regressors. Additionally, the program checks whether the origin of the car has an effect on the response while considering different levels.

Keywords: regression, multivariate, linear, linear-regression, linear-model 

Author: Mengmeng Guo
Author[Matlab]: Awdesch Melzer

Submitted: Tue, February 07 2012 by Dedy Dwi Prastyo
Submitted[Matlab]: Thu, December 08 2016 by Piedad Castro

Datafile: carc.dat

```

### MATLAB Code
```matlab

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
 
```

automatically created on 2018-05-28

### R Code
```r


# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# Extract factors and build simple regression model for testing the W and D on effect of M
data  = read.table("carc.dat")
y     = data[, 2]
x1    = data[, 8]
x2    = data[, 11]
x     = cbind(x1, x2)
fit1  = lm(y ~ x)
summary(fit1)

# Adding the origin factor into the regression model to check the effect
x3    = data[, 13]
xx    = cbind(x, x3)
fit2  = lm(y ~ xx)
summary(fit2)

# Checking whether different levels have different effects on the mileage
xxx   = data[order(data[, 13]), ]

# Level: c = 1
y1    = xxx[1:52, ]
fit3  = lm(y1[, 2] ~ y1[, 8] + y1[, 11])
summary(fit3)

# Level: c = 2
y2    = xxx[53:63, ]
fit4  = lm(y2[, 2] ~ y2[, 8] + y2[, 11])
summary(fit4)

# Level: c = 3
y3    = xxx[63:74, ]
fit5  = lm(y3[, 2] ~ y3[, 8] + y3[, 11])
summary(fit5)

```

automatically created on 2018-05-28