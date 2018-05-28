[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAghdis** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAghdis

Published in: Applied Multivariate Statistical Analysis

Description: Plots three probability density functions and three cumulative density functions of the GH, Hyperbolic and NIG distributions.

Keywords: pdf, cdf, hyperbolic, plot, graphical representation, multivariate, density, probability, distribution, heavy-tailed

See also: MVAghdistail, MVAghadatail

Author: Wolfgang K. Haerdle

Submitted: Sun, January 29 2012 by Dedy Dwi Prastyo
Submitted[Matlab]: Wed, November 23 2016 by Lily Medina

```

![Picture1](MVAghdis_1.png)

![Picture2](MVAghdis_2.png)

![Picture3](MVAghdis_matlab.png)

### MATLAB Code
```matlab

%% clear variables and close windows
clear all
close all
clc

%% set input
% Generalised Hyperbolic Distribution
y     = -6:0.1:6;
xx    = y;
alpha = 1;
beta  = 0;
delta = 1; 
mu    = 0;    % mean
lam   = 0.5; % lambda

% Generalized Hyperbolic

ghpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );

ghcdf = cumsum(ghpdf)/10;

% Normal Inverse Gaussian

 lam    = -1/2;
 nigpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );
nigcdf  = cumsum(nigpdf)/10;

% Hyperbolic

lam    = 1;

hyppdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );
hypcdf = cumsum(hyppdf)/10;

%% plots
% PDF plots
subplot(1,2,1)
hold on
box on
plot(y,ghpdf,'Color','k','Linewidth',2.5)
plot(y,nigpdf,'Color','b','Linewidth',2.5)
plot(y,hyppdf,'Color','r','Linewidth',2.5)
ylim([0,0.55]);
xlim([-6,6]);
xlabel('X');
ylabel('Y');
title('PDF of GH, HYP and NIG');
legend('GH','NIG','HYP','Location','NorthWest')

hold off
% CDF plots
subplot(1,2,2)
hold on
box on
plot(y,ghcdf,'Color','k','Linewidth',2.5)
plot(y,nigcdf,'Color','b','Linewidth',2.5)
plot(y,hypcdf,'Color','r','Linewidth',2.5)
xlabel('X');
ylabel('Y');
xlim([-6,6]);
title('CDF of GH, HYP and NIG');
legend('GH','NIG','HYP','Location','NorthWest')

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

# PDF of Generalised Hyperbolic Distribution
xx = seq(-6, 6, by = 0.1)
plot(xx, dgh(xx, alpha = 1, beta = 0, delta = 1, mu = 0, lambda = 0.5), type = "l", 
    ylim = c(0, 0.5), ylab = "Y", xlab = "X", col = "black", lwd = 3, cex.lab = 2, 
    cex.axis = 2)
lines(xx, dnig(xx, alpha = 1, beta = 0, delta = 1, mu = 0), type = "l", col = "blue", 
    lwd = 3)
lines(xx, dhyp(xx, alpha = 1, beta = 0, delta = 1, mu = 0, pm = c("1", "2", "3", 
    "4")), type = "l", col = "red", lwd = 3)
legend(x = 8, y = 0.3, legend = c("GH", "NIG", "HYP"), pch = c(20, 20), col = c("black", 
    "blue", "red"), bty = "n")
title("PDF of GH, HYP and NIG")

# CDF of Generalised Hyperbolic Distribution
dev.new()
plot(xx, pgh(xx, alpha = 1, beta = 0, delta = 1, mu = 0, lambda = 0.5), type = "l", 
    ylab = "Y", xlab = "X", col = "black", lwd = 3, cex.lab = 2, cex.axis = 2)
lines(xx, pnig(xx, alpha = 1, beta = 0, delta = 1, mu = 0), type = "l", col = "blue", 
    lwd = 3)
lines(xx, phyp(xx, alpha = 1, beta = 0, delta = 1, mu = 0, pm = c("1", "2", "3", 
    "4")), type = "l", col = "red", lwd = 3)
legend(x = 8, y = 0.6, legend = c("GH", "NIG", "HYP"), pch = c(20, 20), col = c("black", 
    "blue", "red"), bty = "n")
title("CDF of GH, HYP and NIG") 

```

automatically created on 2018-05-28