% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcahousi
% ---------------------------------------------------------------------
% Description:  MVAnpcahousi calculates and plots the correlations of 
%               the first three PCs with the original variables for 
%               the standarized Boston housing data (bostonh.dat).
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Displays and plots of the correlations of the first three
%               PCs with the original variables.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

clear
close all
clc

x=load('bostonh.dat');

%Transformations
xt=x;
xt(:,1)=log(x(:,1));
xt(:,2)=x(:,2)/10;
xt(:,3)=log(x(:,3));
xt(:,4)=x(:,4);
xt(:,5)=log(x(:,5));
xt(:,6)=log(x(:,6));
xt(:,7)=(power(x(:,7),2.5))/10000;
xt(:,8)=log(x(:,8));
xt(:,9)=log(x(:,9));
xt(:,10)=log(x(:,10));
xt(:,11)=exp(0.4*x(:,11))/1000;
xt(:,12)=x(:,12)/100;
xt(:,13)=sqrt(x(:,13));
xt(:,14)=log(x(:,14));

x1(:,1:3)=xt(:,1:3);
x1(:,4:13)=xt(:,5:14);

n=length(x1);
m=mean(x1);

for i=1:13
    x1(:,i)=x1(:,i)-m(i);
end

b = sqrt((n-1)*var(x1)/n);

for i=1:13
    x1(:,i)=x1(:,i)./b(i);
end

adjust=(n-1)*cov(x1)/n;

[v e]=eig(adjust);

%Arranging eigenvalues and eigenvectors
for i=1:13
    e1(14-i)=e(i,i);
end

sorted(:,1)=v(:,13);
sorted(:,2)=-v(:,12);
sorted(:,3)=v(:,11);
sorted(:,4)=-v(:,10);
sorted(:,5)=-v(:,9);
sorted(:,6)=v(:,8);
sorted(:,7)=v(:,7);
sorted(:,8)=v(:,6);
sorted(:,9)=-v(:,5);
sorted(:,10)=v(:,4);
sorted(:,11)=-v(:,3);
sorted(:,12)=v(:,2);
sorted(:,13)=-v(:,1);

v=sorted;

m=mean(x1);
for i=1:13
    r1(:,i)=x1(:,i)-m(i);
end

r=r1*v; %

for i=14:26
    r(:,i)=x1(:,i-13);
end

r=corr(r);

r12=r(13:24,1:2);

for i=13:24
    r13(:,1)=r(13:24,1);
    r13(:,2)=r(13:24,3);
end

for i=13:24
    r32(:,1)=r(13:24,3);
    r32(:,2)=r(13:24,2);
end

r123=r(13:24,1:3);

%First and Second PC
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


%Include the PCs in the plot
for i=1:length(r12)
    if i==1
        text(r12(i,1),r12(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')
    elseif i==2
        text(r12(i,1),r12(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    else
        text(r12(i,1),r12(i,2),strcat('X',int2str(i+2)),'FontSize',10,'FontWeight','bold')
    end
end


%Third and Second PC
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

%Include the PCs in the plot
for i=1:length(r32)
    if i==1
        text(r32(i,1),r12(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')
    elseif i==2
        text(r32(i,1),r32(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    else
        text(r32(i,1),r32(i,2),strcat('X',int2str(i+2)),'FontSize',10,'FontWeight','bold')
    end
end

%First and Third PC
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

%Include the PCs in the plot
for i=1:length(r13)
    if i==1
        text(r13(i,1),r13(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')
    elseif i==2
        text(r13(i,1),r13(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    else
        text(r13(i,1),r13(i,2),strcat('X',int2str(i+2)),'FontSize',10,'FontWeight','bold')
    end
end

%First, Second and Third PC
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



%Include the PCs in the plot
for i=1:length(r123)
    if i==1
        text(r123(i,1),r123(i,2),strcat('X',int2str(i)),'FontSize',10,'FontWeight','bold')
    elseif i==2
        text(r123(i,1),r123(i,2),strcat('X',int2str(i+1)),'FontSize',10,'FontWeight','bold')
    else
        text(r123(i,1),r123(i,2),strcat('X',int2str(i+2)),'FontSize',10,'FontWeight','bold')
    end
end

hold off

disp('Correlations of the first three PC�s with the original variables')
disp('      PC1      PC2        PC3')
disp(r123(2:end,:))
