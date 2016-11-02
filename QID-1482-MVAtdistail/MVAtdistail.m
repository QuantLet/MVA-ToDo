% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVAtdistail
% ------------------------------------------------------------------------------
% Description: MVAtdistail plots four tails of probability density functions
%              of the t-distribution and one tail of the Gauss distribution
%              with different degrees of freedom (t3 stands for t-distribution
%              with 3 degrees of freedom, etc.).
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Plot of tails of the pdf of t and Gauss distributions.              
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Wolfgang Haerdle 20091002
% ------------------------------------------------------------------------------

% Clear variables and close windows
clear all;
close all;
clc;

%Tail comparison of t-distribution
xx = -6:0.01:6;

gausspdf = normpdf(xx);

tpdf1 = pdf('T',xx,1);
tpdf3 = pdf('T',xx,3);
tpdf9 = pdf('T',xx,9);
tpdf45 = pdf('T',xx,45);

hold on
box on

plot(xx, tpdf1, 'Color','k','Linewidth',2.5)
plot(xx, tpdf3, 'Color','b','Linewidth',2.5)
plot(xx, tpdf9, 'Color','r','Linewidth',2.5)
plot(xx, tpdf45, 'Color','m','Linewidth',2.5)
plot(xx, gausspdf,'Color','c','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.04])
xlim([2.5,4])
title('Tail comparison of t-distribution')
legend('t1','t3','t9','t45','Gaussian','Location','NorthEast')
hold off

