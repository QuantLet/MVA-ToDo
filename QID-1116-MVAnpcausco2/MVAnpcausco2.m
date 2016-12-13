%% clear all variables and console and close windows
clear
clc
close all

%% load data
formatSpec = '%s%f%f%f%f%f%f%s';
data       = readtable('uscomp2.dat','Delimiter',' ', 'Format',formatSpec);

%% symbols for the sectors
data.Properties.VariableNames{'Var8'} = 'Sector';
data.Sector = categorical(data.Sector);
data.Sector = mergecats(data.Sector, {'Communication','HiTech'},'H');
data.Sector = renamecats(data.Sector,{'Energy','Finance',...
              'Manufacturing','Retail'},{'E','F','M','R'});
data.Sector = mergecats(data.Sector, {'Medical','Other',...
              'Transportation'}, '*');   
data.Sector = char(data.Sector);          

%% omit the observations for IBM and General Electric
data.Var1 = nominal(data.Var1);
data      = data(data.Var1~='IBM',:);
data      = data(data.Var1~='GeneralElectric',:);

x        = data;
x.Var1   = [];
x.Sector = [];
x        = table2array(x);

[n,p] = size(x);
m     = mean(x);
x     = (x-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x)/n),n,1); % standardizes the data matrix
[v,e] = eigs((n-1)*cov(x)/n,p,'la'); % eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
e1    = diag(e);                     % creates a vector of eigenvalues
x     = x*v;

%% plots
%Eigenvalues
subplot(2,1,2)
subplot('Position',[0.1 0.1 0.8 0.15])
nr=1:6;
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('Eigenvalues of S')
xlim([0.5 6.5])
ylim([-1.5 5])
box on

%First vs Second PC
subplot(2,1,1)
subplot('Position',[0.1 0.4 0.8 0.5])
title('First vs. Second PC')
xlabel('PC 1')
ylabel('PC 2')
xlim([-3 9])
ylim([-10 10])
hold on
text(x(:,1),x(:,2),data.Sector);
box on