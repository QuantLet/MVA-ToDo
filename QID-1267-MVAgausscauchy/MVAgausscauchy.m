%% clear variables and close windows
clear all
close all
clc

%% set input
seq    = -6:0.02:6;
cauchy = seq*trnd(1,1); 
fhat   = 1./pi./(1 + cauchy.^2);
% Plot the Cauchy density
hold on
plot(seq, fhat, 'r', 'Linewidth',3);
ylim([0,0.45])
ylabel('Y');
xlabel('X');

%% Plot the standard normal density
plot(seq,normpdf(0,seq),'b','Linewidth',3);

line([-2,-2],[0,0.5],'Color','k', 'Linewidth',2)
line([-1,-1],[0,0.5],'Color','k', 'Linewidth',2)
line([1,1],[0,0.5],'Color','k', 'Linewidth',2)
line([2,2],[0,0.5],'Color','k', 'Linewidth',2)

text(-2,0.4,'-2f')
text(-1,0.4,'-1f')
text(1,0.4, '1f')
text(2,0.4, '2f')
legend('cauchy','gauss')

title('Distribution Comparison')
hold off
