%% clear all variables and console and close windows
clear
clc
close all

%% load data
formatSpec = '%s%f%f%f%f%f%f%s';
data       = readtable('uscomp2.dat','Delimiter',' ', 'Format',formatSpec);

%% omit the observations for IBM and General Electric
data.Var1 = nominal(data.Var1);
data      = data(data.Var1~='IBM',:);
data      = data(data.Var1~='GeneralElectric',:);

x      = data;
x.Var1 = [];
x.Var8 = [];
x      = table2array(x);

[n,p] = size(x);
m     = mean(x);
x     = (x-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x)/n),n,1); % standardizes the data matrix
[v,e] = eigs((n-1)*cov(x)/n,p,'la');  % eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it))
e1    = diag(e);                      % creates a vector of eigenvalues
x     = x-repmat(m,n,1);

% change the signs of some eigenvector. This is done only to make easier
% the comparison with R results.
v(:,[1,3:6]) = -v(:,[1,3:6]);

r  = x*v;
r  = corr([r x]);   % Correlation between PCs and variables
r1 = r(7:end,1:2);  % Correlation between the first two PCs and variables

%% plot
% polar coordinates
figure
hold on
box on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('U.S. Company Data')
xlabel('First PC')
ylabel('Second PC')
daspect([1,1,1])
plot(exp((-1)^.5*[0:2*pi/360:2*pi]))  % plot unit circle
for i=1:length(r1)
    text(r1(i,1),r1(i,2),strcat('X',int2str(i)))
end

% eigenvalues
nr = 1:6;
figure
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('U.S. Company Data')
xlim([0.5 6.5])
ylim([-0.2 3.5])
box on
