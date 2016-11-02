% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAparcoo1
% ---------------------------------------------------------------------
% Description:  MVAparcoo1 computes a parallel coordinate plot for the
%               observations 96-105 of the Swiss bank notes data
%               (bank2.dat).
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Parallel coordinate plot for the observations 96-105 of
%               the Swiss bank notes data (bank2.dat).
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu,
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

clear
close all
clc

x=load('bank2.dat');
z=x(96:105,:);               % extracts observations 96-105
s=size(z);

minz=repmat(min(z),s(1,1),1);
maxmin=repmat(max(z)-min(z),s(1,1),1);
z=(z-minz)./(maxmin);        % standardizes the data
z=z';
hold on
plot(z(:,1:5),'Color','k','LineWidth',2)
plot(z(:,6:10),'Color','r','LineWidth',2,'LineStyle','-.')
hold off
title('Parallel coordinate plot (Bank data)')