[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAsimcidif** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAsimcidif

Published in: Applied Multivariate Statistical Analysis

Description: Tests the equality of 2 groups of US Company data and computes the F-statistic and the critical value of the test and the simultaneous confidence intervals.

Keywords: F-statistic, critical-value, confidence-interval, mean, covariance, hypothesis-testing, test, financial

Author: Awdesch Melzer, Vladimir Georgescu, Song Song
Author[Matlab]: Wolfgang Haerdle, Vladimir Georgescu, Song Song

Submitted: Wed, March 14 2012 by Dedy Dwi Prastyo
Submitted[Matlab]: Thu, December 08 2016 by Piedad Castro

Datafile: uscomp2.dat

```

### MATLAB Code
```matlab

%% clear all variables and console and close windows
clear
clc
close all

%% load data
formatSpec = '%s%f%f%f%f%f%f%s';
x          = readtable('uscomp2.dat','Delimiter',' ','Format',formatSpec,'ReadVariableNames',false);
x          = table2dataset(x);
x.Var8     = nominal(x.Var8);

%% Create subsets for Energy and Manufacturing
yE = x(x.Var8 == 'Energy',:);
yM = x(x.Var8 == 'Manufacturing',:);

%% Calculate means of groups
exE = [mean(yE.Var2), mean(yE.Var3)];
exM = [mean(yM.Var2), mean(yM.Var3)];

disp('Mean group Energy of assets (V2) and sales (V3)')
disp(exE)

disp('Mean group Manufacturing of assets (V2) and sales (V3)')
disp(exM)

%% Estimating variance of the groups observations within the groups and overall
nE = length(yE);
nM = length(yM);
n  = nE+nM;

%% number of groups
[~, p] = size(exE);

sE = ((nE-1)/nE) * cov(yE.Var2,yE.Var3);
sM = ((nM-1)/nM)*cov(yM.Var2,yM.Var3);

s    = (nE.*sE+nM.*sM)./(nE+nM);
sinv = inv(s);
k    = nE*nM*(n-p-1)/(p*(n^2));

%% Computing the test statistic
f = k.*(exE-exM)*sinv*(exE-exM)'

%% Computing the critical value
critvalue = finv(1-0.05, 2, 22)

%% Computes the simultaneous confidence intervals
deltau = (exE-exM)' + sqrt(finv(1-0.05, p,n-p-1).*(1/k).*diag(s));
deltal = (exE-exM)' - sqrt(finv(1-0.05, p,n-p-1).*(1/k).*diag(s));

confit = [deltal,deltau]

```

automatically created on 2018-05-28

### R Code
```r


# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# Load data
x = read.table("uscomp2.dat")
y = data.frame(x)

# Create subsets for Energy and Manufacturing
yE = subset(y, y$V8 == "Energy")
yM = subset(y, y$V8 == "Manufacturing")

# Calculate means of groups
exE = cbind(apply(yE[, 2:3], 2, mean))
exM = cbind(apply(yM[, 2:3], 2, mean))

print("Mean group Energy of assets (V2) and sales (V3)")
exE

print("Mean group Manufacturing of assets (V2) and sales (V3)")
exM

# Estimating variance of the groups observations within the groups and overall
nE  = length(yE[, 1])
nM  = length(yM[, 1])
n   = nE + nM

# number of groups
p   = length(exE)

sE  = ((nE - 1)/nE) * cov(yE[, 2:3])
sM  = ((nM - 1)/nM) * cov(yM[, 2:3])

s     = (nE * sE + nM * sM)/(nE + nM)
sinv  = solve(s)
k     = nE * nM * (n - p - 1)/(p * (n^2))

# Computing the test statistic
(f = k * t(exE - exM) %*% sinv %*% (exE - exM))

# Computing the critical value
(critvalue = qf(1 - 0.05, 2, 22))

# Computes the simultaneous confidence intervals
deltau  = (exE - exM) + sqrt(qf(1 - 0.05, p, n - p - 1) * (1/k) * diag(s))
deltal  = (exE - exM) - sqrt(qf(1 - 0.05, p, n - p - 1) * (1/k) * diag(s))

(confit = cbind(deltal, deltau)) 

```

automatically created on 2018-05-28