[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAfacebank10** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAfacebank10

Published in: Applied Multivariate Statistical Analysis

Description: 'Computes Flury faces for observations 91 to 110 of the Swiss bank notes data.'

Keywords: Flury faces, financial, data visualization, graphical representation, plot

See also: MVAfacebank50

Author: Julia Wandke

Submitted: Tue, September 09 2014 by Awdesch Melzer
Submitted[Matlab]: Fri, December  02 2016 by Lily Medina

Datafiles: bank2.dat


```

![Picture1](MVAfacebank10-1.png)

![Picture2](MVAfacebank10_matlab.png)

### R Code
```r


# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("aplpack")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
x  = read.table("bank2.dat")
xx = x[91:110, ]

ncolors = 15

# plot
faces(xx, nrow = 4, face.type = 1, scale = TRUE, col.nose = rainbow(ncolors), col.eyes = rainbow(ncolors, 
    start = 0.6, end = 0.85), col.hair = terrain.colors(ncolors), col.face = heat.colors(ncolors), 
    col.lips = rainbow(ncolors, start = 0, end = 1), col.ears = rainbow(ncolors, 
        start = 0, end = 0.8), plot.faces = TRUE)
```

automatically created on 2018-05-28

### MATLAB Code
```matlab

%% clear variables and close windows
close all 
clear
clc

%% load data
h = load('bank2.dat');
h = h(91:110,:);

%% plot
glyphplot(h, 'Glyph','face')
title('Observations 91 to 110')
    
```

automatically created on 2018-05-28