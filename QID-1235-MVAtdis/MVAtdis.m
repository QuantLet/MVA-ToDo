
%% clear variables and close windows
clear all
close all
clc

%% set input
xx = -5:0.1:5;

tpdf3  = pdf('T',xx,3);
tpdf6  = pdf('T',xx,6);
tpdf30 = pdf('T',xx,30);

tcdf3  = cdf('T',xx,3);
tcdf6  = cdf('T',xx,6);
tcdf30 = cdf('T',xx,30);

%% plot
subplot(1,2,1)
hold on
box on
plot(xx, tpdf3, 'Color','g','Linewidth',2.5)
plot(xx, tpdf6, 'Color','b','Linewidth',2.5)
plot(xx, tpdf30, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.40])
title('PDF of t-distribution')
legend('t3','t6','t30','Location','NorthWest')
hold off

subplot(1,2,2)
hold on
box on
plot(xx, tcdf3, 'Color','g','Linewidth',2.5)
plot(xx, tcdf6, 'Color','b','Linewidth',2.5)
plot(xx, tcdf30, 'Color','r','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,1])
title('CDF of t-distribution')
legend('t3','t6','t30','Location','NorthWest')
hold off
