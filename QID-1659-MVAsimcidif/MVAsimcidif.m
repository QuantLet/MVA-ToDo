% ---------------------------------------------------------------------
% Book:         MVA3
% ---------------------------------------------------------------------
% Quantlet:     MVAsimcidif
% ---------------------------------------------------------------------
% Description:  MVAsimcidif tests the equality of 2 groups of US 
%               Company data. It computes the F-statistic and the 
%               critical value of the test and the simultaneous 
%               confidence intervals.  
% ---------------------------------------------------------------------
% Usage:        MVAsimcidif
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Tests the equality of 2 groups of US Company data. 
%               It computes the F-statistic and the critical value of 
%               the test and the simultaneous confidence intervals.  
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song,
%				R: Awdesch Melzer 20120301
% ---------------------------------------------------------------------

% Clear variables and close windows
clear all
close all
clc

% Load data
[A,B,C,D,E,F,G,H]=textread('uscomp2.dat','%s %f %f %f %f %f %f %s');

y = [B C];
x = B;
% Create subsets for Energy and Manufacturing
% Energy = 1 in 3:17
for k = 3:17
x(k)= 1; 
end
% Manufacturing = 2 in 43:52
for k = 43:52
x(k)= 2; 
end
n = length(B);
% Else
for k = 53:n
    x(k) = 0;
end


yE = y(3:17,1:2);
yM = y(43:52,1:2);

% Calculate means of groups
exE = mean(yE);
exM = mean(yM);

disp('Mean group Energy of assets (V2) and sales (V3)')
exE

disp('Mean group Manufacturing of assets (V2) and sales (V3)')
exM


% Estimating variance of the groups
% observations within the groups and overall
nE = length(yE);
nM = length(yM);
n = nE+nM;
% number of groups
[dump p] = size(exE);

sE = ((nE-1)/nE)*cov(yE);
sM = ((nM-1)/nM)*cov(yM);

s = (nE.*sE+nM.*sM)./(nE+nM);
sinv = inv(s);
k = nE*nM*(n-p-1)/(p*(n^2));

% Computing the test statistic
f = k.*(exE-exM)*sinv*(exE-exM)';
f
% Computing the critical value

critvalue = finv(1-0.05, 2, 22);
critvalue
%Computes the simultaneous confidence intervals
deltau = (exE-exM)' + sqrt(finv(1-0.05, p,n-p-1).*(1/k).*diag(s));
deltal = (exE-exM)' - sqrt(finv(1-0.05, p,n-p-1).*(1/k).*diag(s));

confit = [deltal,deltau];
confit
