[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAdecofood** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAdecofood

Published in: Applied Multivariate Statistical Analysis

Description: Computes a spectral decomposition of the French food data and gives a representation of food expenditures and family types in two dimensions.

Keywords: decomposition, eigenvalues, eigenvectors, spectral, spectral-decomposition, standardization, plot, graphical representation

Author: Zografia Anastasiadou
Author[SAS]: Svetlana Bykovskaya
Author[Matlab]: Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, Song Song

Submitted: Fri, April 11 2014 by Awdesch Melzer
Submitted[SAS]: Wed, April 06 2016 by Svetlana Bykovskaya
Submitted[Matlab]: Mon, December 12 2016 by Piedad Castro

Datafiles: food.dat

Note: 'Matlab and SAS decompose matrices differently than R, and therefore some 
      of the eigenvectors may have different signs.'

```

![Picture1](MVAdecofood-1.png)

![Picture2](MVAdecofood-1_matlab.png)

![Picture3](MVAdecofood-1_sas.png)

![Picture4](MVAdecofood-2_sas.png)

### R Code
```r


# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

# load data
x = read.table("food.dat")
x = x[, 2:ncol(x)]
n = nrow(x)
p = ncol(x)

one = matrix(1, n, n)
h = diag(1, n, n) - one/n  # centering the matrix
a = x - matrix(apply(x, 2, mean), n, p, byrow = T)  # substracts mean
d = diag(1/sqrt(colSums(a^2)/n))

xs = h %*% as.matrix(x) %*% d  # standardized data
xs1 = xs/sqrt(n)
xs2 = t(xs1) %*% xs1

eig = eigen(xs2)  # spectral decomposition
lambda = eig$values
gamma = eig$vectors

w = gamma * (matrix(sqrt(lambda), nrow = nrow(gamma), ncol = ncol(gamma), byrow = T))  # coordinates of food
w = w[, 1:2]
w = round(w, 3)

z1 = xs1 %*% gamma  # coordinates of families
z2 = sqrt(n/p) * z1
z = z2[, 1:2]
z = round(z, 3)

namew = c("bread", "veget", "fruit", "meat", "poult", "milk", "wine")
namez = c("ma2", "em2", "ca2", "ma3", "em3", "ca3", "ma4", "em4", "ca4", "ma5", "em5", 
    "ca5")

par(mfrow = c(2, 2))
plot(w[, 1], -w[, 2], type = "n", xlab = "W[,1]", ylab = "W[,2]", main = "Food", cex.axis = 1.2, 
    cex.lab = 1.2, cex.main = 1.6, xlim = c(-1.2, 0.5), ylim = c(-1, 0.5))
text(w[, 1], -w[, 2], namew, xpd = NA)
abline(h = 0, v = 0, lwd = 1.2)

for (i in 1:7) {
    mtext(namew[i], side = 1, line = 5 + i, at = -1.15)
    mtext(toString(c(sprintf("%.3f", w[i, 1]))), side = 1, line = 5 + i, at = -0.55)
    mtext(toString(c(sprintf("%.3f", w[i, 2]))), side = 1, line = 5 + i, at = 0)
}

plot(z[, 1], -z[, 2], type = "n", xlim = c(-2, 2), ylim = c(-1.1, 1), xlab = "Z[,1]", 
    ylab = "Z[,2]", main = "Families", cex.axis = 1.2, cex.lab = 1.2, cex.main = 1.6)
text(z[, 1], -z[, 2], namez, xpd = NA)
abline(h = 0, v = 0, lwd = 1.2)

for (i in 1:12) {
    mtext(namez[i], side = 1, line = 5 + i, at = -2)
    mtext(toString(c(sprintf("%.3f", z[i, 1]))), side = 1, line = 5 + i, at = -1)
    mtext(toString(c(sprintf("%.3f", z[i, 2]))), side = 1, line = 5 + i, at = -0)
}
```

automatically created on 2018-05-28

### MATLAB Code
```matlab

%% clear all variables and console and close windows
clear
clc
close all

%% data import
formatSpec = '%s%f%f%f%f%f%f%f';
data       = readtable('food.dat','Delimiter',' ', 'Format',formatSpec);
data.Var1  = [];
x          = table2array(data);

[n,p] = size(x);
h     = diag(ones(n,1))-ones(n,n)./n;  % centering the matrix
y     = mean(x);
a     = x-repmat(y,n,1);               % substracts mean
d     = diag(1./sqrt(sum(a.*a)'/n));

xs  = h*x*d;
xs  = xs./sqrt(n);
xs2 = xs'*xs;

[gamma,lambda1] = eigs(xs2,p,'la');                 % Eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
lambda          = (lambda1*ones(p,1))';             % Turns Eigenvalue matrix into a row vector 
w1              = gamma.*sqrt(repmat(lambda,p,1));  % coordinates of food
w               = w1(:,1:2);                        % Two eigenvectors with highest eigenvalues

z1 = xs*gamma;         % coordinates of families
z1 = sqrt(n/p).*z1;    % xs' scaled by square root of p 
z  = z1(:,1:2); 

namew = ['bread';'veget';'fruit';'meat ';'poult';'milk ';'wine '];
namez = ['ma2';'em2';'ca2';'ma3';'em3';'ca3';'ma4';'em4';'ca4';'ma5';'em5';'ca5'];

%% plot food
subplot(2,2,1);
hold on
title('Food');
xlabel('W[.1]');
ylabel('W[.2]');
xlim([-1.2 0.8]);
ylim([-1 0.5]);

line([-1.2 0.8],[0 0],'Color','k');
line([0 0],[1 -1],'Color','k');

for i=1:7
    text(w(i,1),w(i,2),namew(i,:),'FontSize',7);
end;       

%% plot families
subplot(2,2,2);
hold on
title('Families');
xlabel('Z[.1]');
ylabel('Z[.2]');
xlim([-2 2]);
ylim([-1.2 1]);

line([-2 2],[0 0],'Color','k');
line([0 0],[-1 1.5],'Color','k');

for i=1:12
    text(z(i,1),z(i,2),namez(i,1:3),'FontSize',7);
end;  

%% details food
subplot(2,2,3);
axis off
for i=1:7
    text(0,1-0.1*i,namew(i,1:5))
    w1=num2str(w(i,1),'%10.5f');
    w2=num2str(w(i,2),'%10.5f');
    if w(i,1)<0
        text(0.38,1-0.1*i,w1)
    else
        text(0.4,1-0.1*i,w1)
    end
    if w(i,2)<0
        text(0.78,1-0.1*i,w2)
    else
        text(0.8,1-0.1*i,w2)
    end
end

%% details families
subplot(2,2,4);
axis off
for i=1:12
    text(0,1-0.1*i,namez(i,1:3))
    z1=num2str(z(i,1),'%10.5f');
    z2=num2str(z(i,2),'%10.5f');
    if z(i,1)<0
        text(0.38,1-0.1*i,z1)
    else
        text(0.4,1-0.1*i,z1)
    end
    if z(i,2)<0
        text(0.78,1-0.1*i,z2)
    else
        text(0.8,1-0.1*i,z2)
    end
end
```

automatically created on 2018-05-28

### SAS Code
```sas


* Import the data;
data food;
  infile '/folders/myfolders/data/food.dat';
  input temp1 $ temp2-temp8;
run;

proc iml;
  * Read data into a matrix;
  use food;
    read all var _ALL_ into x; 
  close food;

  n = nrow(x);
  p = ncol(x);
  
  one = j(n, n, 1);
  h   = i(n) - one/n;
  a   = x - repeat(x(|:,|), n, 1);
  d   = diag(1 / sqrt(a[##,] / n));
  
  xs  = h * x * d;  * standardized data;
  xs1 = xs / sqrt(n);
  xs2 = xs1` * xs1;
  
  * spectral decomposition;
  lambda = eigval(xs2);
  gamma  = eigvec(xs2);
  
  * coordinates of food;
  w = gamma # repeat(sqrt(lambda)`, nrow(gamma), 1);
  w = w[, 1:2];
  
  * coordinates of families;
  z1 = xs1 * gamma;
  z2 = sqrt(n/p) * z1;
  z  = z2[, 1:2];
  
  namew = {"bread", "veget", "fruit", "meat", "poult", "milk", "wine"};
  namez = {"ma2", "em2", "ca2", "ma3", "em3", "ca3", "ma4", "em4", "ca4", "ma5", "em5", "ca5"};

  x1  = w[,1];
  x2  = w[,2]; 
  x3  = z[,1];
  x4  = z[,2]; 
      
  create plot var {"x1" "x2" "x3" "x4" "namew" "namez"};
    append;
  close plot;
quit;

proc sgplot data = plot
    noautolegend;
  title 'Food';
  scatter x = x1 y = x2 / markerattrs = (symbol = circlefilled)
    datalabel = namew;
  refline 0 / lineattrs = (color = black);
  refline 0 / axis = x lineattrs = (color = black);
  xaxis label = 'W[,1]';
  yaxis label = 'W[,2]';
run;

proc print data = plot(obs = 7) noobs label;
  var namew x1 x2;
  label namew='names' x1='W[,1]' x2 = 'W[,2]';
run;


proc sgplot data = plot
    noautolegend;
  title 'Families';
  scatter x = x3 y = x4 / markerattrs = (symbol = circlefilled)
    datalabel = namez;
  refline 0 / lineattrs = (color = black);
  refline 0 / axis = x lineattrs = (color = black);
  xaxis label = 'Z[,1]';
  yaxis label = 'Z[,2]';
run;

proc print data = plot noobs label;
  var namez x3 x4;
  label namez='names' x1='W[,1]' x2 = 'W[,2]';
run;


```

automatically created on 2018-05-28