[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVACARTBan1** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MVACARTBan1

Published in: Applied Multivariate Statistical Analysis

Description: Performs classification analysis for the US bankruptcy data with 84 companies employing the Gini index and a constraint. It plots a decision tree.

Keywords: plot, graphical representation, classification, analysis, financial, decision-tree, data visualization, Gini index

Author: Awdesch Melzer

Submitted:  Sat, May 10 2014 by Felix Jung

Datafile: bankruptcy.dat

Outdated: Package mvpart was removed from the CRAN repository. Formerly available versions can be obtained from the archive.

```

![Picture1](MVACARTBan1.png)

![Picture2](MVACARTBan1_matlabOLD.png)

### MATLAB Code
```matlab

% ------------------------------------------------------------------------------
% Book:        MVA
% ------------------------------------------------------------------------------
% Quantlet:    MVACARTBan1
% ------------------------------------------------------------------------------
% Description: MVACARTBan1 performs classification analysis for the US
%              bankruptcy data (CF SEC 2004) with 84 companies employing
%              the Gini index and a constraint. It plots a decision tree.
%              
% ------------------------------------------------------------------------------
% Usage:       -
% ------------------------------------------------------------------------------
% Inputs:      None
% ------------------------------------------------------------------------------
% Output:      Plot of a classification tree produced with Gini index.
% ------------------------------------------------------------------------------
% Example:     -
% ------------------------------------------------------------------------------
% Author:      Awdesch Melzer 20120425
% ------------------------------------------------------------------------------

% clear variables and close windows


clear all
close all
clc

% load data
x = load('bankruptcy.dat');
y = x(:,3);
x = x(:,1:2);

% create classification tree employing Gini index, constraint: # of
% observations in parent node = 30
t = classregtree(x,y,'method','classification','splitcriterion','gdi','mergeleaves','off','minparent',30,'minleaf',1,'mergeleaves','off')
view(t)

```

automatically created on 2018-05-28

### R Code
```r


# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("mvpart")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# load data
x  = read.table("bankruptcy.dat")
xx = data.frame(x)

# set constraint: # of observations per node = 30
my.control = rpart.control(minsplit = 30, usesurrogate = 1, minbucket = 1,
                           maxdepth = 30)

# create classification tree
t2 = rpart(V3 ~ V1 + V2, xx, parms = "gini", x = TRUE, y = TRUE,
           control = my.control)

# plot classification tree
plot(t2)
text(t2, cex = 0.5)

```

automatically created on 2018-05-28