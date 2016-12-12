%% clear all variables and console and close windows
clear
clc
close all

%% load data
data = load('bostonh.dat');

%% Transformations
xt       = data;
xt(:,1)  = log(data(:,1));
xt(:,2)  = data(:,2)/10;
xt(:,3)  = log(data(:,3));
% xt(:,4)  = data(:,4);
xt(:,5)  = log(data(:,5));
xt(:,6)  = log(data(:,6));
xt(:,7)  = (power(data(:,7),2.5))/10000;
xt(:,8)  = log(data(:,8));
xt(:,9)  = log(data(:,9));
xt(:,10) = log(data(:,10));
xt(:,11) = exp(0.4*data(:,11))/1000;
xt(:,12) = data(:,12)/100;
xt(:,13) = sqrt(data(:,13));
xt(:,14) = log(data(:,14));

data      = xt;
data(:,4) = [];
n1        = length(data);
m         = mean(data);
b         = sqrt((n1-1)*var(data)/n1);
x         = (data - repmat(m,n1,1))./repmat(b,n1,1);
adjust    = (n1-1)*cov(x)/n1;
[v,e]     = eigs(adjust,13,'la');

% change the sign of the eigenvectors . This is done only to make easier
% the comparison with R results.
v(:,[1 2 4 7 8 ]) = -v(:,[1 2 4 7 8 ]);

m  = mean(x);
x1 = x - repmat(m,n1,1);
r1 = x1*v; %
r  = corr([r1 x]);


%% correlations between variables and the forst three pc's
r12  = r(14:end,1:2);
r13  = [r(14:end, 1), r(14:26, 3)];
r32  = [r(14:end, 3), r(14:26, 2)];
r123 = r(14:end, 1:3);

%% plots
%% First and Second PC
subplot(2,2,1)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Boston Housing','FontSize',12,'FontWeight','bold')
xlabel('First PC','FontSize',12,'FontWeight','bold')
ylabel('Second PC','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12,'FontWeight','bold','Box','on')
circle = rsmak('circle');
fnplt(circle)
for i=1:length(r12)
    if i<4
        text(r12(i,1),r12(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')
    else
        text(r12(i,1),r12(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    end
end
%% Third and Second PC
subplot(2,2,2)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Boston Housing','FontSize',12,'FontWeight','bold')
xlabel('Third PC','FontSize',12,'FontWeight','bold')
ylabel('Second PC','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12,'FontWeight','bold','Box','on')
circle = rsmak('circle');
fnplt(circle)
for i=1:length(r32)
    if i<4
        text(r32(i,1),r32(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')
    else
        text(r32(i,1),r32(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    end
end
%% First and Third PC
subplot(2,2,3)
circle = rsmak('circle');
fnplt(circle)
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Boston Housing','FontSize',12,'FontWeight','bold')
xlabel('First PC','FontSize',12,'FontWeight','bold')
ylabel('Third PC','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12,'FontWeight','bold','Box','on')
for i=1:length(r13)
    if i<4
        text(r13(i,1),r13(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')   
    else
        text(r13(i,1),r13(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    end
end
%% First, Second and Third PC
subplot(2,2,4)
circle = rsmak('circle');
fnplt(circle)
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
xlabel('X','FontSize',12,'FontWeight','bold')
ylabel('Y','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12,'FontWeight','bold','Box','on')
for i=1:length(r123)
    if i<4
        text(r123(i,1),r123(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')    
    else
        text(r123(i,1),r123(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    end
end
hold off

disp('Correlations of the first three PCs with the original variables')
disp('           PC1                 PC2                 PC3')
disp(r123)
