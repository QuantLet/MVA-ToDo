%% clear variables and close windows
close all
clear 
clc

%% load data
h = load('bank2.dat');    

%% plot
glyphplot(h, 'Glyph','face','Grid',[5 10],'Page','all')
title('Flury Faces for Bank Data');
   