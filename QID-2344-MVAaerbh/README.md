[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVAaerbh** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: MVAaerbh

Published in: Applied Multivariate Statistical Analysis

Description: Calculates the actual error rate (AER) for price and clusters of Boston houses.

Keywords: actual-error-rate, discrimination, cluster-analysis, estimation, discriminant-analysis, euclidean-distance-matrix, financial

See also: MVAaer, MVAaper, MVAdiscbh, MVAdisfbank, MVAdisnorm

Author: Zografia Anastasiadou

Submitted: Tue, October 28 2014 by Felix Jung

Datafile: bostonh.dat

```

### MATLAB Code
```matlab

% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAaerbh
% ------------------------------------------------------------------------------
% Description:  Calculation of the AER (actual error rate) for price and 
%               clusters of Boston houses for the Boston housing data 
%               (bostonh.dat).
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       The actual error rate for price and clusters of Boston houses.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20110514; Awdesch Melzer 20120416
% ------------------------------------------------------------------------------

clear all;
close all;
clc;

data = load('bostonh.dat');

%transform data
xt = data;
xt(:,[1,3,5,6,8,9,10,14]) = log(xt(:,[1,3,5,6,8,9,10,14]));
xt(:,2) = data(:,2)./10;
xt(:,7) = (data(:,7).^(2.5))./10000;
xt(:,11) = exp(0.4*data(:,11))./1000;
xt(:,12) = data(:,12)./100;
xt(:,13) = sqrt(data(:,13));
xt(:,4) = [];

%standardize variables
for i=1:13
    zz(:,i)=(xt(:,i)-mean(xt(:,i)))/(sqrt(var(xt(:,i))));
end

%euclidean distance matrix
d = pdist(zz,'euclidean');

%cluster analysis with ward algorithm                                          
w = hclust(d); 
%define the clusters, tree=1 if cluster=1
tree = cluster(w,'maxclust',2);


%for the AER of boston house price please unquote the following line 
%tree = (xt(:,13)>repmat(median(xt(:,13)),length(xt),1))+1;

t1 = zz(find(tree(:,1)==1),:);
t2 = zz(find(tree(:,1)==2),:);
datat = [t1;t2];




n = length(tree);



%mean of first cluster
  m1 = mean(t1);
    %mean of second cluster
  m2 = mean(t2);
    %mean of both clusters
  m = (m1+m2)/2;

 
miss1=0; %misclassified 1
miss2=0; %misclassified 2
corr1=0;
corr2=0;

%AER for clusters of Boston houses
%miss1
i=0;
while i<length(t1)
    i=i+1;
    xg=datat((1:(length(t1)-1)),:) ;
    s=((length(t1)-1)*cov(t1)+(length(t2)-1)*cov(t2))/(length(zz)-2);
    alpha=inv(s)*(m1-m2)';
    if i<length(t1)
        if ((xg(i,:)-m)*alpha)<0
            miss1=miss1+1;
        end
    end
end
%corr1
i=0;
while i<length(t1)
    xg=datat((1:(length(t1)+1)),:) ;
    s=((length(t1)-1)*cov(t1)+(length(t2)-1)*cov(t2))/(length(zz)-2);
    alpha=inv(s)*(m1-m2)';
    if i<length(t1)
        if ((xg(i+1,:)-m)*alpha)>0
            corr1=corr1+1;
        end
    end
    i=i+1;
end

%miss2
i=(length(t1));
while i<length(data)
    i=i+1;
    xf=datat(((length(t1)):(length(data))),:) ;
    s=((length(t1)-1)*cov(t1)+(length(t2)-1)*cov(t2))/(length(zz)-2);
    alpha=inv(s)*(m1-m2)';
   if i<length(data)
        if (xf((i-length(t1)),:)*alpha)>0
            miss2=miss2+1;
        end
   end
end
%corr2
i=(length(t1));
while i<length(data)
     i=i+1;
    xf=datat(((length(t1)+1):(length(data))),:) ;
    s=((length(t1))*cov(t1)+(length(t2))*cov(t2))/(length(zz)-2);
    alpha=inv(s)*(m1-m2)';
   if i<length(data)
        if (xf((i-(length(t1))),:)*alpha)<0
            corr2=corr2+1;
        end
   end
  
end



corr1
corr2
miss1
miss2

aer = (miss1+miss2)/length(zz) %AER (actual error rate)	



```

automatically created on 2018-05-28

### R Code
```r


# clear all variables
rm(list = ls(all = TRUE))
graphics.off()

# load data
data = read.table("bostonh.dat")

# transform data
xt        = data
xt[, 1]   = log(data[, 1])
xt[, 2]   = data[, 2]/10
xt[, 3]   = log(data[, 3])
xt[, 5]   = log(data[, 5])
xt[, 6]   = log(data[, 6])
xt[, 7]   = (data[, 7]^(2.5))/10000
xt[, 8]   = log(data[, 8])
xt[, 9]   = log(data[, 9])
xt[, 10]  = log(data[, 10])
xt[, 11]  = exp(0.4 * data[, 11])/1000
xt[, 12]  = data[, 12]/100
xt[, 13]  = sqrt(data[, 13])
xt[, 14]  = log(as.numeric(data[, 14]))
data      = xt[, -4]

da    = scale(data)                     # standardize variables
d     = dist(da, "euclidean", p = 2)    # euclidean distance matrix
w     = hclust(d, method = "ward.D")    # cluster analysis with ward algorithm
tree  = cutree(w, 2)                    # define the clusters, tree=1 if cluster=1

# the following two lines under comments are for price of Boston houses 
# tree = (xt[, 14] > median(xt[, 14])) + 1 
# da = da[, 1:12]

n = nrow(data)

# AER for clusters of Boston houses
i     = 0
mis1  = 0
mis2  = 0
corr1 = 0
corr2 = 0
while (i < n) {
    i     = i + 1
    xi    = subset(da, 1:n != i)
    treei = subset(tree, 1:n != i)
    t1    = subset(xi, treei == 1)
    t2    = subset(xi, treei == 2)
    m1    = colMeans(t1)                # mean of first cluster
    m2    = colMeans(t2)                # mean of second cluster
    m     = (m1 + m2)/2                 # mean of both clusters
    s     = ((nrow(t1) - 1) * cov(t1) + (nrow(t2) - 1) * cov(t2))/(nrow(da) - 2)    # common variance matrix
    alpha = solve(s) %*% (m1 - m2)                                                  # alpha for the discrimination rule
    mis1  = mis1 + (tree[i] == 1) * ((da[i, ] - m) %*% alpha < 0)                   # misclassified 1
    mis2  = mis2 + (tree[i] == 2) * ((da[i, ] - m) %*% alpha > 0)                   # misclassified 2
    corr1 = corr1 + (tree[i] == 1) * ((da[i, ] - m) %*% alpha > 0)                  # correct 1
    corr2 = corr2 + (tree[i] == 2) * ((da[i, ] - m) %*% alpha < 0)                  # correct 2
}

aer = (mis1 + mis2)/nrow(da)            # AER (actual error rate)
print(aer) 

```

automatically created on 2018-05-28