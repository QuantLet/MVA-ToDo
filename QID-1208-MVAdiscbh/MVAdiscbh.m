% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAdiscbh
% ------------------------------------------------------------------------------
% Description:  MVAdiscbh demonstrates the maximum likelihood (ML) discrimination 
%               rule for the Boston housing data (bostonh.dat).
% ------------------------------------------------------------------------------
% Usage:        hclust
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       Application of the linear discriminant rule on the variables of 
%               the transformed bostonh.dat, calculation of the APER (apparent 
%               error rate) for price and clusters of Boston houses and plot of 
%               the linear discriminant scores for the two clusters created from
%               the transformed bostonh.dat.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20100924
%               Matlab: Awdesch Melzer 20120407
% ------------------------------------------------------------------------------

% clear loaded variables and close windows
clear all;
close all;
clc;

% load data
data = load('bostonh.dat');

%transform data
xt = data;
xt(:,1) = log(data(:,1));
xt(:,2) = data(:,2)./10;
xt(:,3) = log(data(:,3));
xt(:,5) = log(data(:,5));
xt(:,6) = log(data(:,6));
xt(:,7) = (data(:,7).^(2.5))./10000;
xt(:,8) = log(data(:,8));
xt(:,9) = log(data(:,9));
xt(:,10) = log(data(:,10));
xt(:,11) = exp(0.4*data(:,11))./1000;
xt(:,12) = data(:,12)./100;
xt(:,13) = sqrt(data(:,13));
xt(:,14) = log(data(:,14));
data = xt;
data(:,4) = [];

%standardize variables
[n m] = size(data);
for i = 1:n
da(i,:) = (data(i,:)-mean(data))./sqrt((n-1)*var(data)/n);
end

%euclidean distance matrix
d = pdist(da,'euclidean',2);

%cluster analysis with ward algorithm                                          
w = hclust(d);

%define the clusters, tree=1 if cluster=1
tree = cluster(w,'maxclust',2);

t1 = da(find(tree==1),:);

t2 = da(find(tree==2),:);

%mean of first cluster
m1 = mean(t1);
%mean of second cluster
m2 = mean(t2);
%mean of both clusters
m = (m1+m2)/2;

%common variance matrix
s = ((length(t1)-1)*cov(t1)+(length(t2)-1)*cov(t2))/(length(xt)-2);
%alpha for the discrimination rule
alpha = inv(s)*(m1-m2)';

%APER for clusters of Boston houses
mis1 = sum((t1-repmat(m,length(t1),1))*alpha<0) %misclassified 1
mis2 = sum((t2-repmat(m,length(t2),1))*alpha>0) %misclassified 2
corr1 = sum((t1-repmat(m,length(t1),1))*alpha>0) %correct 1
corr2 = sum((t2-repmat(m,length(t2),1))*alpha<0) %correct 2
disp('Apparent error rate for clusters of Boston houses')
aper = (mis1+mis2)./length(xt) %APER (apparent error rate)

alph = (da-repmat(m,length(da),1))*alpha;

%linear discriminant scores
p = [alph,tree+0.05*normrnd(0,1,length(tree),1)];

%plot of the linear discriminant scores
gscatter(p(:,1),p(:,2),tree,'rk','o^',8)
line([0,0],[0.7,2.3],'Color','k','LineWidth',2.4)
ylim([0.7,2.3])
legend off
box on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculation of APER for price of Boston houses.
% Demonstration of the ML discrimination rule and 
% calculation the apparent error rate for Boston housing

for i=1:length(xt)
    if xt(i,14)>median(xt(:,14));
        true(i)=1;
    else
        true(i)=0;
    end
end

j=0;
k=0;
for i=1:length(xt)
    if true(i)==1 
        j=j+1;
        xg0(j,:)=xt(i,:);
    else
        k=k+1;
        xf0(k,:)=xt(i,:);
    end
end
a0=xg0(:,1:3);
b0=xg0(:,5:13);

a1=xf0(:,1:3);
b1=xf0(:,5:13);

xg=[a0,b0];
xf=[a1,b1];

mg=mean(xg);
mf=mean(xf);
m=(mf+mg)/2;

s=((length(xg)-1)*cov(xg)+(length(xf)-1)*cov(xf))/(length(xt)-2);

alpha=inv(s)*(mg-mf)';

miss1=0;
miss2=0;
corr1=0;
corr2=0;

for i=1:length(xg)
    aux1(i)=(xg(i,:)-m)*alpha;
end

for i=1:length(aux1)
    if aux1(i)<0 
        miss1=miss1+1;
    else
        corr1=corr1+1;
    end
end

for i=1:length(xf)
    aux2(i)=(xf(i,:)-m)*alpha;
end

for i=1:length(aux2)
    if aux2(i)>0 
        miss2=miss2+1;
    else
        corr2=corr2+1;
    end
end

disp('Group 1 classified as 2: ')
miss1
disp('Group 2 classified as 1: ')
miss2
disp('Group 1 classified as 1: ')
corr1
disp('Group 2 classified as 2:  ')
corr2
disp('APER (apparent error rate) for price of Boston houses:')
aper=(miss1+miss2)/length(xt);
aper