%% Clear variables and close windows
clear all
close all
clc

%% set input
N = 21;
v = 0:0.05:1;
u = v;
theta = 3;

[uu vv] = meshgrid(u,v);

f = exp( -( (-log(uu)).^theta + (-log(vv)).^theta ).^(1/theta) );

%% plot
mesh(f)
box on
xlim([0,21])
ylim([0,21])
xlabel('W')
ylabel('Y')
zlabel('Z')
