%% clear all variables and console and close windows
clear
clc
close all

%% load data
x1 = load('timebudget.dat');

[n,p] = size(x1);
m     = mean(x1);
x     = (x1-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x1)),n,1); % standardizes Data


[v1,e1] = eigs((x*x')/n,n,'la'); % Decomposes matrix and sorts eigenvalues and vectors by size
e       = diag(e1);              % Creates column vector of eigenvalues
w(:,1)  = v1(:,1).*sqrt(e(1));
w(:,2)  = v1(:,2).*sqrt(e(2));

%% plot1, representation of the individuals
figure(1)
hold on
line([-0.18 0.12],[0 0],'Color','k')
line([0 0],[-0.12 0.12],'Color','k')
xlim([-0.18 0.12]);
ylim([-0.12 0.12]);
title('Time Budget Data');
xlabel('First Factor - Individuals');
ylabel('Second Factor - Individuals');
% labels of the individuals
fams = ['maus';'waus';'wnus';'mmus';'wmus';'msus';'wsus';'mawe';'wawe';
       'wnwe';'mmwe';'wmwe';'mswe';'wswe';'mayo';'wayo';'wnyo';'mmyo';
       'wmyo';'msyo';'wsyo';'maes';'waes';'wnes';'mmes';'wmes';'mses';
       'wses']; 
text(w(:,1), w(:,2), fams)
box on

[v2,e2] = eigs(x'*x,p,'la');
ee      = diag(e2);              % creates ector of eigenvalues
z(:,1)  = v2(:,1)*sqrt(ee(1));   % First PC
z(:,2)  = v2(:,2)*sqrt(ee(2));   % Second PC

%% plot2, representation of the variables
figure(2);
hold on
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
xlim([-1.2 1.2])
ylim([-1.2 1.2])
circle = rsmak('circle');
fnplt(circle);
title('Time Budget Data');
xlabel('First Factor - Expenditures')
ylabel('Second Factor - Expenditures')
% labels of the variables
namez = ['prof';'tran';'hous';'kids';'shop';'pers';'eati';'slee';'tele';
       'leis'];
text(z(:,1),z(:,2),namez,'FontSize',12,'FontWeight','bold');
box on
hold off
