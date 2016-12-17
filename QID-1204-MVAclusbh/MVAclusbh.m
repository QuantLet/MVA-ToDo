%% clear all variables and console and close windows
clear
clc
close all

%% load data
data = load('bostonh.dat');

%% Transformations
xt = data;
xt(:,[1,3,5,6,8,9,10,14]) = log(xt(:,[1,3,5,6,8,9,10,14]));
xt(:,2) = data(:,2)./10;
xt(:,7) = (data(:,7).^(2.5))./10000;
xt(:,11) = exp(0.4*data(:,11))./1000;
xt(:,12) = data(:,12)./100;
xt(:,13) = sqrt(data(:,13));
xt(:,4) = [];

%% standardize variables
n1 = length(xt);
m  = mean(xt);
zz = (xt - repmat(m,n1,1))./repmat(sqrt(var(xt)),n1,1);

%% euclidean distance matrix
d = pdist(zz,'euclidean');

%% cluster analysis with ward algorithm                                          
w    = linkage(d,'ward');
tree = cluster(w,'maxclust',2);
t1   = zz(tree(:,1)==1,:);
t2   = zz(tree(:,1)==2,:);

%% Dendrogram for the standardized food.dat after Ward algorithm
figure(1)
[H, T] = dendrogram(w);
set(H,'LineWidth',2)
title('Ward method', 'FontSize',14)
ylabel('distance', 'FontSize',12)
box on

% means for Cluster 1 and Cluster 2
mc = [mean(t1),mean(t2)];
% standard deviations for Cluster 1 and Cluster 2
[n,m]   = size(zz);
sc      = [std(t1(:,1:m)),std(t2(:,1:m))];
[nt,mt] = size(t1);
% means and standard deviations of the 13 standardized variables 
% for Cluster 1 (251 observations) and Cluster 2 (255 observations)
tbl = [mc(:,1),sc(:,1)./sqrt(nt),mc(:,2),sc(:,2)./sqrt(mt)];

% spectral decomposition
[eve,eva] = eigs(cov(zz),2,'la');                  

eve = eve(:,1:2);
dav = zz*eve;

%% Scatterplot for the first two PCs displaying the two clusters
figure(2)
gscatter(dav(:,1),dav(:,2), tree,'rk','o+')
xlabel('PC1', 'FontSize',12)
ylabel('PC2', 'FontSize',12)
title('first vs. second PC', 'FontSize',14)
box on
legend off

%% Boxplots for variables X1 to X14
xt  = [xt(:,1:3),data(:,4),xt(:,4:end)];
m   = mean(xt);
dat = (xt - repmat(m,n1,1))./repmat(sqrt(var(xt)),n1,1);
t   = tree;

figure(3)
for i=1:14
    subplot(2,7,i)
    hold on
    boxplot(dat(:,i),t)

    str = strcat('X',int2str(i));
    xlabel(str);
    hold off
end

%% Scatterplot matrix for variables X1 to X7
figure(4)
for i=1:7    
    for j=1:i-1
        subplot(7,7,(i-1)*7+j)
        gscatter(xt(:,j), xt(:,i),tree, 'rk','oo')
        xlim([min(xt(:,j)) max(xt(:,j))])
        ylim([min(xt(:,i)) max(xt(:,i))])
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

%% Scatterplot matrix for variables X8 to X14
xx = xt(:,8:14);
figure(5)
for i=1:7
    for j=1:i-1
        subplot(7,7,(i-1)*7+j)
        gscatter(xx(:,j), xx(:,i),tree, 'rk','oo')
        xlim([min(xx(:,j)) max(xx(:,j))])
        ylim([min(xx(:,i)) max(xx(:,i))])
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
