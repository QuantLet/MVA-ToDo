% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAfacthous
% ------------------------------------------------------------------------------
% Description:  MVAfacthous performs factor analysis based on 3 factors for the 
%               transformed boston housing data (bostonh.dat) using three  
%               different methods.              
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       Plots for Maximum Likelihood Method (MLM) without varimax rotation, 
%               Maximum Likelihood Method after varimax rotation, Principal 
%               Component Method (PCM) after varimax rotation, Principal 
%               Factor Method (PFM) after varimax rotation for the transformed 
%               bostonh.dat and also the estimated factor loadings, the 
%               communalities and the specific variances for each method.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20100305;
%               Matlab: Awdesch Melzer 20120321;
% ------------------------------------------------------------------------------

% clear variables and close windows
clear all;
close all;
clc;
% load data
data     = load('bostonh.dat');
% transform data
xt       = data;
xt(:,[1,3,5,6,8,9,10,14]) = log(xt(:,[1,3,5,6,8,9,10,14]));
xt(:,2)  = data(:,2)./10;
xt(:,7)  = (data(:,7).^(2.5))./10000;
xt(:,11) = exp(0.4*data(:,11))./1000;
xt(:,12) = data(:,12)./100;
xt(:,13) = sqrt(data(:,13));
xt(:,4)  = [];
% rename variables
%names = ['X1','X2','X3','X5','X6','X7','X8','X9','X10','X11','X12','X13','X14'];
%DMObjNew = colnames(data, [1,2,3,4,5,6,7,8,9,10,11,12,13],names)
%colnames(data) = c('X1','X2','X3','X5','X6','X7','X8','X9','X10','X11','X12','X13','X14')
% standardize variables
%Standardizing data
for i=1:13
    zz(:,i) = (xt(:,i)-mean(xt(:,i)))/(sqrt(var(xt(:,i))));
end
% correlation matrix
dat = corr(zz);
% Maximum Likelihood Factor Analysis without varimax rotation
% factanal performs maximum-likelihood factor analysis
[lambda,~,T,stats,F] = factoran(zz,3,'xtype','data','rotate','none');
              %estimated factor loadings
% the estimated factor loadings matrix
ld  = lambda;
com = diag(ld*ld');           %communalities are calculated
psi = diag(dat)-diag(ld*ld'); %specific variances are calculated
tbl = [lambda(:,1),lambda(:,2),lambda(:,3),com,psi];
figure(1)
subplot(2,2,1)
s=[ 'X1 '
    'X2 '
    'X3 '
    'X5 '
    'X6 '
    'X7 '
    'X8 '
    'X9 '
    'X10'
    'X11'
    'X12'
    'X13'
    'X14'];
% plot first factor against second
hold on
plot(lambda(:,1),lambda(:,2),'w')
ylim([-0.7,0.7])
title('Factors21 - theta21')
ylabel('y')
xlabel('x')
for i=1:13
    text(lambda(i,1),lambda(i,2),s(i,1:3));
end;
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off
% plot first factor against third
subplot(2,2,3)
hold on
plot(lambda(:,1),lambda(:,3),'w')
xlabel('x')
ylabel('y')
title('Factors31 - theta31')
ylim([-0.5,0.5]) 
for i=1:13
    text(lambda(i,1),lambda(i,3),s(i,1:3));
end;
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
xlim([-0.7,0.7])
ylim([-0.5,0.5])
for i=1:13
    text(lambda(i,2),lambda(i,3),s(i,1:3));
end;
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off
% Maximum Likelihood Factor Analysis after varimax rotation 
lambda = rotatefactors(ld, 'Method','varimax');                %rotates the factor loadings matrix
        % and estimates factor loadings after varimax
vl     = [lambda(:,1),lambda(:,2),lambda(:,3)];
com    = diag(vl*vl');           %communalities are calculated
psi    = diag(dat)-diag(vl*vl'); %specific variances are calculated
tbl    = [vl,com,psi];
figure(2)
subplot(2,2,1)
hold on
% plot first factor against second
plot(lambda(:,1),lambda(:,2),'w')
xlabel('x')
ylabel('y')
title('Factors21 - theta21')
for i=1:13
    text(lambda(i,1),lambda(i,2),s(i,1:3));
end; 
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
for i=1:13
    text(lambda(i,1),lambda(i,3),s(i,1:3));
end; 
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
for i=1:13
    text(lambda(i,2),lambda(i,3),s(i,1:3));
end;
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off
% Principal Component Method after varimax rotation
% spectral decomposition
[eigvec,eigval] = eigs(dat);
E               = ones(size(eigvec(:,1:3)))*eigval(1:3,1:3);
% the estimated factor loadings matrix
Q               = sqrt(E).*eigvec(:,1:3);
lambda          = rotatefactors(Q, 'Method', 'varimax');                 %rotates the factor loadings matrix
            %and estimates factor loadings after varimax
ld              = [lambda(:,1),lambda(:,2),lambda(:,3)];
com             = diag(ld*ld');           %communalities are calculated
psi             = diag(dat)-diag(ld*ld'); %specific variances are calculated
tbl             = [ld,com,psi];
figure(3)
% plot first factor against second
subplot(2,2,1)
hold on
plot(lambda(:,1),lambda(:,2),'w')
xlabel('x')
ylabel('y')
title('Factors21 - theta21')
for i=1:13
    text(lambda(i,1),lambda(i,2),s(i,1:3));
end; 
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
for i=1:13
    text(lambda(i,1),lambda(i,3),s(i,1:3));
end; 
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
for i=1:13
    text(lambda(i,2),lambda(i,3),s(i,1:3));
end;
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off
% Principal Factor Method after varimax rotation
% inverse of the correlation matrix dat
f               = inv(dat);
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
lambda          = rotatefactors(QQ, 'Method', 'varimax');                %rotates the factor loadings matrix
             % and estimates factor loadings after varimax
ld              = [lambda(:,1),lambda(:,2),lambda(:,3)];
com             = diag(ld*ld');           %communalities are calculated
psi             = diag(dat)-diag(ld*ld'); %specific variances are calculated
tbl             = [ld,com,psi];
figure(4)
% plot first factor against second
subplot(2,2,1)
hold on
plot(lambda(:,1),lambda(:,2),'w')
xlabel('x')
ylabel('y')
title('Factors21 - theta21')
for i=1:13
    text(lambda(i,1),lambda(i,2),s(i,1:3));
end; 
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
for i=1:13
    text(lambda(i,1),lambda(i,3),s(i,1:3));
end; 
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
for i=1:13
    text(lambda(i,2),lambda(i,3),s(i,1:3));
end;
line([-1,1],[0,0])
line([0,0],[-1,1])
box on
hold off