% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnmdscar1
% ---------------------------------------------------------------------
% Description:  MVAnmdscar1 plots the initial configuration of the 
%               points for nonmetric MDS for car marks data.       
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the initial configuration of the points for 
%               nonmetric MDS for car marks data.   
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

clear
close all
clc

x=[[3 2 1 10];[2 7 3 4]];
xlim([0 12])
ylim([0 8])
text(x(1,1),x(2,1),'Mercedes')
text(x(1,2),x(2,2),'Jaguar')
text(x(1,3),x(2,3),'Ferrari')
text(x(1,4),x(2,4),'VW')
title('Initial Configuration')
