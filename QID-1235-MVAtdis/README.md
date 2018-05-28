[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAtdis** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAtdis

Published in: Applied Multivariate Statistical Analysis

Description: Plots three probability density functions and three cumulative density functions of the t-distribution with different degrees of freedom (t3 stands for t-distribution with degree of freedom 3, etc.)

Keywords: plot, graphical representation, t-distribution, cdf, pdf, density, distribution

See also: MVAcltbern, MVAcltbern2, MVAgausscauchy, MVAcauchy

Author: Wolfgang K. Haerdle

Submitted: Mon, August 08 2011 by Awdesch Melzer
Submitted[Matlab]: Wed, November 23 2016 by Lily Medina

```

![Picture1](MVAtdis_1-1.png)

![Picture2](MVAtdis_2-1.png)

![Picture3](MVAtdis_matlab.png)

### MATLAB Code
```matlab


%% clear variables and close windows
clear all
close all
clc

%% set input
xx = -5:0.1:5;

tpdf3  = pdf('T',xx,3);
tpdf6  = pdf('T',xx,6);
tpdf30 = pdf('T',xx,30);

tcdf3  = cdf('T',xx,3);
tcdf6  = cdf('T',xx,6);
tcdf30 = cdf('T',xx,30);

%% plot
subplot(1,2,1)
hold on
box on
plot(xx, tpdf3, 'Color','g','Linewidth',2.5)
plot(xx, tpdf6, 'Color','b','Linewidth',2.5)
plot(xx, tpdf30, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.40])
title('PDF of t-distribution')
legend('t3','t6','t30','Location','NorthWest')
hold off

subplot(1,2,2)
hold on
box on
plot(xx, tcdf3, 'Color','g','Linewidth',2.5)
plot(xx, tcdf6, 'Color','b','Linewidth',2.5)
plot(xx, tcdf30, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,1])
title('CDF of t-distribution')
legend('t3','t6','t30','Location','NorthWest')
hold off

```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

xx = seq(-5, 5, by = 0.1)

# Pdf of t-distribution with df=3, df=6, df=30 
plot(xx, dt(xx, df = 3), type = "l", ylim = c(0, 0.4), ylab = "Y", xlab = "X", col = "green", 
    lwd = 3, cex.lab = 2, cex.axis = 2)  
lines(xx, dt(xx, df = 6), type = "l", col = "blue", lwd = 3)
lines(xx, dt(xx, df = 30), type = "l", col = "red", lwd = 3) 
legend(x = 2, y = 0.3, legend = c("t3", "t6", "t30"), pch = c(20, 20, 20), col = c("green", 
    "blue", "red"), bty = "n")
title("PDF of t-distribution")

# Cdf of t-distribution with df=3, df=6, df=30 
dev.new()
plot(xx, pt(xx, df = 3), type = "l", ylab = "Y", xlab = "X", col = "green", lwd = 3, 
    cex.lab = 2, cex.axis = 2) 
lines(xx, pt(xx, df = 6), type = "l", col = "blue", lwd = 3) 
lines(xx, pt(xx, df = 30), type = "l", col = "red", lwd = 3)  
legend(x = -5, y = 0.74, legend = c("t3", "t6", "t30"), pch = c(20, 20, 20), col = c("green", 
    "blue", "red"), bty = "n")
title("CDF of t-distribution") 

```

automatically created on 2018-05-28