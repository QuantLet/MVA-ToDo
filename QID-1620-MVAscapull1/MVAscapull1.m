% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAscapull1
% ---------------------------------------------------------------------
% Description:  MVAscapull 1 computes a two dimensional scatterplot of 
%               X2 (price) and X1 (sales) from the pullovers data set.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Two dimensional scatterplot of X2 (price) and X1 
%               (sales) from the pullovers data set.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron, 
%               Song Song
% ---------------------------------------------------------------------

clear
clc
close all

x=load('pullover.dat');    

scatter(x(:,2),x(:,1),25,'k','SizeData',75)
title('Pullovers Data')
xlabel('Price (X2)')
ylabel('Sales (X1)')
xlim([78 127])
 