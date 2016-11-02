% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcontbank2
% ---------------------------------------------------------------------
% Description:  MVAcontbank2 gives a contour plot of the kernel density estimate of 
%               variables  X5 and X6 of the Swiss bank notes 
%               ("bank2.dat").
% ---------------------------------------------------------------------
% Usage:        MVAcontbank2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Contour Plot of the kernel density estimate
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Song Song, Vladimir Georgescu, Jorge
% Patron 20090816
% ---------------------------------------------------------------------

xx=load('bank2.dat');

x=[xx(:,5) xx(:,6)];

[f1,xi1] = ksdensity(x(:,1));
[f2,xi2] = ksdensity(x(:,2));
contour(f1'*f2,8,'LineWidth',3)