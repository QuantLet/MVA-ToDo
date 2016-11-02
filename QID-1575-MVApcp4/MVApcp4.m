% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp4
% ---------------------------------------------------------------------
% Description:  MVApcp4 computes parallel coordinates plots for variables
%               displacement, gear ratio for high gear and company
%               headquarters of car data set.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for variables displacement,
%               gear ratio for high gear and company headquarters of car
%               data set.
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
y=y(:,11:13);

label={'displacement','gear ratio','headquarters'};

parallelcoords(y,'linewidth',1.5, 'label', label,'Color','k');

title('Parallel Coordinate Plot (Car Data)')