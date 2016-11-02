% -------------------------------------------------------------------------
% Book:         MVA
% -------------------------------------------------------------------------
% Quantlet:     MVAboxbank1
% -------------------------------------------------------------------------
% Description:  MVAboxbank1 computes Boxplots for the length (Variable 1)
%               of the genuine and forged banknotes from bank2.dat,
%               respectively.
% -------------------------------------------------------------------------
% Usage:        -
% -------------------------------------------------------------------------
% Inputs:       none
% -------------------------------------------------------------------------
% Output:       Boxplots for the length (Variable 1) of the genuine and
%               forged banknotes from bank2.dat, respectively.
% -------------------------------------------------------------------------
% Example:
% -------------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron, Song 
%               Song
% -------------------------------------------------------------------------

close all
clear
clc

x=load('bank2.dat');
m1=mean(x(1:100,1));
m2=mean(x(101:200,1));
hold on
line([0.6 1.4],[m1 m1],'Color','k','LineStyle',':','LineWidth',1.2)
line([1.6 2.4],[m2 m2],'Color','k','LineStyle',':','LineWidth',1.2)
boxplot([x(1:100,1) x(101:200,1)],'Symbol','o','labels',{'GENUINE','COUNTERFEIT'},'widths',0.8)
title('Swiss Bank Notes')
hold off