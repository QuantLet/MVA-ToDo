[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAghadatail** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAghadatail

Published in: Applied Multivariate Statistical Analysis

Description: Plots four probability density functions and four tails in comparison of the NIG, the Laplace, the Cauchy and the Gauss distribution.

Keywords: pdf, cauchy, gaussian, laplace, distribution, tail, heavy-tailed, multivariate, probability, density, plot, graphical representation

See also: MVAghdis, MVAghdistail

Author: Wolfgang K. Haerdle

Submitted: Sun, January 29 2012 by Dedy Dwi Prastyo
Submitted[Matlab]: Wed, November 23 2016 by Lily Medina

```

![Picture1](MVAghadatail_1.png)

![Picture2](MVAghadatail_2.png)

![Picture3](MVAghadatail_matlab.png)

### MATLAB Code
```matlab

%% Clear variables and close windows
clear all
close all
clc

%% set input
% Graphical comparison of the NIG distribution and normal distribution
xx = -6:0.1:6;

% Gaussian pdf
gaussianpdf = normpdf(xx);

% Laplace pdf
theta = 0; % location
lam   = 1; % scale

lappdf1 = 1/(2*lam)*exp(-abs(xx-theta)/lam);

% Cauchy distribution t=0, s=1
y     = xx;
t     = 0;
s     = 1;
c1pdf = s ./ (pi*(s^2+(y-t).^2));  s>0;

% Normal Inverse Gaussian
alpha  = 1;
beta   = 0;
delta  = 1; 
mu     = 0;    % mean
lam    = -1/2;
nigpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );

%% plot
subplot(1,2,1)
hold on
box on
plot(xx, lappdf1, 'Color','k','Linewidth',2.5,'LineStyle','--')
plot(xx, nigpdf, 'Color','g','Linewidth',2.5)
plot(xx, c1pdf,'o', 'Color','b','Linewidth',1)
plot(xx, gaussianpdf, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.55])
title('Distribution comparison')
legend('Laplace','NIG','Cauchy','Gaussian','Location','NorthWest')
hold off

subplot(1,2,2)
hold on
box on
plot(xx, lappdf1, 'Color','k','Linewidth',2.5,'LineStyle','--')
plot(xx, nigpdf, 'Color','g','Linewidth',2.5)
plot(xx, c1pdf,'o', 'Color','b','Linewidth',1)
plot(xx, gaussianpdf, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.02])
xlim([-5,-4])
title('Tail comparison')
legend('Laplace','NIG','Cauchy','Gaussian','Location','NorthWest')
hold off


```

automatically created on 2018-05-28

### R Code
```r


# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("VGAM", "fBasics")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# Graphical comparison of the NIG distribution and normal distribution
xx = seq(-6, 6, by = 0.1)
plot(xx, dlaplace(xx, location = 0, scale = 1), type = "c", ylab = "Y", xlab = "X", 
    col = "black", lwd = 1, cex.lab = 2, cex.axis = 2)
lines(xx, dnig(xx, alpha = 1, beta = 0, delta = 1, mu = 0), type = "l", col = "green", 
    lwd = 3)
lines(xx, dcauchy(xx, 0, 1), type = "p", ylim = c(0, 0.4), ylab = "Y", xlab = "X", 
    col = "blue", lwd = 1)
lines(seq(-6, 6, 0.01), dnorm(seq(-6, 6, 0.01)), type = "l", col = "red", lwd = 2)
legend(x = 2, y = 0.4, legend = c("Laplace", "NIG", "Cauchy", "Gaussian"), pch = c(20, 
    20, 20, 20), col = c("black", "green", "blue", "red"), bty = "n")
title("Distribution comparison")

dev.new()
plot(xx, dnig(xx, alpha = 1, beta = 0, delta = 1, mu = 0), ylim = c(0, 0.02), xlim = c(-5, 
    -4), type = "l", ylab = "Y", xlab = "X", col = "green", lwd = 3, cex.lab = 2, 
    cex.axis = 2)
lines(xx, dlaplace(xx, location = 0, scale = 1), type = "c", col = "black", lwd = 1)
lines(xx, dcauchy(xx, 0, 1), type = "p", col = "blue", lwd = 1)
lines(seq(-6, 6, 0.02), dnorm(seq(-6, 6, 0.02)), type = "l", col = "red", lwd = 3)
legend(x = -4.5, y = 0.014, legend = c("NIG", "Laplace", "Cauchy", "Gaussian"), pch = c(20, 
    20, 20, 20), col = c("green", "black", "blue", "red"), bty = "n")
title("Tail comparison")

```

automatically created on 2018-05-28