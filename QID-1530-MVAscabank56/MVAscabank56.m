% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAscabank56
% ---------------------------------------------------------------------
% Description:  MVAscabank56 computes a two dimensional scatterplot of 
%               X5 vs. X6 (upper inner frame vs. diagonal) of the Swiss 
%               bank notes ("bank2.dat").
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Two dimensional scatterplot of X5 vs. X6 (upper inner 
%               frame vs. diagonal) of the Swiss bank notes 
%               ("bank2.dat").      
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

clear all
close all
clc

x=load('bank2.dat');      

x56=x(:,5:6);

hold on
scatter(x56(1:100,1),x56(1:100,2),'SizeData',75)
scatter(x56(101:200,1),x56(101:200,2),'*','r','SizeData',75)
title('Swiss bank notes')

hold off