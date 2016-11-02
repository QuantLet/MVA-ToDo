% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp7
% ---------------------------------------------------------------------
% Description:  MVApcp7 computes parallel coordinates plot.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       z1 - first data point
%               z2 - second data point
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plot with intersection.
% ---------------------------------------------------------------------
% Example:      z1 = [0,2,3,2];
%               z2 = [3,2,2,1];
%               For given data points, a parallel plot with
%               intersection is shown.
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu
% ---------------------------------------------------------------------

clear
close all
clc

z1=[0,2,3,2];
z2=[3,2,2,1];
z=[z1;z2];

parallelcoords(z,'linewidth',2,'Color','k');

title('Parallel Coordinate Plot');