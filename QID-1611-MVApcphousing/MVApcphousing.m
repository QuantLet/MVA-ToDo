% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcphousing
% ---------------------------------------------------------------------
% Description:  MVApcphousing computes PCP for all of the Boston
%               housing data.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       PCP for all of the Boston housing data.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu,
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------
clear
clc
close all

x=load('bostonh.dat');
z=x(:,1:14);

s=size(z);

minz=repmat(min(z),s(1,1),1);
maxz=repmat(max(z),s(1,1),1);

maxmin=repmat(max(z)-min(z) + (max(z)==min(z)) ,s(1,1),1);
z=(z-minz)./(maxmin);      % standardizes the data
p=z';

hold on
for i=1:length(x)
    k=x(i,14)<=median(x(:,14));
    if k==1;
        plot(p(:,i),'Color','k')
    else
        plot(p(:,i),'Color','r','LineStyle','--')
    end
end

hold off
title('Boston Housing')
