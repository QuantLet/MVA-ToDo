%% Clear variables and close windows
clear all;
close all;
clc;

%% Load data
x = load('bostonh.dat');   

%% Standardize data
for i = 1:14
    zz(:,i) = (x(:,i)-mean(x(:,i)))/(sqrt(var(x(:,i))));
end

%% Plot
subplot(2,1,1)
hold on
boxplot(zz,'Symbol','o')
for i = 1:14
    line([ i-0.25  i+0.25],[mean(zz(:,i)) mean(zz(:,i))],'Color','k','LineStyle',':','LineWidth',1.2)
end
title('Boston Housing Data')
axis off
hold off

subplot(2,1,2)
% Transformations
xt(:,1)  = log(x(:,1));
xt(:,2)  = x(:,2)/10;
xt(:,3)  = log(x(:,3));
xt(:,4)  = x(:,4);
xt(:,5)  = log(x(:,5));
xt(:,6)  = log(x(:,6));
xt(:,7)  =(power(x(:,7),2.5))/10000;
xt(:,8)  = log(x(:,8));
xt(:,9)  = log(x(:,9));
xt(:,10) = log(x(:,10));
xt(:,11) = exp(0.4*x(:,11))/1000;
xt(:,12) = x(:,12)/100;
xt(:,13) = sqrt(x(:,13));
xt(:,14) = log(x(:,14));

%% Standardize data
for i = 1:14
    tt(:,i) = (xt(:,i)-mean(xt(:,i)))/(sqrt(var(xt(:,i))));
end


boxplot(tt,'Symbol','o')
for i = 1:14
    line([ i-0.25  i+0.25],[mean(tt(:,i)) mean(tt(:,i))],'Color','k','LineStyle',':','LineWidth',1.2)
end
title('Transformed Boston Housing Data')
axis off
