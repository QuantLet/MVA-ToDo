%% clear all variables and console and close windows
clear
clc
close all

%% load data
formatSpec = '%s%f%f%f%f%f%f%f';
data       = readtable('food.dat', 'Delimiter', ' ', 'Format', formatSpec);
data.Var1  = [];
x          = table2array(data);

[n,p] = size(x);                                                          % records dimensions of data matrix
m     = mean(x);
x     = (x - repmat(m, n, 1)).*repmat(1./sqrt((n - 1) * var(x)/n), n, 1); % standardizes the data matrix
a     = (x * x')/n;

%% compute eigenvalues
[gamma, lambda] = eigs(a, 2, 'la'); % two largest eigenvalues and the respective eigenvectors 
lambda          = diag(lambda);

w = -[gamma(:, 1) * sqrt(lambda(1)), gamma(:, 2) * sqrt(lambda(2))];

namew = ['MA2'; 'EM2'; 'CA2'; 'MA3'; 'EM3'; 'CA3'; 'MA4'; 'EM4'; 'CA4';
         'MA5'; 'EM5'; 'CA5'];
     
%% Plot1: the representation of the indivuals     
figure
line([-1.5 1], [0 0], 'Color', 'k')
line([0 0], [-0.6 1], 'Color', 'k')
title('French Food Data')
xlabel('First Factor - Families')
ylabel('Second Factor - Families')
text(w(:, 1), w(:, 2), namew)
line([w(1,1) w(2,1)], [w(1,2) w(2,2)], 'Color', 'k', 'LineStyle', ':')
line([w(2,1) w(3,1)], [w(2,2) w(3,2)], 'Color', 'k', 'LineStyle', ':')
line([w(1,1) w(4,1)], [w(1,2) w(4,2)], 'Color', 'k', 'LineStyle', ':')
line([w(2,1) w(5,1)], [w(2,2) w(5,2)], 'Color', 'k', 'LineStyle', ':')
line([w(4,1) w(5,1)], [w(4,2) w(5,2)], 'Color', 'k', 'LineStyle', ':')
line([w(5,1) w(6,1)], [w(5,2) w(6,2)], 'Color', 'k', 'LineStyle', ':')
line([w(6,1) w(9,1)], [w(6,2) w(9,2)], 'Color', 'k', 'LineStyle', ':')
line([w(8,1) w(9,1)], [w(8,2) w(9,2)], 'Color', 'k', 'LineStyle', ':')
line([w(5,1) w(8,1)], [w(5,2) w(8,2)], 'Color', 'k', 'LineStyle', ':')
line([w(7,1) w(8,1)], [w(7,2) w(8,2)], 'Color', 'k', 'LineStyle', ':')
line([w(4,1) w(7,1)], [w(4,2) w(7,2)], 'Color', 'k', 'LineStyle', ':')
line([w(7,1) w(10,1)], [w(7,2) w(10,2)], 'Color', 'k', 'LineStyle', ':')
line([w(10,1) w(11,1)], [w(10,2) w(11,2)], 'Color', 'k', 'LineStyle', ':')
line([w(8,1) w(11,1)], [w(8,2) w(11,2)], 'Color', 'k', 'LineStyle', ':')
line([w(11,1) w(12,1)], [w(11,2) w(12,2)], 'Color', 'k', 'LineStyle', ':')
line([w(9,1) w(12,1)], [w(9,2) w(12,2)], 'Color', 'k', 'LineStyle', ':')

namez      = ['bread     '; 'vegetables'; 'fruit     '; 'meat      ';
              'poultry   '; 'milk      '; 'wine      '];
b          = (x' * x)/n;
[gam,lamb] = eigs(b, 2, 'la');
lamb       = diag(lamb);

% change the sign of some eigenvectors . This is done only to make 
% easier the comparison with R results.
gam(:, 2) = - gam(:, 2);

z = [gam(:, 1) * sqrt(lamb(1)), gam(:, 2) * sqrt(lamb(2))];

%% Plot1: the representation of the variables
figure
line([-1.2 1.2], [0 0], 'Color', 'k')
line([0 0], [1.2 -1.2], 'Color', 'k')
hold on
circle = rsmak('circle');
fnplt(circle)
title('French Food Data')
xlabel('First Factor - Goods')
ylabel('Second Factor - Goods')
xlim([-1.2 1.2])
ylim([-1.2 1.2])
text(z(:,1), z(:,2), namez)
