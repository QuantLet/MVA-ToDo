%% clear all variables
clear
close all
clc

%% load data
x     = load('carc.txt');
frame = x(:,5:7); % extracts column 5 to 7/'headroom','rear seat','trunk space'  
n     = size(frame,1);

%% standarize data
minf  = ones(n,1)*min(frame); % matrix w. 3 columns: [min(headroom),min(rear seat), min(trunk space)]
maxf  = ones(n,1)*max(frame); % matrix w. 3 columns: [max(headroom),max(rear seat), max(trunk space)]
equal = ones(n,1)*(max(frame)==min(frame)); %  equals 1 if true so that denominator is never equal zero

frame = (frame - minf)./(maxf - minf + equal)

%% plot
label = {'headroom','rear seat','trunk space'}
parallelcoords(frame, 'linewidth',1.5, 'label', label,'Color','k')
title('Parallel Coordinate Plot (Car Data)')
