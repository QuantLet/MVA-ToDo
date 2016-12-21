%% clear all variables and console and close windows
clear
clc
close all

%% load data
formatSpec = '%{yyyy-MM-dd}D%f%f%f%f%f%f';
ibm        = readtable('ibm.csv', 'Delimiter', ',', 'Format', formatSpec);
apple      = readtable('apple.csv', 'Delimiter', ',', 'Format', formatSpec);
bac        = readtable('bac.csv', 'Delimiter', ',', 'Format', formatSpec);
ford       = readtable('ford.csv', 'Delimiter', ',', 'Format', formatSpec);
ed         = readtable('ed.csv', 'Delimiter', ',', 'Format', formatSpec);
ms         = readtable('ms.csv', 'Delimiter', ',', 'Format', formatSpec);

%% sort data by date
ibm   = sortrows(ibm, 'Date', 'ascend');
apple = sortrows(apple, 'Date', 'ascend');
bac   = sortrows(bac, 'Date', 'ascend');
ford  = sortrows(ford, 'Date', 'ascend');
ed    = sortrows(ed, 'Date', 'ascend');
ms    = sortrows(ms, 'Date', 'ascend');
    
%% compute the returns for IBM
y1 = table2array(ibm(:, 5));
x1 = diff(y1) ./ y1(2:end);

%% compute the returns for Apple
y2 = table2array(apple(:,5));
x2 = diff(y2) ./ y2(2:end);

%% compute the returns for Bank of America Corporation
y3 = table2array(bac(:,5));
x3 = diff(y3) ./ y3(2:end);
	
%% compute the returns for Forward Industries
y4 = table2array(ford(:,5));
x4 = diff(y4) ./ y4(2:end);

%% compute the returns for Consolidated Edison
y5 = table2array(ed(:,5));
x5 = diff(y5) ./ y5(2:end);

%% compute the returns for Morgan Stanley
y6 = table2array(ms(:,5));
x6 = diff(y6) ./ y6(2:end);

Date  = ibm.Date(2:end);
NAMES = ['IBM                '; 'Apple              ';
         'BAC                '; 'Forward Industries ';
         'Consolidated Edison'; 'Morgan Stanley     '];
xx    = [x1, x2, x3, x4, x5, x6];

%% plot
figure(1)
for i = 1:6
    subplot(3, 2, i)
    plot(Date, xx(:,i), 'LineWidth', 1.2)
    ylim([-1.5, 1.5])
    title(NAMES(i, :))
end
