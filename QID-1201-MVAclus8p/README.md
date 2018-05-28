[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAclus8p** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAclus8p

Published in: Applied Multivariate Statistical Analysis

Description: Performs cluster analysis for 8 data points.

Keywords: cluster-analysis, plot, graphical representation, distance, euclidean, dendrogram, sas

See also: MVAclusfood, MVAclusbank, MVAspecclust, MVAclusbh, MVAclususcrime, SMSclus8p, SMSclus8pd, SMSclus8pmst2, SMSclusbank, SMScluscomp, SMScluscrime, SMScluscrimechi2, SMSclushealth

Author: Zografia Anastasiadou
Author[SAS]: Svetlana Bykovskaya
Author[Matlab]: Zografia Anastasiadou, Awdesch Melzer

Submitted: Thu, September 11 2014 by Franziska Schulz
Submitted[SAS]: Mon, March 14 2016 by Svetlana Bykovskaya
Submitted[Matlab]: Thu, December 15 2016 by Piedad Castro

Example:
- 1: The 8-point example.
- 2: The dendrogram for the 8-point example after Single linkage algorithm.

```

![Picture1](MVAclus8p-1_matlab.png)

![Picture2](MVAclus8p-1_r.png)

![Picture3](MVAclus8p-1_sas.png)

![Picture4](MVAclus8p-2_matlab.png)

![Picture5](MVAclus8p-2_r.png)

![Picture6](MVAclus8p-2_sas.png)

### MATLAB Code
```matlab

%% clear all variables and console and close windows
clear
clc
close all

%% create matrix of 8 data points
x  = [5,2,-2,-3,-2,-2,1,1]';
y  = [-3,-4,-1,0,-2,4,2,4]';   
xs = [x,y]; 

%% Plot for the 8 data points
figure(1)
hold on
line(xs([1,2,5,3,4,3,7,8,6],1),xs([1,2,5,3,4,3,7,8,6],2),'Linewidth',2);
xlim([-3.3,5.3])
ylim([-4.3,4.3])
xlabel('price conciousness','FontSize',12)
ylabel('brand loyalty','FontSize',12)
title('8 points','FontSize',14)
text(xs(:,1),xs(:,2),['1','2','3','4','5','6','7','8']','FontSize',14)
box on
hold off

% Draw line segments between pairs of points 
% euclidean distance matrix
d = pdist(xs,'euclidean');

% squared euclidean distance matrix
dd = d.^2;

% cluster analysis with single linkage algorithm                                                  
ss = linkage(dd,'single');

%% Dendrogram for the 8 data points after Single linkage
% This dendrogram differs from the one produced in R produced plot due to
% differences in the linkage function
figure(2)
[H,T] = dendrogram(ss,'colorthreshold','default');
set(H,'LineWidth',2)
title('Single Linkage Dendrogram - 8 points','FontSize',14)
ylabel('Squared Euclidean Distance','FontSize',12)
box on

```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# create matrix from 8 data points and define eight points
eight = cbind(c(-3, -2, -2, -2, 1, 1, 2, 4), c(0, 4, -1, -2, 4, 2, -4, -3))
eight = eight[c(8, 7, 3, 1, 4, 2, 6, 5), ]

# Plot 1: The 8-point example
plot(eight, type = "n", xlab = "price conciousness", ylab = "brand loyalty", xlim = c(-4, 
    4), main = "8 points")
segments(eight[1, 1], eight[1, 2], eight[2, 1], eight[2, 2], lwd = 2)
segments(eight[2, 1], eight[2, 2], eight[5, 1], eight[5, 2], lwd = 2)
segments(eight[5, 1], eight[5, 2], eight[3, 1], eight[3, 2], lwd = 2)
segments(eight[3, 1], eight[3, 2], eight[4, 1], eight[4, 2], lwd = 2)
segments(eight[3, 1], eight[3, 2], eight[7, 1], eight[7, 2], lwd = 2)
segments(eight[7, 1], eight[7, 2], eight[8, 1], eight[8, 2], lwd = 2)
segments(eight[8, 1], eight[8, 2], eight[6, 1], eight[6, 2], lwd = 2)
points(eight, pch = 21, cex = 2.7, bg = "white")
text(eight, as.character(1:8), col = "red3", xlab = "first coordinate", ylab = "second coordinate", 
    main = "8 points", cex = 1)

d  = dist(eight, method = "euclidean", p = 2)  # euclidean distance matrix
dd = d^2                                       # squared euclidean distance matrix
s  = hclust(dd, method = "single")             # cluster analysis with single linkage algorithm                      

# Plot 2: The dendrogram for the 8-point example, Single linkage algorithm.
dev.new()
plot(s, hang = -0.1, frame.plot = TRUE, ann = FALSE)
title(main = "Single Linkage Dendrogram - 8 points", ylab = "Squared Euclidean Distance") 

```

automatically created on 2018-05-28

### SAS Code
```sas


proc iml;
  * create matrix from 8 data points and define eight points;
  eight = {-3, -2, -2, -2, 1, 1, 2, 4} || {0, 4, -1, -2, 4, 2, -4, -3};
  eight = eight[{8, 7, 3, 1, 4, 2, 6, 5}, ];
  
  id = 1:8;
  w  = eight;
  z  = w[1,] // w[2,] // w[5,] // w[3,] // w[4,] // w[3,] //w[7,] // w[8,] // w[6,];
  
  x1 = w[,1];
  x2 = w[,2];
  x3 = z[,1];
  x4 = z[,2];
  
  create plot var {"x1" "x2" "x3" "x4" "id"};
    append;
  close plot;
quit;

proc sgplot data = plot
    noautolegend;
  title '8 points';
  scatter x = x1 y = x2 / markerattrs = (symbol = circlefilled color = red)
    datalabel = id;
  series x = x3 y = x4 / 
    lineattrs = (color = black THICKNESS = 2);
  xaxis label = 'price conciousness';
  yaxis label = 'brand loyalty';
run;

proc distance data = plot(obs = 8) out = dist method = sqeuclid nostd;
   var interval(x1 x2);
run;

data newdist;
  set dist;
  set plot;
  drop x1 x2 x3 x4;
run;

ods graphics on;
proc cluster data = newdist(type = distance)
    method = single
    plots(only) = (Pseudo Dendrogram(vertical))
    print = 0;
  id id;
run;
ods graphics off;


```

automatically created on 2018-05-28