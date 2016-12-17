%% clear all variables and console and close windows
clear
clc
close all

%% load data
x = load('journaux.dat');

a = sum(x, 2);
b = sum(x);
e = a * b/sum(a);

% Chi-matrix
cc = (x - e)./sqrt(e);

[g1, l1, d1] = svd(cc);

% change the sign of some columns in g and d. This is done to get the same
% results as R.
g            = g1(:,1:10)
g(:,[2:4 9]) = -g(:,[2:4 9]);
l            = diag(l1)';
d            = d1;
d(:,[2:4 9]) = -d(:,[2:4 9]);

ll = l.*l;

aux  = cumsum(ll)./sum(ll);
perc = [ll',aux'];
r1   = repmat(l, 15 ,1).*g;         % multiplies each column of g with each corresponding element of l
r    = r1./repmat(sqrt(a), 1, 10);  % divides each row of r1  with each corresponding element of sqrt(a)
s1   = repmat(l, 10, 1).*d;         % multiplies each column of d with each corresponding element of l
s    = s1./repmat(sqrt(b)', 1, 10); % divides each row of s1  with each corresponding element of sqrt(b)

rr = r(:,1:2);
ss = s(:,1:2);

% names of the labels in graph
types   = ['va'; 'vb'; 'vc'; 'vd'; 've'; 'ff'; 'fg'; 'fh'; 'fi'; 'bj';
           'bk'; 'bl'; 'vm'; 'fn'; 'fo'];
regions = ['brw'; 'bxl'; 'anv'; 'brf'; 'foc'; 'for'; 'hai'; 'lig'; 
           'lim'; 'lux'];

hold on
text(rr(:,1), rr(:,2), types, 'Color', 'b', 'FontSize',12)
text(ss(:,1), ss(:,2), regions, 'Color', 'r', 'FontSize',10);
set(gca,'box','on')
line([-1.5 1.5], [0 0], 'Color', 'k')
line([0 0], [0.6 -1.4], 'Color', 'k')
xlim([-1.1 1.5])
ylim([-1.1 0.6])
title('Journal Data')
xlabel('r_1, s_1')
ylabel('r_2, s_2')
