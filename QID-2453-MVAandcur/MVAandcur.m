% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAandcur
% ---------------------------------------------------------------------
% Description:  MVAandcur computes Andrew`s Curves for the observations 
%               96-105 of the Swiss bank notes data (bank2.dat).
% ---------------------------------------------------------------------
% Usage:        MVAandcur
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of Andrew`s Curves for the observations 
%               96-105 of the Swiss bank notes data. 
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle
% ---------------------------------------------------------------------

%close windows, clear variables
close all
clear
clc


 x=load('bank2.dat');                  % reads the bank data
 z=x(96:105,:);                        % extracts observations 96-105
 
 s=size(z);
 
 minz=repmat(min(z),s(1,1),1);
 maxmin=repmat(max(z)-min(z),s(1,1),1);
 z1=(z-minz)./(maxmin);               % standardizes the data     
 
 zgen=z1(1:5,:);
 zcou=z1(6:10,:);
 
 hold on
 andrewsplot(zgen,'LineWidth',2,'Color','k') 
 andrewsplot(zcou,'LineWidth',2,'Color','r','LineStyle',':')
 title('Andrews curves (Bank data)')
 hold off
 