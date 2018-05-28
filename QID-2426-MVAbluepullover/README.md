[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAbluepullover** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet: MVAbluepullover

Published in: Applied Multivariate Statistical Analysis

Description: Rewrites the 5.3 example using the classic blue pullover example and show the mean, covariance and correlation matrix of data.

Keywords: correlation, correlation-matrix, covariance, covariance-matrix, mean, financial

See also: MVAdescbh, SFSmvol01, SFEVolaCov

Author: Matthias Eckardt

Submitted: Mon, July 07 2014 by Lukas Borke

Datafile: pullover.dat

```

### MATLAB Code
```matlab

% ---------------------------------------------------------------------
% Book:         MVA 3
% ---------------------------------------------------------------------
% Quantlet:     MVAbluepullover
% ---------------------------------------------------------------------
% Description:  MVAbluepullover rewrites the 5.3 example using the classic
%               "blue pullover" example
% ---------------------------------------------------------------------
% Usage:        MVAbluepullover
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       conditional distribution of X1 - X4
% ---------------------------------------------------------------------
% Example:
% ---------------------------------------------------------------------
% Author:       Matthias Eckardt 20090914 Song Song 20090918
%               Matlab: Awdesch Melzer 20120307
% ---------------------------------------------------------------------

% clear variables and close windows
clear all
close all
clc


blue = load('pullover.dat');

  % generating mu and S
  
mu = mean(blue)';


s_unbiased = cov(blue);    % the result of cov(xy) is the unbiased one 
                              % meaning n/n-1*S 

covxy = s_unbiased/(10/9);      % in ex. 5.3 the biased one is used
 
 % partial correlation between "Sales" and "Price" given "Advertisement" and "Sales Assistans"


	%x1 = Sales
	%x2 =  Price
	z = blue(:,3:4);

	data = [blue(:,1),blue(:,2),z];

		xdata = data(:,1:2);
	Sxx = cov(xdata);

	xzdata = data;
	xdata = xzdata(:,1:2);
	zdata = xzdata(:,3:4);
	Sxz = cov(data);

    Sxz = Sxz(1:2,3:4);
    
	zdata = data(:,3:4);
	Szz = cov(zdata);

	Sxxz = Sxx-(Sxz*inv(Szz)*Sxz');
	
	%rxxz = cov2cor(Sxx.z)[1,2]
    s_xxz = sqrt(diag(Sxxz));
    rxxz = Sxxz./(s_xxz*s_xxz');
    rxxz = rxxz(1,2);
    


% correlation matrix 
P_blue = corr(blue);

 
mu
covxy
rxxz
P_blue 
 

```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

#load data
blue.data = read.table("pullover.dat", header = T)
attach(blue.data)

# generating mu and S
mu  = colMeans(blue.data)
mu  = t(mu)
(mu = t(mu))
s.unbiased = cov(blue.data)  # the result of cov(xy) is the unbiased one
 
# meaning n/n-1*S
(covxy = s.unbiased/(10/9))

# partial correlation between 'Sales' and 'Price' given 'Advertisement' and 'Sales Assistans', x1 = Sales, x2 = Price
z      = blue.data[c(3:4)]
data   = data.frame(blue.data[, 1], blue.data[, 2], z)
xdata  = na.omit(data.frame(data[, c(1, 2)]))
Sxx    = cov(xdata, xdata)
xzdata = na.omit(data)
xdata  = data.frame(xzdata[, c(1, 2)])
zdata  = data.frame(xzdata[, -c(1, 2)])
Sxz    = cov(xdata, zdata)
zdata  = na.omit(data.frame(data[, -c(1, 2)]))
Szz    = cov(zdata, zdata)
Sxx.z  = Sxx - Sxz %*% solve(Szz) %*% t(Sxz)
(rxx.z = cov2cor(Sxx.z)[1, 2])

# correlation matrix
(P.blue.data = cor(blue.data))

```

automatically created on 2018-05-28