%% clear all variables
clear all
close all
clc

%% load data
x    = load('bank2.dat');      
x56  = x(:,5:6);

%% plot 
hold on
scatter(x56(1:100,1),x56(1:100,2),'SizeData',75)
scatter(x56(101:200,1),x56(101:200,2),'*','r','SizeData',75)
title('Swiss bank notes')

hold off