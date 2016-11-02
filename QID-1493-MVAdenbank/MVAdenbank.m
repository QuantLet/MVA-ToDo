% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdenbank
% ---------------------------------------------------------------------
% Description:  MVAdenbank computes kernel density estimates of the 
%               diagonal of the genuine and forged swiss bank notes 
%               (bank2.dat). The bandwidth parameter are chosen by 
%               Silverman's rule of thumb.      
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Kernel density estimates of the diagonal of the genuine 
%               and forged swiss bank notes (bank2.dat).      
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:        Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

clear
close all
clc

x=load('bank2.dat');      
x1=x(1:100,6);
x2=x(101:200,6);
[f1,xi1]=ksdensity(x1); 
[f2,xi2]=ksdensity(x2);
hold on
plot(xi1,f1,'LineWidth',2,'Color','k')
plot(xi2,f2,'LineWidth',2,'Color','r','LineStyle',':')
title('Swiss bank notes')
xlabel('Counterfeit              /             Genuine')
ylabel('Density estimates for diagonals')
hold off