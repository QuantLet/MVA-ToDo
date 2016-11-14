%% clear all variables
clear
clc
close all

%% load data
x    = load('bank2.dat');
x456 = x(:,4:6);

%% plot
scatter3(x456(1:100,1),x456(1:100,2),x456(1:100,3),'SizeData',75)
hold on
scatter3(x456(101:200,1),x456(101:200,2),x456(101:200,3),'*','r','SizeData',75)

title('Swiss bank notes')
xlabel('Lower inner frame (X4)')
ylabel('Upper inner frame (X5)')
zlabel('Diagonal (X6)')

hold off
