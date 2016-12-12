%% clear variables and close windows
close all 
clear
clc

%% load data
h = load('bank2.dat');
h = h(91:110,:);

%% plot
glyphplot(h, 'Glyph','face')
title('Observations 91 to 110')
    