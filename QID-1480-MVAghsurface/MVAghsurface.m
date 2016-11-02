% ---------------------------------------------------------------------
% Book:         MVA 3 
% ---------------------------------------------------------------------
% Quantlet:     MVAghsurface
% ---------------------------------------------------------------------
% Description:  MVAsurface gives 3D surface plot of Gumbel-Hougard copula 
%                for theta = 3
% ---------------------------------------------------------------------
% Usage:        MVAsurface
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       produces 3D surface plots of the Gumbel-Hougard copula
% ---------------------------------------------------------------------
% Example:
% ---------------------------------------------------------------------
% Author:       Matthias Eckardt 20090914 Song Song 20090918; Matlab:
%               Awdesch Melzer 20120229
% ---------------------------------------------------------------------

% Clear variables and close windows

clear all;
close all;
clc;


N = 21;
v = 0:0.05:1;
u = v;
[uu vv] = meshgrid(u,v);

theta = 3;
% reproduction of matrix of coordinates

% C(u,v) = exp - ( (-log u)^theta + (-log v)^theta )^(1/theta)

f = exp( -( (-log(uu)).^theta + (-log(vv)).^theta ).^(1/theta) );
mesh(f)
box on
xlim([0,21]);
ylim([0,21]);
xlabel('W');
ylabel('Y');
zlabel('Z');

