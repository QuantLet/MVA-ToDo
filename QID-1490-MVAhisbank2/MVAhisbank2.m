% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAhisbank2
% ---------------------------------------------------------------------
% Description:  MVAhisbank2 computes 4 histograms for the diagonal of 
%               the forged swiss bank notes (bank2.dat). The 
%               histograms are different w.r.t. their origin. 
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Computes 4 histograms for the diagonal of the forged 
%               swiss bank notes (bank2.dat). The histograms are
%               different w.r.t. their origin.  
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

origin1 = 137.65;
origin2 = 137.75;
origin3 = 137.85;
origin4 = 137.95;
i = 0:100;

% Please notice min(x)=137.8, when one selects an origin that is larger than it, it will
% automatically go back to include it
y1 = origin1 + 0.4*i + 0.4*(origin1<min(x))-0.2;
y2 = origin2 + 0.4*i + 0.4*(origin2<min(x))-0.2;
y3 = origin3 + 0.4*i - 0.4*(origin3<min(x))-0.2;
y4 = origin4 + 0.4*i - 0.4*(origin4<min(x))-0.2;

subplot(2,2,1)
hist(x,y1)
axis 'auto y'
axis manual
xlim([137 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('x_0 = 137.65')
ylabel('Diagonal')

subplot(2,2,3)
hist(x,y2)
axis 'auto y'
axis manual
xlim([137 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('x_0 = 137.75')
ylabel('Diagonal')

subplot(2,2,2)
hist(x,y3)
axis 'auto y'
axis manual
xlim([137 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('x_0 = 137.85')
ylabel('Diagonal')

subplot(2,2,4)
[n, xout]=hist(x,y4);
hist(x,y4)
axis 'auto y'
axis manual
xlim([137 141])
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
title('Swiss Bank Notes')
xlabel('x_0 = 137.95')
ylabel('Diagonal')







