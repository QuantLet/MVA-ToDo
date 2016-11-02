% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAregbank
% ---------------------------------------------------------------------
% Description:  MVAregbank computes a linear regression of column 5
%               (upper inner frame) and column 4 (lower inner frame)
%               for the genuine Swiss bank notes (bank2.dat).
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Linear regression of column 5 (upper inner frame) and 
%               column 4 (lower inner frame) for the genuine Swiss bank
%               notes (bank2.dat).
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

close all
clear
clc

x=load('bank2.dat');   

X4=x(1:100,4);
X5=x(1:100,5);

X = [ones(length(X4),1) X4];   % matrix with only ones in the first column and X4(lower inner frame) on the second column
[b]=regress(X5,X);             % regression of (X5) on (X4) price
Y=b(1)+b(2).*X4;               % regression line

hold on
scatter(X4,X5,75,'k')
plot(X4,Y,'r','LineWidth',2)
title('Swiss bank notes')
xlabel('Lower inner frame (X4), genuine')
ylabel('Upper inner frame (X5), genuine')
hold off
