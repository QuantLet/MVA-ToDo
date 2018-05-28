[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAcauchy** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAcauchy

Published in: Applied Multivariate Statistical Analysis

Description: Plots three probability density functions and three cumulative density functions of the Cauchy distribution with m = 0 and different scale parameters (s=1, s=1.5, s=2).

Keywords: plot, graphical representation, cauchy, cdf, pdf, density, distribution

See also: MVAcltbern, MVAcltbern2, MVAgausscauchy, MVAtdis

Author: Wolfgang K. Haerdle

Submitted: Wed, September 07 2011 by Awdesch Melzer
Submitted[Matlab]: Wed, November 23 2016 by Lily Medina

```

![Picture1](MVAcauchy_1-1.png)

![Picture2](MVAcauchy_2-1.png)

![Picture3](MVAcauchy_matlab.png)

### MATLAB Code
```matlab

%% Clear variables and close windows
clear all
close all
clc

%% set input
y = -6:0.1:6;

% Cauchy distribution t=0, s=1
t     = 0;
s     = 1;
c1pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;
c1cdf = 0.5 + atan((y-t)/s)/pi;

% Cauchy distribution t=0, s=1.5t = 0;
s      = 1.5;
c15pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;
c15cdf = 0.5 + atan((y-t)/s)/pi;

% Cauchy distribution t=0, s=2
t     = 0;
s     = 2;
c2pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;
c2cdf = 0.5 + atan((y-t)/s)/pi;

%% Plots of Cauchy distributions scale 1-2
subplot(1,2,1)
hold on
box on
plot(y, c1pdf, 'Color','r','Linewidth',2.5)
plot(y, c15pdf, 'Color','b','Linewidth',2.5)
plot(y, c2pdf, 'Color','g','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.4])
xlim([-6,6])
title('PDF of Cauchy distribution')
legend('C1','C1.5','C2','Location','NorthWest')
hold off

subplot(1,2,2)
hold on
box on
plot(y, c1cdf, 'Color','r','Linewidth',2.5)
plot(y, c15cdf, 'Color','b','Linewidth',2.5)
plot(y, c2cdf, 'Color','g','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,1])
xlim([-6,6])
title('CDF of Cauchy distribution')
legend('C1','C1.5','C2','Location','NorthWest')
hold off

```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

xx = seq(-6, 6, by = 0.1)

# Pdf of Cauchy distribution with s=1, s=1.5, s=2 
plot(xx, dcauchy(xx, 0, 1), type = "l", ylim = c(0, 0.4), ylab = "Y", xlab = "X", 
    col = "red", lwd = 3, cex.lab = 2, cex.axis = 2)  
lines(xx, dcauchy(xx, 0, 1.5), type = "l", col = "blue", lwd = 3) 
lines(xx, dcauchy(xx, 0, 2), type = "l", col = "green", lwd = 3)  
legend(x = 2, y = 0.3, legend = c("s=1", "s=1.5", "s=2"), pch = c(20, 20, 20), col = c("red", 
    "blue", "green"), bty = "n")
title("PDF of Cauchy distribution")

# Cdf of Cauchy distribution with s=1, s=1.5, s=2 
dev.new()
plot(xx, pcauchy(xx, 0, 1), type = "l", ylab = "Y", xlab = "X", col = "red", lwd = 3, 
    cex.lab = 2, cex.axis = 2)  
lines(xx, pcauchy(xx, 0, 1.5), type = "l", col = "blue", lwd = 3)
lines(xx, pcauchy(xx, 0, 2), type = "l", col = "green", lwd = 3)  
legend(x = -5, y = 0.72, legend = c("s=1", "s=1.5", "s=2"), pch = c(20, 20, 20), col = c("red", 
    "blue", "green"), bty = "n")
title("CDF of Cauchy distribution") 

```

automatically created on 2018-05-28