% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcorrnorm
% ---------------------------------------------------------------------
% Description:  MVAcorrnorm computes a two dimensional scatterplot of 
%               two correlated normal random variables. 
%               Corresponds to example 3.13 in MVA.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       sig - Covariance matrix
% ---------------------------------------------------------------------
% Output:       Scatterplot of two correlated normal random variables.  
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

close all
clear
clc

n=150;

sig=[1 0.8
     0.8 1];               %Define a covariance matrix

[vector,value] = eig(sig); %Compute the eigentvalues and eigenvectors for sig
ll = sqrt(value);          %Square root of the eigenvalues
sh = vector*ll*vector';    %Compute 

nr = normrnd(0,1,n,size(sig,1)); %Normal random variables

y = nr*sh';                 

scatter(y(:,1),y(:,2),75,'k') %Create scatterplot
xlim([-3 3]);
ylim([-3 3]);
title('Normal sample, n=150')
xlabel('X')
ylabel('Y')

