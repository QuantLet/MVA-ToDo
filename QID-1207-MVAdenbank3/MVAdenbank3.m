% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAdenbank3
% ------------------------------------------------------------------------------
% Description:  MVAdenbank3 gives plots of the product of univariate & joint 
%               kernel density estimates of variables  X4 and X5 of the Swiss 
%               bank notes (bank2.dat).
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None
% ------------------------------------------------------------------------------
% Output:       Plots the product of univariate & joint kernel density estimate
%               of variables  X4 and X5
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Song Song 20090820; Matlab: Awdesch Melzer 20120228
% ------------------------------------------------------------------------------

% Clear loaded variables and close windows
clear all;
close all;
clc;

format long;

% Read dataset
xx = load('bank2.dat');
h = 1.06*[std(xx(:, 4)) std(xx(:, 5))].* 200.^(-1/5);

% Compute a kernel density estimates
[f1,xi1] = ksdensity(xx(:, 4));
[f2,xi2] = ksdensity(xx(:, 5));

[xxi,yyi] = meshgrid(xi1,xi2);
[ff1,ff2] = meshgrid(f1,f2);
pdfxy = ff1.*ff2;
figure(1)
mesh(xxi,yyi,pdfxy)
set(gca, 'XLim',[min(xi1) max(xi1)])
set(gca, 'YLim',[min(xi2) max(xi2)])


xrange = min(xx(:,4)):(max(xx(:,4))-min(xx(:,4)))./99:max(xx(:,4));
yrange = min(xx(:,5)):(max(xx(:,5))-min(xx(:,5)))./99:max(xx(:,5));

% steps
endx = length(xrange);
endy = length(yrange);
ndata = length(xx(:,4));

for xxxi=1:endx
    for yyyi=1:endy
        u1 =(xrange(xxxi)-xx(:,4))/h(1);
        u2 =(yrange(yyyi)-xx(:,5))/h(2);
        u=[u1,u2]';
        for is=1:ndata
            KD(is)=1/(2*pi)^(2/2)*exp(-1/2*u(:,is)'*u(:,is));
        end
        fhat(xxxi,yyyi)=mean(KD)/prod(h);
    end
end
figure(2)
mesh(yyi,xxi,fhat)
