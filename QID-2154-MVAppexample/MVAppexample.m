% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAppexample
% ------------------------------------------------------------------------------
% Description:  MVAppexample reads the Swiss banknote data (bank2.dat) and 
%               spheres them to run Exploratory Projection Pursuit (EPP) on them.
%               We select n (=50) randomly chosen one dimensional projections in 
%               the six-dimensional space of the data. For each set of projected
%               data the Friedman-Tukey-Index is applied to judge the 
%               'interestingness' of the projection.
% ------------------------------------------------------------------------------
% Usage:        ppf.m, ppexample.m, sphere.m
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       In the graphics we see the density for the standard normal
%               distributed data (green) and the estimated densities for the
%               best (red) and the worst (blue) projections found. Additionally
%               we see a dotplot of the projections. In the lower part, we see 
%               the values of the Friedman-Tukey-Index.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Awdesch Melzer 20130418
% ------------------------------------------------------------------------------

% clear variables and close windows
clear all;
close all;
clc;

RandStream.setGlobalStream(RandStream('mt19937ar','seed',100));

% load data
x = load('bank2.dat');

% sphere the data
x = sphere(x);

% choose bandwidth
h = 1.06*length(x)^(-1/5).*max(std(x));

% choose number of projections
n = 50;

[xa xi fa fi tit pind cind] = ppexample(x, h, n);

 
subplot(3,1,1:2);
    plot(fi(:,1),fi(:,2),'r-','LineWidth',2)
    hold on;
    plot(xa(1:100,1),xa(1:100,2),'bo')
    plot([-4:0.01:4]',normpdf([-4:0.01:4]',0,1),'g-','LineWidth',2)
    ylim([-0.2,0.5]);
    xlim([-4,4]);
    plot(xa(101:200,1),xa(101:200,2),'b^')
    plot(xi(1:100,1),xi(1:100,2),'ro')
    plot(xi(101:200,1),xi(101:200,2),'r^')
    ylabel('Y','FontWeight','bold','FontSize',16);
    xlabel('X','FontWeight','bold','FontSize',16);
    line(fa(:,1),fa(:,2),'color','b','LineWidth',2)
    box on
    set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold');
    hold off;
    title(tit,'FontWeight','bold','FontSize',16);
subplot(3,1,3);
    plot(pind(:,1),pind(:,2),'ko')
    box on;
    set(gca,'FontSize',16,'LineWidth',2,'FontWeight','bold');