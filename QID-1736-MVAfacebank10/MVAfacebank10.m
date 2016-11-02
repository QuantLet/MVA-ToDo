% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAfacebank10
% ---------------------------------------------------------------------
% Description:  MVAfacebank10 computes Flury faces for the Swiss bank 
%               notes data (bank2.dat).
%               Interesting plot is obtained for obs 91-110.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Computes Flury faces for the Swiss bank notes data 
%               (bank2.dat).
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

close all 
clear
clc

h=load('bank2.dat');
h=h(91:110,:);
glyphplot(h, 'Glyph','face')
title('Observations 91 to 110')
    