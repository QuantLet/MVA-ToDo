%% clear all variables and console and close windows
clear
clc
close all

%% load data
x = load('pullover.dat');

y = x(:,1);                  % first column (sales)
n = length(x);               % number of observations
x = [ones(n,1) x(:,2:4)];    % ones, second to fourth column
p = size(x);                 % number of parameters in beta
b = inv(x'*x)*x'*y           % MLE (LSE)

aa = [0,1,0.5,0];            % matrix A
a  = 0;                      % constant a
q  = length(a);              % number of parameters in constr. beta
  
bc = b - inv(x'*x)*aa'*inv(aa*inv(x'*x)*aa')*(aa*b-a)  % constrained MLE

lrt1 = (y-x*bc)'*(y-x*bc);
lrt2 = (y-x*b)'*(y-x*b);
lrt  = n*log(lrt1/lrt2)     % LR test statistic

pvalue = chi2cdf(lrt, q)    % prob to reject hypothesis        

ft1 = (aa*b-a)'*inv(aa*inv(x'*x)*aa')*(aa*b-a);                    
ft2 = lrt2;                    
ft  = ((n-p)/q)*ft1/ft2;      % F test statistic                    
ft  = ft(2)         

pvalue = fcdf(ft, q, n-p)     % prob to reject hypothesis  
