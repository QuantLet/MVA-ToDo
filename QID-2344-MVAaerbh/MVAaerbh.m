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


