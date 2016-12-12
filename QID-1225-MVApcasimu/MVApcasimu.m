%% clear all variables and console and close windows
clear
clc
close all

%% parameter settings
rng(123)    % set seed for the generation of random numbers
n   = 200;
rho = 0.5;
mu  = [0 0];
sig = [1 rho; rho 1];

[vector,value] = eig(sig);
ll             = sqrt(value);
sh             = vector*ll*vector';
nr             = mvnrnd(mu,sig,n);
x              = nr*sh';

direction1 = vector(:,2);
direction2 = -vector(:,1);
norm       = [direction1'*direction1 direction1'*direction1];
direction1 = direction1./sqrt(norm(1));
direction2 = direction2./sqrt(norm(2));

pd1     = sort(x*direction1);  % give the magnitude
d31     = pd1*direction1';     % "direction" controls the direction
pd2     = sort(x*direction2);  % give the magnitude
d32     = pd2*direction2';     % "direction" controls the direction
d4(:,1) = x(:,1);
d4(:,2) = 0;
d5(:,1) = x(:,2);
d5(:,2) = 0;

%% plots, first component
figure
%% direction in data 
subplot(3,1,1,'FontSize',16,'FontWeight','bold');
title('Direction in Data');
hold on
scatter(x(:,1),x(:,2),'k');
plot(d31(:,1),d31(:,2),'r','LineWidth',2);
%% projection
subplot(3,1,2,'FontSize',16,'FontWeight','bold');
title('Projection');
hold on
scatter(d4(:,1),d4(:,2),'k');
%% information
subplot(3,1,3,'FontSize',16','FontWeight','bold');
varexp  = var(pd1);
varsum  = sum(var(x));
varperc = varexp/varsum;
axis off
text(0,0.7,'Explained variance','FontSize',16,'FontWeight','bold');
w = num2str(varexp,'%10.5f');
text(0.6,0.7,w,'FontSize',16,'FontWeight','bold');
text(0,0.4,'Total variance','FontSize',16,'FontWeight','bold');
w = num2str(varsum,'%10.5f');
text(0.6,0.4,w,'FontSize',16,'FontWeight','bold');
text(0,0.1,'Explained percentage','FontSize',16,'FontWeight','bold');
w = num2str(varperc,'%10.5f');
text(0.6,0.1,w,'FontSize',16,'FontWeight','bold');

%% plots, second component
figure
%% direction in data 
subplot(3,1,1,'FontSize',16,'FontWeight','bold');
title('Direction in Data');
hold on
scatter(x(:,1),x(:,2),'k');
plot(d32(:,1),d32(:,2),'r','LineWidth',2);
%% projection
subplot(3,1,2,'FontSize',16,'FontWeight','bold');
title('Projection');
hold on
scatter(d5(:,1),d5(:,2),'k');
%% information
subplot(3,1,3,'FontSize',16','FontWeight','bold');
varexp  = var(pd2);
varsum  = sum(var(x));
varperc = varexp/varsum;
axis off
text(0,0.7,'Explained variance','FontSize',16,'FontWeight','bold');
w = num2str(varexp,'%10.5f');
text(0.6,0.7,w,'FontSize',16,'FontWeight','bold');
text(0,0.4,'Total variance','FontSize',16,'FontWeight','bold');
w = num2str(varsum,'%10.5f');
text(0.6,0.4,w,'FontSize',16,'FontWeight','bold');
text(0,0.1,'Explained percentage','FontSize',16,'FontWeight','bold');
w=num2str(varperc,'%10.5f');
text(0.6,0.1,w,'FontSize',16,'FontWeight','bold');
