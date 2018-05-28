[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAghdistail** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAghdistail

Published in: Applied Multivariate Statistical Analysis

Description: Plots four tails of probability density functions of the GH distribution with different lambda, NIG and the Hyperbolic distributions (f=0.5 stands for GH-distribution with lambda=0.5, etc).

Keywords: pdf, distribution, tail, heavy-tailed, multivariate, probability, density, plot, graphical representation, hyperbolic

See also: MVAghdis, MVAghadatail

Author: Wolfgang K. Haerdle

Submitted: Sun, January 29 2012 by Dedy Dwi Prastyo
Submitted[Matlab]: Wed, November 23 2016 by Lily Medina 

```

![Picture1](MVAghdistail.png)

![Picture2](MVAghdistail_matlab.png)

### MATLAB Code
```matlab

%% Clear variables and close windows
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

%% compute PDFs
% Generalized Hyperbolic
gh05pdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );


% Generalized Hyperbolic
lam     = 1.5; % lambda
gh15pdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );
% Normal Inverse Gaussian

 lam    = -1/2;
 nigpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );


% Hyperbolic

lam    = 1;
hyppdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );


%% PDF plots
hold on
box on
plot(y,gh05pdf,'Color','b','Linewidth',2.5)
plot(y,gh15pdf,'Color','k','Linewidth',2.5)
plot(y,nigpdf,'Color','m','Linewidth',2.5)
plot(y,hyppdf,'Color','r','Linewidth',2.5)
ylim([0,0.02]);
xlim([4,5]);
xlabel('X');
ylabel('Y');
title('Tail comparison - GH');
legend('GH(f=0.5)','GH(f=1.5)','NIG','HYP','Location','NorthEast')



```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("fBasics", "VGAM")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# Tail Comparison of GH distribution
par(mar = c(5, 5, 5, 5))
par(mfrow = c(1, 1))
xx = seq(-6, 6, by = 0.1)
plot(xx, dgh(xx, alpha = 1, beta = 0, delta = 1, mu = 0, lambda = 0.5), type = "l", 
    xlim = c(4, 5), ylim = c(0, 0.02), ylab = "Y", xlab = "X", col = "blue", lwd = 3, 
    cex.lab = 2, cex.axis = 2)
lines(xx, dgh(xx, alpha = 1, beta = 0, delta = 1, mu = 0, lambda = 1.5), type = "l", 
    ylab = "Y", xlab = "X", col = "black", lwd = 3, cex.lab = 2, cex.axis = 2)
lines(xx, dnig(xx, alpha = 1, beta = 0, delta = 1, mu = 0), type = "l", col = "purple", 
    lwd = 3)
lines(xx, dhyp(xx, alpha = 1, beta = 0, delta = 1, mu = 0, pm = c("1", "2", "3", 
    "4")), type = "l", col = "red", lwd = 3)
legend(x = 4.6, y = 0.018, legend = c("GH(f=0.5)", "GH(f=1.5)", "NIG", "HYP"), pch = c(20, 
    20, 20, 20), col = c("blue", "black", "blue", "red"), bty = "n")
title("Tail comparison - GH")

```

automatically created on 2018-05-28