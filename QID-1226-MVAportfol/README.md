[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAportfol** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAportfol

Published in: Applied Multivariate Statistical Analysis

Description: Computes the optimal portfolio weights with monthly returns of six US firms from Jan 2000 to Dec 2009. The optimal portfolio is compared with an equally weighted one.

Keywords: financial, portfolio, returns, asset, time-series, data visualization, plot, graphical representation

See also: MVAportfol_IBM_Ford, MVAportfol_IBM_PanAm, MVAreturns

Author: Zografia Anastasiadou

Submitted: Fri, August 05 2011 by Awdesch Melzer

Datafile: apple.csv, bac.csv, ed.csv, ford.csv, ibm.csv, ms.csv

Example: Portfolio of all six assets, equal and efficient weights.

```

![Picture1](MVAportfol.png)

![Picture2](MVAportfol_matlabOLD.png)

### MATLAB Code
```matlab

% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAportfol
% ------------------------------------------------------------------------------
% Description:  MVAportfol computes the optimal portfolio weights with monthly 
%               returns of six US firms from Jan 2000 to Dec 2009. The optimal 
%               portfolio is compared with an equally weighted one. Corresponds
%               to example 18.2 in MVA.
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       Computes the optimal portfolio weights with monthly returns of 
%               six US firms from Jan 2000 to Dec 2009. The optimal portfolio is
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

%choose assets to use
ix = [1:6]';
%MVAportfolio of all assets
x = [x1,x2,x3,x4,x5,x6];
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
w2=num2str(c1(2),'%10.3f');
w3=num2str(c1(3),'%10.3f');
w4=num2str(c1(4),'%10.3f');
w5=num2str(c1(5),'%10.3f');
w6=num2str(c1(6),'%10.3f');

text(0.5,0.85,w1)
text(0.5,0.75,w2)
text(0.5,0.65,w3)
text(0.5,0.55,w4)
text(0.5,0.45,w5)
text(0.5,0.35,w6)

text(0.9,0.85,'IBM')
text(0.9,0.75,'Apple')
text(0.9,0.65,'BAC')
text(0.9,0.55,'Ford')
text(0.9,0.45,'Edison')
text(0.9,0.35,'Stanley')

subplot(2,2,4)
axis off
hold on
text(0.5,0.96,'Weights')

w1=num2str(c2(1),'%10.3f');
w2=num2str(c2(2),'%10.3f');
w3=num2str(c2(3),'%10.3f');
w4=num2str(c2(4),'%10.3f');
w5=num2str(c2(5),'%10.3f');
w6=num2str(c2(6),'%10.3f');

text(0.5,0.75,w1)
text(0.5,0.65,w2)
text(0.5,0.55,w3)
text(0.5,0.45,w4)
text(0.5,0.35,w5)
text(0.5,0.25,w6)

text(0.9,0.75,'IBM')
text(0.9,0.65,'Apple')
text(0.9,0.55,'BAC')
text(0.9,0.45,'Ford')
text(0.9,0.35,'Edison')
text(0.9,0.25,'Stanley')
hold off


```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
ibm   = read.csv("ibm.csv")
apple = read.csv("apple.csv")
bac   = read.csv("bac.csv")
ford  = read.csv("ford.csv")
ed    = read.csv("ed.csv")
ms    = read.csv("ms.csv")

# compute returns for IBM
y1 = ibm[, 5]
a  = 0
i  = 1
while (i <= 120) {
    i    = i + 1
    a[i] = (y1[i] - y1[i - 1])/y1[i]
}
x1 = a[2:121] 	

# compute returns for Apple
y2 = apple[, 5]
b  = 0
i  = 1
while (i <= 120) {
    i    = i + 1
    b[i] = (y2[i] - y2[i - 1])/y2[i]
}
x2 = b[2:121] 	

# compute returns for Bank of America Corporation
y3 = bac[, 5]
d  = 0
i  = 1
while (i <= 120) {
    i    = i + 1
    d[i] = (y3[i] - y3[i - 1])/y3[i]
}
x3 = d[2:121]

# compute returns for Forward Industries
y4 = ford[, 5]
f  = 0
i  = 1
while (i <= 120) {
    i    = i + 1
    f[i] = (y4[i] - y4[i - 1])/y4[i]
}
x4 = f[2:121]

# compute returns for Consolidated Edison
y5 = ed[, 5]
g  = 0
i  = 1
while (i <= 120) {
    i    = i + 1
    g[i] = (y5[i] - y5[i - 1])/y5[i]
}
x5 = g[2:121]

# compute returns for Morgan Stanley
y6 = ms[, 5]
h  = 0
i  = 1
while (i <= 120) {
    i    = i + 1
    h[i] = (y6[i] - y6[i - 1])/y6[i]
}
x6 = h[2:121]

ix  = c(1:6)                                # choose assets to use
x   = cbind(x1, x2, x3, x4, x5, x6)         # MVAportfolio of all assets
s1  = solve(cov(x))                         # inverse of empirical variance
one = rep(1, length(ix))                    # vector of ones
c2  = (s1 %*% one)/rep(t(one) %*% s1 %*% one, length(s1 %*% one))    # c2 weight
c1  = one/rep(sum(one), length(one))        # c1 weight
q1  = x %*% c1                              # Optimal MVAportfol returns 
q2  = x %*% c2                              # Nonoptimal MVAportfol returns 

t  = c(1:120)
d1 = cbind(t, q1)
d2 = cbind(t, q2)

# plot
par(mfrow = c(2, 1))
par(oma = c(0, 0, 0, 8))
plot(d1, type = "l", col = "blue", ylab = "Y", xlab = "X", main = "Equally Weighted Portfolio", 
    ylim = c(-0.6, 0.6), cex.lab = 1.4, cex.axis = 1.4, cex.main = 1.4)
mtext("Weights", side = 4, line = 4, at = 1.2, las = 2, font = 1)
mtext(toString(c(sprintf("%.3f", c1[1]), "IBM")), side = 4, line = 4, at = 0.6, las = 2)
mtext(toString(c(sprintf("%.3f", c1[2]), "Apple")), side = 4, line = 4, at = 0.45, 
    las = 2)
mtext(toString(c(sprintf("%.3f", c1[3]), "BAC")), side = 4, line = 4, at = 0.3, las = 2)
mtext(toString(c(sprintf("%.3f", c1[4]), "Ford")), side = 4, line = 4, at = 0.15, 
    las = 2)
mtext(toString(c(sprintf("%.3f", c1[5]), "Edison")), side = 4, line = 4, at = 0, 
    las = 2)
mtext(toString(c(sprintf("%.3f", c1[6]), "Stanley")), side = 4, line = 4, at = -0.15, 
    las = 2)
plot(d2, type = "l", col = "blue", ylab = "Y", xlab = "X", main = "Optimal Weighted Portfolio", 
    ylim = c(-0.6, 0.6), cex.lab = 1.4, cex.axis = 1.4, cex.main = 1.4)
mtext("Weights", side = 4, line = 4, at = 1.2, las = 2, font = 1)
mtext(toString(c(sprintf("%.3f", c2[1]), "IBM")), side = 4, line = 4, at = 0.6, las = 2)
mtext(toString(c(sprintf("%.3f", c2[2]), "Apple")), side = 4, line = 4, at = 0.45, 
    las = 2)
mtext(toString(c(sprintf("%.3f", c2[3]), "BAC")), side = 4, line = 4, at = 0.3, las = 2)
mtext(toString(c(sprintf("%.3f", c2[4]), "Ford")), side = 4, line = 4, at = 0.15, 
    las = 2)
mtext(toString(c(sprintf("%.3f", c2[5]), "Edison")), side = 4, line = 4, at = 0, 
    las = 2)
mtext(toString(c(sprintf("%.3f", c2[6]), "Stanley")), side = 4, line = 4, at = -0.15, 
    las = 2) 

```

automatically created on 2018-05-28