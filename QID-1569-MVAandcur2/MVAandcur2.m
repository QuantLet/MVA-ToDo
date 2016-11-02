% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAandcur2
% ---------------------------------------------------------------------
% Description:  MVAandcur2 computes Andrews' curves for the observations 
%               96-105 of the Swiss bank notes data (bank2.dat).
%               Here we changed the order of the variables.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Plot of Andrews' curves for the observations 
%               96-105 of the Swiss bank notes data.   
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle
% ---------------------------------------------------------------------

 clear
 clc
 close all

 x=load('bank2.dat'); 
 
 z=x(96:105,:);                                       % extracts observations 96-105
 s=size(z);
 
 minz=repmat(min(z),s(1,1),1);
 maxmin=repmat(max(z)-min(z),s(1,1),1);
 z1=(z-minz)./(maxmin);                               % standardizes the data     
 z2=z1(:,[6;5;4;3;2;1]); 
 
 zgen=z2(1:5,:);
 zcou=z2(6:10,:);
 
 hold on
 andrewsplot(zgen,'LineWidth',1.5,'Color','k')      
 andrewsplot(zcou,'LineWidth',1.5,'Color','r','Linestyle',':')
 title('Andrews curves (Bank data)')
 hold off
