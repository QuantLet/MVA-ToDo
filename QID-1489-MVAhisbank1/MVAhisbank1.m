% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAhisbank1
% ---------------------------------------------------------------------
% Description:  MVAhisbank1 computes 4 histograms for the diagonal of 
%               the forged swiss bank notes (bank2.dat). The 
%               histograms are different w.r.t. their binwidth. 
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Computes 4 histograms for the diagonal of the forged 
%               swiss bank notes (bank2.dat). The histograms are
%               different w.r.t. their binwidth. 
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Song Song, Vladimir Georgescu, 
%               Jorge Patron           
% ---------------------------------------------------------------------

clear
close all
clc

x=load('bank2.dat');      

x=x(101:200,6);

origin=137.75;
i = 0:100;

% Because origin<min(x), the histogram includes all values
y1 = origin + 0.1*i +   0.05;
y2 = origin + 0.2*i + 2*0.05;
y3 = origin + 0.3*i + 3*0.05;
y4 = origin + 0.4*i + 4*0.05;

subplot(2,2,1) 
hist(x,y1)
axis 'auto y'
axis manual
xlim([137.5 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('h = 0.1')
ylabel('Diagonal')
ylim([0 10.5])

subplot(2,2,3)
hist(x,y2)
axis 'auto y'
axis manual
xlim([137.5 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('h = 0.2')
ylabel('Diagonal')
ylim([0 21])

subplot(2,2,2)
hist(x,y3)
axis 'auto y'
axis manual
xlim([137.5 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('h = 0.3')
ylabel('Diagonal')
ylim([0 31.5])

subplot(2,2,4)
hist(x,y4)
axis 'auto y'
axis manual
xlim([137.5 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('h = 0.4')
ylabel('Diagonal')
ylim([0 42])