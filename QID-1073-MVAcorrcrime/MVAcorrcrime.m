%% clear all variables and console and close windows
clear
clc
close all

%% load data
x1  = load('uscrime.dat');
x   = x1(:, 3:9);
dim = size(x);

a = sum(x, 2);  % Row sums
b = sum(x);     % Column sums
e = a * b/sum(a);

cc = (x - e)./sqrt(e);    % Chi-matrix

[g1, l1, d] = svd(cc);     % Singular value decomposition

g  = g1(:, 1:dim(2));
l  = diag(l1)';
ll = l.^2;

aux  = cumsum(ll)./sum(ll);
perc = [ll', aux'];                      % Eigenvalues & percentages
r1   = repmat(l, dim(1), 1).*g;          % multiplies each column of g with each corresponding element of l
r    = r1./repmat(sqrt(a), 1, dim(2));   % divides each row of r1  with each corresponding element of sqrt(a)
s1   = repmat(l, dim(2), 1).*d;          % multiplies each column of d with each corresponding element of l
s    = s1./repmat(sqrt(b)', 1, dim(2));  % divides each row of s1  with each corresponding element of sqrt(b)

rr = r(:, 1:2);
ss = s(:, 1:2);

crime=['mur'; 'rap'; 'rob'; 'ass'; 'bur'; 'lar'; 'aut'];

text(ss(:,1), ss(:,2), crime,'Color','r','Fontsize',12);

state = ['ME'; 'NH'; 'VT'; 'MA'; 'RI'; 'CT'; 'NY'; 'NJ'; 'PA'; 'OH'; 
         'IN'; 'IL'; 'MI'; 'WI'; 'MN'; 'IA'; 'MO'; 'ND'; 'SD'; 'NE';
         'KS'; 'DE'; 'MD'; 'VA'; 'VW'; 'NC'; 'SC'; 'GA'; 'FL'; 'KY';
         'TN'; 'AL'; 'MS'; 'AR'; 'LA'; 'OK'; 'TX'; 'MT'; 'ID'; 'WY';
         'CO'; 'NM'; 'AZ'; 'UT'; 'NV'; 'WA'; 'OR'; 'CA'; 'AK'; 'HI'];

text(rr(:,1), rr(:,2), state, 'Color', 'b', 'Fontsize', 10)

title('US Crime Data');
xlabel('r_1,s_1');
ylabel('r_2,s_2');
xlim([-0.45 0.65])
ylim([-0.35 0.55])
set(gca,'box','on')
hold on
line([-0.8 0.8], [0 0], 'Color', 'k')
line([0 0], [0.8 -0.8], 'Color', 'k')
