%% clear all variables and console and close windows
clear
clc
close all

%% load data
data = load('bostonh.dat');

%% Transformations
xt       = data;
xt(:, [1, 3, 5, 6, 8, 9, 10, 14]) = log(xt(:,[1, 3, 5, 6, 8, 9, 10, 14]));
xt(:, 2)  = data(:, 2)./10;
xt(:, 7)  = (data(:, 7).^(2.5))./10000;
xt(:, 11) = exp(0.4 * data(:, 11))./1000;
xt(:, 12) = data(:, 12)./100;
xt(:, 13) = sqrt(data(:, 13));
xt(:, 4)  = [];

%% standardizing data
n1 = length(xt);
m  = mean(xt);
zz = (xt - repmat(m,n1,1))./repmat(sqrt(var(xt)), n1, 1);

%% correlation matrix
dat = corr(zz);

% Maximum Likelihood Factor Analysis without varimax rotation
% factanal performs maximum-likelihood factor analysis
[lambda, ~, T, stats, F] = factoran(zz,3, 'xtype', 'data', 'rotate', 'none');
              
% estimated factor loadings
% the estimated factor loadings matrix
ld  = lambda;
com = diag(ld * ld');             %communalities are calculated
psi = diag(dat) - diag(ld * ld'); %specific variances are calculated
tbl = [lambda(:, 1), lambda(:, 2), lambda(:, 3), com, psi];

%% figure 1:
figure(1)
subplot(2, 2, 1)
% plot first factor against second
s = ['X1 '; 'X2 '; 'X3 '; 'X5 '; 'X6 '; 'X7 '; 'X8 '; 'X9 '; 'X10'; 
     'X11'; 'X12'; 'X13'; 'X14'];      % labels
hold on
plot(lambda(:, 1), lambda(:, 2),'w')
ylim([-0.7, 0.7])
title('Factors21 - theta21')
ylabel('y')
xlabel('x')
text(lambda(:, 1), lambda(:, 2), s)
line([-1, 1], [0, 0])
line([0, 0], [-1, 1])
box on
hold off

% plot first factor against third
subplot(2, 2, 3)
hold on
plot(lambda(:, 1), lambda(:, 3), 'w')
xlabel('x')
ylabel('y')
title('Factors31 - theta31')
ylim([-0.5, 0.5]) 
text(lambda(:, 1),lambda(:, 3), s)
line([-1, 1], [0, 0])
line([0, 0], [-1, 1])
box on
hold off

% plot second factor against third
subplot(2,2,2)
hold on
plot(lambda(:,2),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors32 - theta32')
xlim([-0.7,0.7])
ylim([-0.5,0.5])
text(lambda(:,2),lambda(:,3),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

%% Maximum Likelihood Factor Analysis after varimax rotation 
lambda = rotatefactors(ld, 'Method','varimax');                
% rotates the factor loadings matrix
% and estimates factor loadings after varimax

vl  = [lambda(:,1),lambda(:,2),lambda(:,3)];
com = diag(vl*vl');             %communalities are calculated
psi = diag(dat)-diag(vl*vl');   %specific variances are calculated
tbl = [vl,com,psi];

%% figure 2:
figure(2)
% plot first factor against second
subplot(2,2,1)
hold on
plot(lambda(:,1),lambda(:,2),'w')
xlabel('x')
ylabel('y')
title('Factors21 - theta21')
text(lambda(:,1),lambda(:,2),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

% plot first factor against third
subplot(2,2,3)
plot(lambda(:,1),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors31 - theta31')
text(lambda(:,1),lambda(:,3),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

% plot second factor against third
subplot(2,2,2)
hold on
plot(lambda(:,2),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors32 - theta32')
text(lambda(:,2),lambda(:,3),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

%% Principal Component Method after varimax rotation
% spectral decomposition
[eigvec,eigval] = eigs(dat);
E               = ones(size(eigvec(:,1:3)))*eigval(1:3,1:3);

% the estimated factor loadings matrix
Q      = sqrt(E).*eigvec(:,1:3);
lambda = rotatefactors(Q, 'Method', 'varimax');                 
% rotates the factor loadings matrix
% and estimates factor loadings after varimax

ld  = [lambda(:,1),lambda(:,2),lambda(:,3)];
com = diag(ld*ld');             %communalities are calculated
psi = diag(dat)-diag(ld*ld');   %specific variances are calculated
tbl = [ld,com,psi];

%% figure 3:
figure(3)
% plot first factor against second
subplot(2,2,1)
hold on
plot(lambda(:,1),lambda(:,2),'w')
xlabel('x')
ylabel('y')
title('Factors21 - theta21')
text(lambda(:,1),lambda(:,2),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

% plot first factor against third
subplot(2,2,3)
plot(lambda(:,1),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors31 - theta31')
text(lambda(:,1),lambda(:,3),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

% plot second factor against third
subplot(2,2,2)
hold on
plot(lambda(:,2),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors32 - theta32')
text(lambda(:,2),lambda(:,3),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

%% Principal Factor Method after varimax rotation
% inverse of the correlation matrix dat
f = inv(dat);

% preliminary estimate of psi
psiini          = diag(diag(1./f));
psi             = psiini;
[eigvec,eigval] = eigs(dat-psi); 
EE              = ones(size(eigvec(:,1:3)))*eigval(1:3,1:3);
QQ              = sqrt(EE).*eigvec(:,1:3);
psiold          = psi;
psi             = diag(1-sum((QQ.*QQ)'));
z               = psi-psiold;
convergence     = z;
lambda          = rotatefactors(QQ, 'Method', 'varimax');                
% rotates the factor loadings matrix
% and estimates factor loadings after varimax

ld  = [lambda(:,1),lambda(:,2),lambda(:,3)];
com = diag(ld*ld');                % communalities are calculated
psi = diag(dat)-diag(ld*ld');      % specific variances are calculated
tbl = [ld,com,psi];

%% figure 4:
figure(4)
% plot first factor against second
subplot(2,2,1)
hold on
plot(lambda(:,1),lambda(:,2),'w')
xlabel('x')
ylabel('y')
title('Factors21 - theta21')
text(lambda(:,1),lambda(:,2),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

% plot first factor against third
subplot(2,2,3)
plot(lambda(:,1),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors31 - theta31')
text(lambda(:,1),lambda(:,3),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off

% plot second factor against third
subplot(2,2,2)
hold on
plot(lambda(:,2),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors32 - theta32')
text(lambda(:,2),lambda(:,3),s)
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off
