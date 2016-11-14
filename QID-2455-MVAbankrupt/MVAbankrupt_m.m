% ----------------------------------------------------------------------------
% Book:          MVA
% ----------------------------------------------------------------------------
% Quantlet:      MVAbankrupt
% ----------------------------------------------------------------------------
% Description:   Computes the effects of financial characteristics 
%                on bankrupt with logit model.             
% ----------------------------------------------------------------------------
% Usage:         -
% ----------------------------------------------------------------------------
% Inputs:        Bankrupt dataset
% ----------------------------------------------------------------------------
% Output:        The coefficients of the five characteristics 
% ----------------------------------------------------------------------------
% Example:       We input bankrupt data and use logit model to find the 
%                relationship between the variables in the data set.
% ----------------------------------------------------------------------------
% Remark:        We use backfitting method to choose the indepedent varibles. 
%                In this example, we choose three variables as the indepedent 
%                variables.
% ----------------------------------------------------------------------------
% Author:        Awdesch Melzer 20120315
% ----------------------------------------------------------------------------

% close windows and clear variables
close all
clear all
clc

% read data and set variables  

data = load('bankrupt.txt');

y = data(:,6);
x1 = data(:,1);
x2 = data(:,2);
x3 = data(:,3);
x4 = data(:,4);
x5 = data(:,5);

% compute logit model

 [b,dev,stats] = glmfit([x3,x4,x5], [y ones(length(y),1)], 'binomial', 'link', 'logit');

 disp('Statistics table of estimated coefficients, std. errors, test statistic and p-values');
 [stats.beta,stats.se,stats.t,stats.p]
 
 