[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVApcp5** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVApcp5

Published in: Applied Multivariate Statistical Analysis

Description: Computes parallel coordinates plot for variables headroom, rear seat clearance and trunk space of the car data set.

Keywords: pcp, parallel-coordinates-plot, financial, data visualizationvplot, graphical representation

See also: MVApcphousing, MVApcp1, MVApcp2, MVApcp3, MVApcp4, MVApcp6, MVApcp7, MVApcp8 

Author: Ji Cao, Song Song, Vladimir Georgescu, Awdesch Melzer

Submitted: Tue, September 09 2014 by Awdesch Melzer
Submitted[Matlab]: Thu, November 17 2016 by Lily Medina

Datafile: carc.txt

```

![Picture1](MVApcp5.png)

![Picture2](MVApcp5_matlab.png)

### MATLAB Code
```matlab

%% clear all variables
clear
close all
clc

%% load data
x     = load('carc.txt');
frame = x(:,5:7); % extracts column 5 to 7/'headroom','rear seat','trunk space'  
n     = size(frame,1);

%% standarize data
minf  = ones(n,1)*min(frame); % matrix w. 3 columns: [min(headroom),min(rear seat), min(trunk space)]
maxf  = ones(n,1)*max(frame); % matrix w. 3 columns: [max(headroom),max(rear seat), max(trunk space)]
equal = ones(n,1)*(max(frame)==min(frame)); %  equals 1 if true so that denominator is never equal zero

frame = (frame - minf)./(maxf - minf + equal)

%% plot
label = {'headroom','rear seat','trunk space'}
parallelcoords(frame, 'linewidth',1.5, 'label', label,'Color','k')
title('Parallel Coordinate Plot (Car Data)')

```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("MASS")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
x = read.table("carc.txt")
frame = data.frame(x[, 5:7])
colnames(frame) = c("headroom","rear seat", "trunk space")

# Plot
parcoord(log(frame[, c(1, 2, 3)]), frame = TRUE, main = "Parallel Coordinates Plot (Car Data)")
axis(side = 2, at = seq(0, 1, 0.2), labels = seq(0, 1, 0.2)) 

```

automatically created on 2018-05-28