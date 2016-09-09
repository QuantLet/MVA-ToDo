% clear variables and close windows
clear all;
close all;
clc;

% load data
[familytype,economic,service,value,price,look,sporty,security,easy]=textread('carmean2.dat','%s %f %f %f %f %f %f %f %f');
 
% delete the first column (names of the car marks)
car      = [economic,service,value,price,look,sporty,security,easy];

% define variable names
colnames = ['economic'
    'service '
    'value   '
    'price   '
    'look    '
    'sporty  '
    'security'
    'easy    '];  
% define car marks 
rownames = ['audi       '
    'bmw        '
    'citroen    '
    'ferrari    '
    'fiat       '
    'ford       '
    'hyundai    '
    'jaguar     '
    'lada       '
    'mazda      '
    'mercedes   '
    'mitsubishi '
    'nissan     '
    'opel_corsa '
    'opel_vectra'
    'peugeot    '
    'renault    '
    'rover      '
    'toyota     '
    'trabant    '
    'vw_golf    '
    'vw_passat  '
    'wartburg   '];

% euclidean distance matrix
d          = pdist(car,'euclidean');
% squared euclidean distance matrix
d2         = d.^2;

% distance matrix
dista      = squareform(d2);

% compute mean for every row of the distance matrix
dm         = mean(dista);

% inner product matrix

B          = -0.5.*((dista-repmat(dm,length(car),1))+repmat(-dm'+mean(dm),1,length(car)));

% spectral decomposition
[eve, eva] = eig(B);

eve12      = eve(:,1:2);
eva12      = eva(1:2,1:2);

sq         = sqrt(eva12);

% the coordinate matrix which contains the point configuration
q          = eve12*sq;

cor        = corr([q,car]);

[p, t]     = size(cor);
% extract the first two principal components
r          = cor(3:t,1:2);

% Plot for the MDS solution on the car data
figure(1)
plot(q,'w')
xlim([-4.3,6])
ylim([-1.7,3.2])
xlabel('x')
ylabel('y')
title('Metric MDS')
text(-q(:,1),q(:,2),rownames,'FontSize',12)

% Plot for the Correlation between the MDS direction and the variables
figure(2)
angle = linspace(0, 2*pi, 360);
x     = cos(angle);
y     = sin(angle);
plot(x,y,'LineWidth',2)
axis('equal')
title('Correlations MDS/Variables')
xlabel('x')
ylabel('y');
text(-r(:,1),r(:,2),colnames,'FontSize',12)
