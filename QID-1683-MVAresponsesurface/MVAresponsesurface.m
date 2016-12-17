%% clear all variables and console and close windows
clear
clc
close all

%% Define x1 and x2 between [-1:1].
x1       = (-1:0.05:1)'; 
[n1, p1] = size(x1);
x2       = (-1:0.05:1)';
[n2, p2] = size(x2);

b = [20 1 2 -8 -6  6]';     %Set beta
L = [];

%% Compute y
for i = 1:n1
    xi   = x1(i);
    temp = [];
    for j = 1:n2
        xj   = x2(j);
        Lij  = b(1) + b(2) * xi + b(3) * xj + b(4) * xi^2 + b(5) * xj^2 + b(6) * xi * xj; 
        temp = [temp Lij];
    end
    L = [L; temp];
end

%% Plot mesh grid
figure
mesh(x2, x1, L')
xlabel ('X_2')
ylabel('X_1')
zlabel('Y')

%% Plot contour lines
figure
contour(x1, x2, L', 20)
xlabel ('X_1')
ylabel('X_2')
zlabel('Y')

%% Plot x1 and x2 as surface
figure
surf(x2, x1, L')
xlabel ('X_2')
ylabel('X_1')
zlabel('Y')
