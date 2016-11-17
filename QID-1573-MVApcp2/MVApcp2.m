%% clear all variables
clear
close all
clc

%% load data
x     = load('carc.txt');
frame = [x(:,8) x(:,11)]; % extracts column 8 and 10/weight and displacement; 
n     = size(frame,1);

%% standarize data
minf  = ones(n,1)*min(frame); % matrix w. 2 columns: [min(weight),min(displacement]
maxf  = ones(n,1)*max(frame); % matrix w. 2 columns: [max(weight),max(displacement]
equal = ones(n,1)*(max(frame)==min(frame)); %  equals 1 if true so that denominator is never equal zero

frame = (frame - minf)./(maxf - minf + equal)


%% plot
label = {'weight','displacement'};
parallelcoords(frame,'linewidth',1.5,'label', label,'Color','k')
title('Parallel Coordinate Plot (Car Data)')
