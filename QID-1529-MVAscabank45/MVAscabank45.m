%% clear all variables
clear all
close all
clc

%% load data
x = load('bank2.dat');

%% plot
scatter(x(:,4),x(:,5),'k','SizeData',75)
title('Swiss bank notes')