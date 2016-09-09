% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAbankruptcydis
% ---------------------------------------------------------------------
% Description:  Successful classification ratio dynamic over the number
%               of terminal nodes: cross-validation.
% ---------------------------------------------------------------------
% Usage:        MVAbankruptcydis
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Successful classification ratio dynamic over the number
%               of terminal nodes: cross-validation.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Song Song, Vladimir Georgescu
% ---------------------------------------------------------------------
x = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30, 31, 32, 33, 34,35,36,37,38,39,40];

y = [62,62,60,60,60,61,61,60,60,60,59,58,58,58,57,57,57,57,57,57,57,57,58,58,58,58,58,58, 58, 58, 58,58,58,58,58, 61,61,61,61, 61];

p = y/83;

plot(p,'LineWidth',1.5)
title('Classification ratio by minsize parameter');
xlabel('MinSize parameter');
ylabel('Classification Ratio')
xlim([0 41])
ylim([0.4 1])