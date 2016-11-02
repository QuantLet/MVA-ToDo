% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAprofil
% ---------------------------------------------------------------------
% Description:  MVAprofil plots an example of population profiles. 
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Example of population profiles. 
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

clear
close all
clc

x1=[2 3 4 2.8 3];     %Define group 1
x2=[1.5 2 1.5 2 2.2]; %Define group 2

plot(x1,'r','LineWidth',2)
title('Population Profiles')
xlabel('Treatment')
ylabel('Mean')

hold on 

plot(x2,'b','LineWidth',2,'Linestyle','--')
legend('Group 1','Group 2')
axis([1 5 0 5])

hold off
