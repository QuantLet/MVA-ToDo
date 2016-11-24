%% Clear variables and close windows
clear all;
close all;
clc;

%% set input
%Tail comparison of t-distribution
xx = -6:0.01:6;

gausspdf = normpdf(xx);

tpdf1  = pdf('T',xx,1);
tpdf3  = pdf('T',xx,3);
tpdf9  = pdf('T',xx,9);
tpdf45 = pdf('T',xx,45);
%% plot
hold on
box on

plot(xx, tpdf1, 'Color','k','Linewidth',2.5)
plot(xx, tpdf3, 'Color','b','Linewidth',2.5)
plot(xx, tpdf9, 'Color','r','Linewidth',2.5)
plot(xx, tpdf45, 'Color','m','Linewidth',2.5)
plot(xx, gausspdf,'Color','c','Linewidth',2.5)
xlabel('X')
ylabel('Y')
ylim([0,0.04])
xlim([2.5,4])
title('Tail comparison of t-distribution')
legend('t1','t3','t9','t45','Gaussian','Location','NorthEast')
hold off
