% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAfacebank50
% ---------------------------------------------------------------------
% Description:  MVAfacebank50 computes Flury faces for the Swiss bank 
%               notes data (bank2.dat).
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Computes Flury faces for the Swiss bank notes data 
%               (bank2.dat).
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

close all
clear 
clc

h=load('bank2.dat');    
glyphplot(h, 'Glyph','face','Grid',[5 10],'Page','all')
title('Flury Faces for Bank Data');
   