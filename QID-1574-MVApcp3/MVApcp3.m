%% clear all variables
clear
close all
clc

%% load data
x = load('carc.txt');

frame = [x(:,2) x(:,8)]; % extracts column 2 and 8 
n     = size(frame,1);

%% standarize data
minf  = ones(n,1)*min(frame); % matrix w. 2 columns: [min(mileage),min(weight)]
maxf  = ones(n,1)*max(frame); % matrix w. 2 columns: [max(mileage),max(weight)]
equal = ones(n,1)*(max(frame)==min(frame)); %  equals 1 if true so that denominator is never equal zero

frame = (frame - minf)./(maxf - minf + equal);

%% plot
label = {'mileage','weight'};
parallelcoords(frame,'linewidth',1.5,'label',label,'Color','k')
title('Parallel Coordinate Plot(Car Data)')
