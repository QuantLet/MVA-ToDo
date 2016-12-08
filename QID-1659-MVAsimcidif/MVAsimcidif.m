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
