% -------------------------------------------------------------------------
% Book:         MVA
% -------------------------------------------------------------------------
% Quantlet:     MVAresponsesurface
% -------------------------------------------------------------------------
% Description:  MVAresponsesurface plots 3D response surfaces and a contour 
%               plot for the variable y and the two factors that explain 
%               the variation of y via the quadratic response model.
% -------------------------------------------------------------------------
% Usage:        -
% -------------------------------------------------------------------------
% Inputs:       None
% -------------------------------------------------------------------------
% Output:      For a given value of beta the response surface can be
%              represented in a 3-dimensional plot. We display two three 
%              dimensional response surfaces and a contour plot.
% -------------------------------------------------------------------------
% Example:      -
% -------------------------------------------------------------------------
% Author:       Wolfgang Haerdle 20091001
% -------------------------------------------------------------------------

clear all
close all
clc

%Define x1 and x2 between [-1:1].
x1=[-1:0.05:1]'; 
[n1,p1]=size(x1);
x2=[-1:0.05:1]';
[n2,p2]=size(x2);

b=[20 1 2 -8 -6  6]'; %Set beta

L=[];

%Calculate y
for i=1:n1
    xi=x1(i);
    temp=[];
    for j=1:n2
        xj=x2(j);
        Lij=b(1)+b(2)*xi + b(3)*xj + b(4)*xi^2 + b(5)*xj^2 + b(6)*xi*xj; 
        temp=[temp Lij];
    end
    L=[L;temp];
end

%Plot mesh grid
figure
mesh(x1,x2,L')
xlabel ('X_1');ylabel('X_2');zlabel('Y')

%Plot contour lines
figure
contour(x1,x2,L',20)
xlabel ('X_1');ylabel('X_2');zlabel('Y')

%Plot x1 and x2 as surface
figure
surf(x1,x2,L')
xlabel ('X_1');ylabel('X_2');zlabel('Y')