% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp2
% ---------------------------------------------------------------------
% Description:  MVApcp2 Computes parallel coordinates plots for variables 
%               weight and displacement of the car data set.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for variables weight and
%               displacement of the car data set.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu
% ---------------------------------------------------------------------

clear
close all
clc

z= load('carc.txt');

y=(z-(ones(74,1)*min(z)))./(ones(74,1)*(max(z)-min(z)+(max(z)==min(z))));
y=[y(:,8) y(:,11)];

label={'weight','displacement'};
parallelcoords(y,'linewidth',1.5,'label', label,'Color','k')

title('Parallel Coordinate Plot (Car Data)')