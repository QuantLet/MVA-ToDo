% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAlrtest
% ------------------------------------------------------------------------------
% Description: MVAlrtest calculates a regression (LSE) of price of blue
%              pullovers X2, advertisement cost X3 and sales assistants X4
%              on sales X1 for a unrestricted and a restricted model and
%              runs a LR and F-test for the classic pullovers data.
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Estimated parameters for the restricted and the unrestricted
%              model and test statistics for linear restriction and the 
%              F-test.           
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Awdesch Melzer 20120307
% ------------------------------------------------------------------------------

clear all
close all
clc


  x = load('pullover.dat');  % loads data
  y = x(:,1);                  % first column (sales)
  n = length(x);               % number of observations

  x = [ones(n,1) x(:,2:4)];    % ones, second to fourth column
  p = size(x);                 % number of parameters in beta
  b = inv(x'*x)*x'*y;        % (LSE)

b
  aa = [0,1,0.5,0];           % matrix A
  a = 0;                       % constant a
  q = length(a);                 % number of parameters in constr. beta
  
  
  bc = b - inv(x'*x)*aa'*inv(aa*inv(x'*x)*aa')*(aa*b-a); % constrained MLE
bc


  lrt1 = (y-x*bc)'*(y-x*bc);
  lrt2 = (y-x*b)'*(y-x*b);
  lrt = n*log(lrt1/lrt2);     % LR test statistic
  lrt        
  pvalue = chi2cdf(lrt, q)               % prob to reject hypothesis        
  ft1=(aa*b-a)'*inv(aa*inv(x'*x)*aa')*(aa*b-a);                    
  ft2=lrt2;                    
  ft=((n-p)/q)*ft1/ft2;      % F test statistic                    
  ft = ft(2)                    
  pvalue = fcdf(ft, q, n-p);            % prob to reject hypothesis  
  pvalue = pvalue(2)
