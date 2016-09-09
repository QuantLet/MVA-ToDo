% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAportfol_IBM_Ford
% ------------------------------------------------------------------------------
% Description:  MVAportfol_IBM_Ford computes the optimal portfolio weights with monthly 
%               returns of IBM and FORD from Jan 2000 to Dec 2009. The optimal 
%               portfolio is compared with an equally weighted one. Corresponds
%               to example 18.2 in MVA.
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       Computes the optimal portfolio weights with monthly returns of 
%               IBM and FORD from Jan 2000 to Dec 2009. The optimal portfolio is
%               compared with an equally weighted one.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20101120
%               Matlab: Awdesch Melzer 20120404
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
    
    
    
FORD = importdata('ford.csv');

    % Create new variables in the base workspace from those fields.
    vars = fieldnames(FORD);
    for i = 1:length(vars)
    assignin('base', vars{i}, FORD.(vars{i}));
    end
    ford = FORD.data;
    

    
    
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

	
y4 = ford(:,4);
f=0;
i=1;
while i<=120
	i=i+1;
	f(i) = (y4(i)-y4(i-1))./y4(i);
end
%returns for Forward Industries
x4 = f(2:121)';
	

%choose assets to use
ix = [1:2]';
%MVAportfolio of all assets
x = [x1,x4];
%inverse of empirical variance
s1 = inv(cov(x));
%vector of ones
one = ones(length(ix),1);
c2 = (s1*one)./repmat(one'*s1*one,length(s1*one),1); % c1,c2 weights
c1 = one./repmat(sum(one),length(one),1); 
q1 = x*c1;                                             % Optimal MVAportfol returns 
q2 = x*c2;                                             % Nonoptimal MVAportfol returns 

t = [1:120]';
d1 = [t,q1];
d2 = [t,q2];

figure(1)
subplot(2,2,1)
subplot('Position',[0.15 0.61 0.4 0.3])
hold on
for i=1:length(t)-1
    line([d1(i,1) d1(i+1,1)],[d1(i,2) d1(i+1,2)]);
end
title('Equally Weighted Portfolio')
xlabel('X')
ylabel('Y')
ylim([-0.4 0.4])
xlim([0,121])
box on

subplot(2,2,3)
subplot('Position',[0.15 0.1 0.4 0.3])
hold on
for i=1:length(t)-1
    line([d2(i,1) d2(i+1,1)],[d2(i,2) d2(i+1,2)])
end
title('Optimal Weighted Portfolio')
xlabel('X')
ylabel('Y')
xlim([0 121])
ylim([-0.4 0.4])
box on

subplot(2,2,2)
axis off
hold on
text(0.5,1.06,'Weights')

w1=num2str(c1(1),'%10.3f');

w4=num2str(c1(2),'%10.3f');


text(0.5,0.85,w1)

text(0.5,0.75,w4)


text(0.9,0.85,'IBM')
text(0.9,0.75,'Ford')


subplot(2,2,4)
axis off
hold on
text(0.5,0.96,'Weights')

w1=num2str(c2(1),'%10.3f');

w4=num2str(c2(2),'%10.3f');


text(0.5,0.75,w1)

text(0.5,0.65,w4)


text(0.9,0.75,'IBM')

text(0.9,0.65,'Ford')

hold off

