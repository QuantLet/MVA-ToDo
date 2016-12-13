%% clear all variables and console and close windows
clear
clc
close all

%% load data
x = load('bank2.dat');

% Vector with ones in the first 100 entries and zeros in the rest
% that enables us to use the 'gscatter'command to plot the data in groups.
groups = vertcat(ones(100,1),zeros(100,1));                

[n,p] = size(x);
m     = mean(x);
x     = (x-repmat(m,n,1)).*repmat(1./sqrt(var(x)),n,1);   % standardizes the data matrix
[v,e] = eigs(cov(x),p,'la');  % eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
e1    = diag(e);              % creates column vector of eigenvalues

% change the signs of some eigenvector. This is done only to make easier
% the comparison with R results.
v(:,[1,5,6]) = -v(:,[1,5,6]);

%% plot, eigenvalues
figure
nr = 1:6;
scatter(nr,e1,'k')
box on
xlabel('Index')
ylabel('Lambda')
title('Swiss Bank Notes')
xlim([0.5 6.5])
ylim([0 3.5])

m    = mean(x);
temp = x-repmat(m,n,1);
r    = temp*v;
r    = corr([r x]);   % correlation between PCs and variables
r1   = r(7:12,1:2);   % correlation between the first two PCs and variables

%% plot
figure
hold on
box on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Swiss Bank Notes')
xlabel('First PC')
ylabel('Second PC')
circle = rsmak('circle');
fnplt(circle)
for i=1:length(r1)
    text(r1(i,1),r1(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')
end
hold off
