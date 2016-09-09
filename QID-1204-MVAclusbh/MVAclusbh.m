% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAclusbh
% ------------------------------------------------------------------------------
% Description:  MVAclusbh performs cluster analysis for the transformed boston 
%               housing data (bostonh.dat).              
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       Dendrogram for the transformed bostonh.dat after applying the 
%               Ward method, means and standard errors for the two clusters of
%               the 13 standardized variables, boxplots and scatterplot matrices
%               for the two clusters of all variables, scatterplot for the first 
%               two PCs displaying the two clusters.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20100610;
%               Matlab: Awdesch Melzer 20120329
% ------------------------------------------------------------------------------

% clear variables and close windows
clear all;
close all;
clc

% load data
data = load('bostonh.dat');

% transform data
xt = data;
xt(:,[1,3,5,6,8,9,10,14]) = log(xt(:,[1,3,5,6,8,9,10,14]));
xt(:,2) = data(:,2)./10;
xt(:,7) = (data(:,7).^(2.5))./10000;
xt(:,11) = exp(0.4*data(:,11))./1000;
xt(:,12) = data(:,12)./100;
xt(:,13) = sqrt(data(:,13));
xt(:,4) = [];

% standardize variables

for i=1:13
    zz(:,i)=(xt(:,i)-mean(xt(:,i)))/(sqrt(var(xt(:,i))));
end

% euclidean distance matrix
d = pdist(zz,'euclidean');
% cluster analysis with ward algorithm                                          
w = linkage(d,'ward');
tree = cluster(w,'maxclust',2);
t1 = zz(find(tree(:,1)==1),:);
t2 = zz(find(tree(:,1)==2),:);




% Dendrogram for the standardized food.dat after Ward algorithm
figure(1)
[H, T] = dendrogram(w);
set(H,'LineWidth',2)
title('Ward method', 'FontSize',14)
ylabel('distance', 'FontSize',12)
box on

% means for Cluster 1 and Cluster 2
mc = [mean(t1),mean(t2)];
% standard deviations for Cluster 1 and Cluster 2
[n m] = size(zz);
sc = [std(t1(:,1:m)),std(t2(:,1:m))];
[nt,mt] = size(t1);
% means and standard deviations of the 13 standardized variables for Cluster 1 (251 observations) and Cluster 2 (255 observations)
tbl = [mc(:,1),sc(:,1)./sqrt(nt),mc(:,2),sc(:,2)./sqrt(mt)];

% spectral decomposition
[eve,eva] = eigs(cov(zz));                  

eve = eve(:,1:2);

dav = zz*eve;



% Scatterplot for the first two PCs displaying the two clusters
figure(2)
gscatter(dav(:,1),dav(:,2), tree,'rk','o+')
xlabel('PC1', 'FontSize',12)
ylabel('PC2', 'FontSize',12)
title('first vs. second PC', 'FontSize',14)
box on
legend off

% Boxplots for variables X1 to X14
xt = data;
xt(:,[1,3,5,6,8,9,10,14]) = log(xt(:,[1,3,5,6,8,9,10,14]));
xt(:,2) = data(:,2)./10;
xt(:,7) = (data(:,7).^(2.5))./10000;
xt(:,11) = exp(0.4*data(:,11))./1000;
xt(:,12) = data(:,12)./100;
xt(:,13) = sqrt(data(:,13));

for i=1:14
    zz(:,i)=(xt(:,i)-mean(xt(:,i)))/(sqrt(var(xt(:,i))));
end


dat = zz

t = tree;

figure(3)
for i=1:14
subplot(2,7,i)
hold on
boxplot(dat(:,i),t)

str = sprintf('X %f ',i);
xlabel(str);
hold off
end

% Scatterplot matrix for variables X1 to X7
figure(4)
for i=1:7
    for j=1:i-1
subplot(7,7,(i-1)*7+j)
gscatter(xt(:,i), xt(:,j),tree, 'rk','oo')
legend off
box on
end
end

subplot(7,7,1)
axis off
text(0.3,0.5,'X 1')
subplot(7,7,9)
axis off
text(0.3,0.5,'X 2')
subplot(7,7,17)
axis off
text(0.3,0.5,'X 3')
subplot(7,7,25)
axis off
text(0.3,0.5,'X 4')
subplot(7,7,33)
axis off
text(0.3,0.5,'X 5')
subplot(7,7,41)
axis off
text(0.3,0.5,'X 6')
subplot(7,7,49)
axis off
text(0.3,0.5,'X 7')




xx = xt(:,8:14);

% Scatterplot matrix for variables X8 to X14
figure(5)
for i=1:7
    for j=1:i-1
subplot(7,7,(i-1)*7+j)
gscatter(xx(:,i), xx(:,j),tree, 'rk','oo')
legend off
box on
end
end

subplot(7,7,1)
axis off
text(0.3,0.5,'X 8')
subplot(7,7,9)
axis off
text(0.3,0.5,'X 9')
subplot(7,7,17)
axis off
text(0.3,0.5,'X 10')
subplot(7,7,25)
axis off
text(0.3,0.5,'X 11')
subplot(7,7,33)
axis off
text(0.3,0.5,'X 12')
subplot(7,7,41)
axis off
text(0.3,0.5,'X 13')
subplot(7,7,49)
axis off
text(0.3,0.5,'X 14')
