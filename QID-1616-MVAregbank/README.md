[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAregbank** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAregbank

Published in: Applied Multivariate Statistical Analysis

Description: Computes a linear regression of column 5 (upper inner frame) and column 4 (lower inner frame) for the genuine Swiss bank notes.

Keywords: data visualization, graphical representation, plot, linear-model, linear-regression, regression, scatterplot, financial, sas

See also: MVAregpull, MVAregzoom

Author: Jorge Patron, Vladimir Georgescu, Song Song, Awdesch Melzer
Author[SAS]: Svetlana Bykovskaya

Submitted: Mon, September 15 2014 by Awdesch Melzer
Submitted[SAS]: Wen, April 6 2016 by Svetlana Bykovskaya
Submitted[Matlab]: Tue, November 22 2016 by Lily Medina

Datafiles: bank2.dat

```

![Picture1](MVAregbank-1.png)

![Picture2](MVAregbank_matlab.png)

![Picture3](MVAregbank_sas.png)

### R Code
```r


# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x  = read.table("bank2.dat")
X4 = x[1:100, 4]
X5 = x[1:100, 5]

b = lm(X5 ~ X4)$coefficients  # regression of (X5) on (X4) price
Y = b[1] + b[2] * X4  # regression line

# plot
plot(X4, X5, xlab = "Lower inner frame (X4), genuine", ylab = "Upper inner frame (X5), genuine", 
    xlim = c(7, 10.5), ylim = c(7.5, 12), frame = TRUE, axes = FALSE)
lines(X4, Y, col = "red3", lwd = 2)
axis(side = 2, seq(7.5, 12.5, 1), seq(7.5, 12.5, 1))
axis(side = 1, seq(7, 12, 1), seq(7, 12, 1))
title("Swiss bank notes")


```

automatically created on 2018-05-28

### MATLAB Code
```matlab

%% clear all variables
close all
clear
clc

%% load data
x  = load('bank2.dat');   

X4 = x(1:100,4);
X5 = x(1:100,5);

X   = [ones(length(X4),1) X4];   % matrix with only ones in the first column and X4(lower inner frame) on the second column
[b] = regress(X5,X);             % regression of (X5) on (X4) price
Y   = b(1)+b(2).*X4;             % regression line

%% plot
hold on
scatter(X4,X5,75,'k')
plot(X4,Y,'r','LineWidth',2)
title('Swiss bank notes')
xlabel('Lower inner frame (X4), genuine')
ylabel('Upper inner frame (X5), genuine')
hold off

```

automatically created on 2018-05-28

### SAS Code
```sas


* Import the data;
data b2;
  infile '/folders/myfolders/Sas-work/data/bank2.dat';
  input x1-x6; 
  drop x1 x2 x3 x6;
run;

data b2;
  set b2 (firstobs = 1 obs = 100);
run;

* regression of (X5) on (X4) price;
ods graphics on;
proc reg data = b2
    plots(only) = (fit(nocli stats=none));
  model x5 = x4;
run;
ods graphics off;
   


```

automatically created on 2018-05-28