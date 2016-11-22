%% clear all variables
clear
clc
close all

%% load data
x = load('pullover.dat');     

dat(:,1) = x(:,2); % extracts colum 2 
dat(:,2) = x(:,1); % extracts column 1

cv  = cov(dat); % compute var-cov matrix 
sxy = cv(2,1); % extracts covariance
sxx = cv(1,1); % extracts variance var 1

beta  = sxy/sxx;
alpha = mean(dat(:,2)) - beta*mean(dat(:,1));
y     = dat(:,2);
yhat  = alpha + beta * dat(:,1);


for i = 1:length(x)
    yquer(i) = mean(dat(:,2));
end

%% plot
% Generate line1
m = 1;
for i = 1:length(x)
        line1(m,1)   = dat(i,1);
        line1(m+1,1) = dat(i,1);
        line1(m+2,1) = dat(i,1);
        
        m = m+3;
end

m = 1;
for i = 1:length(x)
        line1(m,2)   = yquer(i);
        line1(m+1,2) = y(i);
        line1(m+2,2) = yhat(i);
        
        m = m+3;
end

%Generating line2
m = 1;
for i = 1:length(x)
        line2(m,1)   = dat(i,1)-0.3;
        line2(m+1,1) = dat(i,1)-0.3;
        line2(m+2,1) =dat(i,1)-0.3;
        m = m+3;
end

m = 1;
for i = 1:length(x)
        line2(m,2)   = yquer(i);
        line2(m+1,2) = y(i);
        line2(m+2,2) = yhat(i);
        
        m = m+3;
end

%Generating line3
m = 1;
for i = 1:length(x)
        line3(m,1)   = dat(i,1)+0.3;
        line3(m+1,1) = dat(i,1)+0.3;
        line3(m+2,1) = dat(i,1)+0.3;
        
        m = m+3;
end

m = 1;
for i = 1:length(x)
        line3(m,2)   = y(i);
        line3(m+1,2) = yhat(i);
        line3(m+2,2) = yquer(i);
        
        m = m+3;
end

t   = (round(min(dat(:,1)))-5):(round(max(dat(:,1))) +5);
fit = alpha + beta*t;

rl(:,1) = t;
rl(:,2) = fit;

aux  = mean(dat(:,2))*ones(length(t));
aux1 = aux(:,1);

ybar(:,1) = t;
ybar(:,2) = aux1;

hold on

%Blueline
blueline(1,:)  = line1(1,:);
blueline(2,:)  = line1(2,:);
blueline(3,:)  = line1(4,:);
blueline(4,:)  = line1(5,:);
blueline(5,:)  = line1(7,:);
blueline(6,:)  = line1(8,:);
blueline(7,:)  = line1(10,:);
blueline(8,:)  = line1(11,:);
blueline(9,:)  = line1(13,:);
blueline(10,:) = line1(14,:);
blueline(11,:) = line1(16,:);
blueline(12,:) = line1(17,:);
blueline(13,:) = line1(19,:);
blueline(14,:) = line1(20,:);
blueline(15,:) = line1(22,:);
blueline(16,:) = line1(23,:);
blueline(17,:) = line1(25,:);
blueline(18,:) = line1(26,:);
blueline(19,:) = line1(28,:);
blueline(20,:) = line1(29,:);

i = 1;
while i<length(blueline)
    line([blueline(i,1) blueline(i+1,1)],[blueline(i,2) blueline(i+1,2)],'Color','b','LineWidth',2,'LineStyle','--');
    i = i+2;
end

%Greenline
greenline(1,:)  = line2(1,:);
greenline(2,:)  = line2(3,:);
greenline(3,:)  = line2(4,:);
greenline(4,:)  = line2(6,:);
greenline(5,:)  = line2(7,:);
greenline(6,:)  = line2(9,:);
greenline(7,:)  = line2(10,:);
greenline(8,:)  = line2(12,:);
greenline(9,:)  = line2(13,:);
greenline(10,:) = line2(15,:);
greenline(11,:) = line2(16,:);
greenline(12,:) = line2(18,:);
greenline(13,:) = line2(19,:);
greenline(14,:) = line2(21,:);
greenline(15,:) = line2(22,:);
greenline(16,:) = line2(24,:);
greenline(17,:) = line2(25,:);
greenline(18,:) = line2(27,:);
greenline(19,:) = line2(28,:);
greenline(20,:) = line2(30,:);

i = 1;
while i<length(greenline)
    line([greenline(i,1) greenline(i+1,1)],[greenline(i,2) greenline(i+1,2)],'Color','g','LineWidth',2);
    i = i+2;
end

%Redline
redline(1,:)  = line3(1,:);
redline(2,:)  = line3(2,:);
redline(3,:)  = line3(4,:);
redline(4,:)  = line3(5,:);
redline(5,:)  = line3(7,:);
redline(6,:)  = line3(8,:);
redline(7,:)  = line3(10,:);
redline(8,:)  = line3(11,:);
redline(9,:)  = line3(13,:);
redline(10,:) = line3(14,:);
redline(11,:) = line3(16,:);
redline(12,:) = line3(17,:);
redline(13,:) = line3(19,:);
redline(14,:) = line3(20,:);
redline(15,:) = line3(22,:);
redline(16,:) = line3(23,:);
redline(17,:) = line3(25,:);
redline(18,:) = line3(26,:);
redline(19,:) = line3(28,:);
redline(20,:) = line3(29,:);

i = 1;
while i<length(redline)
    line([redline(i,1) redline(i+1,1)],[redline(i,2) redline(i+1,2)],'Color','r','LineWidth',2,'LineStyle','-.');
    i = i+2;
end

scatter(dat(:,1),dat(:,2),75,'k');
title('Pullover Data')
xlabel('Price (X2)')
ylabel('Sales (X1)')
xlim([88 102]);
ylim([162 198]);
line(rl(:,1),rl(:,2),'Color','k','LineWidth',2)
line(ybar(:,1),ybar(:,2),'Color','k','LineStyle','--','LineWidth',2)
hold off