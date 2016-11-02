% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp3
% ---------------------------------------------------------------------
% Description:  MVApcp3 computes parallel coordinates plots for variables 
%               mileage and weight car data set.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for variables mileage
%               and weight car data set.
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
y=[y(:,2) y(:,8)];

label={'mileage','weight'};
parallelcoords(y,'linewidth',1.5,'label',label,'Color','k')

title('Parallel Coordinate Plot(Car Data)')