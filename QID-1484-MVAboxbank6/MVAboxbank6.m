% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAboxbank6
% ---------------------------------------------------------------------
% Description:  MVAboxbank6 computes Boxplots for the diagonal
%               (Variable 6) of the genuine and forged banknotes from
%               bank2.dat, respectively.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Boxplots for the diagonal (Variable 6)
%               of the genuine and forged banknotes from bank2.dat,
%               respectively.
% ---------------------------------------------------------------------
% Example:
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

clear
close all
clc

x=load('bank2.dat');
m1=mean(x(1:100,6))
m2=mean(x(101:200,6))
hold on
line([0.6 1.4],[m1 m1],'Color','k','LineStyle',':','LineWidth',1.2)
line([1.6 2.4],[m2 m2],'Color','k','LineStyle',':','LineWidth',1.2)
boxplot([x(1:100,6) x(101:200,6)],'Symbol','o','labels',{'GENUINE','COUNTERFEIT'},'widths',0.8)
title('Swiss Bank Notes')
hold off