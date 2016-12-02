%% clear all variables
clear
close all
clc

%% load data
x = load('carc.txt');

frame = x(:,5:7); % extracts columns 5 to 7

m1 = mean(frame(:,1));
m2 = mean(frame(:,2));
m3 = mean(frame(:,3));

%% plot
hold on
line([0.775 1.225],[m1 m1],'Color','k','LineStyle',':','LineWidth',1.5)
line([1.775 2.225],[m2 m2],'Color','k','LineStyle',':','LineWidth',1.5)
line([2.775 3.225],[m3 m3],'Color','k','LineStyle',':','LineWidth',1.5)

bp = boxplot(frame,'Symbol','o','labels',{'headroom','rear seat','trunk space'});

set(bp(1:7,2),'LineWidth',1.5)
set(bp(1:6,[1,3]),'LineWidth',1.5)

title('Boxplot (Car Data)')
hold off