%% clear all variables
clear
close all
clc
%% load data
x = load('carc.txt');

frame = x(:,11:13); % extracts column 11 to 13 
n     = size(frame,1);

%% standarize data
minf  = ones(n,1)*min(frame); % matrix w. 3 columns: [min(displacement),min(gear ratio),min(headquarters)]
maxf  = ones(n,1)*max(frame); % matrix w. 3 columns: [max(displacement),max(gear ratio),max(headquarters)]
equal = ones(n,1)*(max(frame)==min(frame)); %  equals 1 if true so that denominator is never equal zero

frame = (frame - minf)./(maxf - minf + equal);

%% plot
label = {'displacement','gear ratio','headquarters'}
parallelcoords(frame,'linewidth',1.5, 'label', label,'Color','k')
title('Parallel Coordinate Plot (Car Data)')
