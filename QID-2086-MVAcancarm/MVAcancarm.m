% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcancarm
% ---------------------------------------------------------------------
% Description:  MVAcancarm performs a canonical correlation analysis
%               for the car marks data (carmean2.dat) and shows
%               a plot of the first canonical variables.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Canonical correlation analysis for the car marks data
%               (carmean2.dat) and shows a plot of the first
%               canonical variables.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

clear
close all
clc

%Read data
[type, economy, service, value, price, design, sporty, safety, handling] = textread('carmean2.dat','%s %f %f %f %f %f %f %f %f');

cars1       = horzcat(economy, service, value, price, design, sporty, safety, handling); % Horizontal concatenation, creates data matrix

%Reordering the columns of the matrix
cars        = [cars1(:,4),cars1(:,3),cars1(:,1:2),cars1(:,5:8)];
s           = cov(cars);

sa          = s(1:2,1:2);
sb          = s(3:8,3:8);

[va1 ea1]   = eigs(sa);
[vb1 eb1]   = eigs(sb);
ea          = diag(ea1);
eb          = diag(eb1);
sa2         = va1*diag(1./sqrt(ea))*va1';
sb2         = vb1*diag(1./sqrt(eb))*vb1';

k           = sa2*s(1:2,3:8)*sb2;
[g,l,d]     = svd(k);

a           = sa2*g;
b           = sb2*d;
eta         = cars(:,1:2)*a(:,1);
phi         = cars(:,3:8)*b(:,1);
etaphi      = [eta,phi];
etaphi      = etaphi';
hold on
s           = ['Audi       ';'BMW        ';'Citroen    ';'Ferrari    ';'Fiat       ';...
    'Ford       ';'Hyundai    ';'Jaguar     ';'Lada       ';'Mazda      ';...
    'Mercedes   ';'Mitsubishi ';'Nissan     ';'Opel Corsa ';'Opel Vectra';...
    'Peugeot    ';'Renault    ';'Rover      ';'Toyota     ';'Trabant    ';...
    'VW Golf    ';'VW Passat  ';'Wartburg   '];

scatter(etaphi(1,:),etaphi(2,:),'.','w')

for i=1:23
    text(etaphi(1,i),etaphi(2,i),s(i,1:11),'FontSize',16,'FontWeight','Bold');
end

title('Car Marks Data','FontSize',16,'FontWeight','Bold');
xlabel('Eta 1','FontSize',16,'FontWeight','Bold');
ylabel('Phi 1','FontSize',16,'FontWeight','Bold');
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
xlim([-1.2,3.5]);
ylim([0.2,4.8]);
box on

% to save the plot in pdf or png please uncomment next 2 lines:
%print -painters -dpdf -r600 MVAcancarm.pdf
%print -painters -dpng -r600 MVAcancarm.png