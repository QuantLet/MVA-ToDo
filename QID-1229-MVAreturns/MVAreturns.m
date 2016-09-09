% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAreturns
% ------------------------------------------------------------------------------
% Description:  MVAreturns shows monthly returns of six US firms from Jan 2000 
%               to Dec 2009.
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       Monthly returns of six US firms from Jan 2000 to Dec 2009.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20101115;
%               Matlab: Awdesch Melzer 20120404;
% ------------------------------------------------------------------------------

%clear variables and close windows
clear all;
close all;
clc;

%load data
IBM = importdata('ibm.csv');

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(IBM);
    for i = 1:length(vars)
    assignin('base', vars{i}, IBM.(vars{i}));
    end
    ibm = IBM.data;
    
    
APPLE = importdata('apple.csv');

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(APPLE);
    for i = 1:length(vars)
    assignin('base', vars{i}, APPLE.(vars{i}));
    end
    apple = APPLE.data;
    
BAC = importdata('bac.csv');

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(BAC);
    for i = 1:length(vars)
    assignin('base', vars{i}, BAC.(vars{i}));
    end
    bac = BAC.data;
    
FORD = importdata('ford.csv');

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(FORD);
    for i = 1:length(vars)
    assignin('base', vars{i}, FORD.(vars{i}));
    end
    ford = FORD.data;
    
ED = importdata('ed.csv');

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(ED);
    for i = 1:length(vars)
    assignin('base', vars{i}, ED.(vars{i}));
    end
    ed = ED.data;
    
MS = importdata('ms.csv');

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(MS);
    for i = 1:length(vars)
    assignin('base', vars{i}, MS.(vars{i}));
    end
    ms = MS.data;
    
    
%compute the returns from assets
y1 = ibm(:,4);	
a = 0;
i = 1;
while i<=120
	i = i+1;
	a(i) = (y1(i)-y1(i-1))./y1(i);
end
%returns for IBM
x1 = a(2:121)';

y2 = apple(:,4);
b=0;	
i=1;
while i<=120 
	i=i+1;
	b(i) = (y2(i)-y2(i-1))./y2(i);
end
%returns for Apple
x2 = b(2:121)';
	
y3 = bac(:,4);
d=0;
i=1;
while i<=120
	i=i+1;
	d(i) = (y3(i)-y3(i-1))./y3(i);
end
%returns for Bank of America Corporation
x3 = d(2:121)';	
		
y4 = ford(:,4);
f=0;
i=1;
while i<=120
	i=i+1;
	f(i) = (y4(i)-y4(i-1))./y4(i);
end
%returns for Forward Industries
x4 = f(2:121)';
	
y5 = ed(:,4);
g=0;
i=1;
while i<=120
	i=i+1;
	g(i) = (y5(i)-y5(i-1))./y5(i);
end
%returns for Consolidated Edison
x5 = g(2:121)';

y6 = ms(:,4);
h=0;
i=1;
while i<=120 
	i=i+1;
	h(i) = (y6(i)-y6(i-1))./y6(i);
end
%returns for Morgan Stanley	
x6 = h(2:121)';

t = [1:120]';

%time series for IBM
d1 = [t,x1];
%time series for Apple
d2 = [t,x2];
%time series for Bank of America Corporation
d3 = [t,x3];
%time series for Forward Industries
d4 = [t,x4];
%time series for Consolidated Edison
d5 = [t,x5];
%time series for Morgan Stanley 
d6 = [t,x6];

NAMES = ...
    ['IBM                '
     'Apple              '
     'BAC                '
     'Forward Industries '
     'Consolidated Edison'
     'Morgan Stanley     '];

xx = [x1,x2,x3,x4,x5,x6];
figure(1)
for i = 1:6
subplot(3,2,i)
plot(t,xx(:,i),'LineWidth',1.2)
ylim([-1,1])
xlim([0,121])
title(NAMES(i,:))
end