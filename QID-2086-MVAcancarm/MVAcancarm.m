%% clear all variables and console and close windows
clear
clc
close all

%% load data
formatSpec = '%s%f%f%f%f%f%f%f%f';
data       = readtable('carmean2.dat', 'Format', formatSpec, 'ReadVariableNames', false);
cars1      = data;
cars1(:,1) = [];
cars1      = table2array(cars1);

%% Reordering the columns of the matrix
cars        = [cars1(:, 4), cars1(:, 3), cars1(:, 1:2), cars1(:, 5:8)];
s           = cov(cars);

sa          = s(1:2, 1:2);
sb          = s(3:8, 3:8);

[va1, ea1]  = eigs(sa);
[vb1, eb1]  = eigs(sb);
ea          = diag(ea1);
eb          = diag(eb1);
sa2         = va1 * diag(1./sqrt(ea)) * va1';
sb2         = vb1 * diag(1./sqrt(eb)) * vb1';

k           = sa2 * s(1:2,3:8) * sb2;
[g,l,d]     = svd(k);

a           = sa2 * g;
b           = sb2 * d;
eta         = cars(:, 1:2) * a(:, 1);
phi         = cars(:,3:8) * b(:, 1);
etaphi      = [eta, phi];
etaphi      = etaphi';

% labels
s = ['Audi       ';'BMW        ';'Citroen    ';'Ferrari    ';'Fiat       ';...
    'Ford       ';'Hyundai    ';'Jaguar     ';'Lada       ';'Mazda      ';...
    'Mercedes   ';'Mitsubishi ';'Nissan     ';'Opel Corsa ';'Opel Vectra';...
    'Peugeot    ';'Renault    ';'Rover      ';'Toyota     ';'Trabant    ';...
    'VW Golf    ';'VW Passat  ';'Wartburg   '];

%% plot
scatter(etaphi(1,:),etaphi(2,:),'.','w')
hold on
text(etaphi(1,:),etaphi(2,:),s,'FontSize',16)
title('Car Brands Data','FontSize',16,'FontWeight','Bold')
xlabel('Eta 1', 'FontSize', 16, 'FontWeight', 'Bold')
ylabel('Phi 1', 'FontSize', 16, 'FontWeight', 'Bold')
xlim([-1.2, 3.5])
ylim([0.2, 4.8])
box on
