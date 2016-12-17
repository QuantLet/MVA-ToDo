%% clear all variables and console and close windows
clear
clc
close all

%% Choose whether or not to include Corsica in the analysis.
disp('Would you like to include Corsica? If yes please enter [Cors]=1, if no [Cors]=0')
disp(' ')
Cors=input('[Cors]=');

while length(Cors)<1
    disp('Please input choice.')
    disp(' ')
    Cors=input('[Cors]=');
end

while (Cors~=0 && Cors~=1)
    disp('Wrong input. Please correct')
    disp('')
    Cors=input('[Cors]=');
end

%% load data
formatSpec = '%s%f%f%f%f%f%f%f%f';
data       = readtable('bac.dat', 'ReadVariableNames', false, 'Format', formatSpec);
x          = data;
x.Var1     = [];
x          = table2array(x);

if Cors==0
    x = x(1:end-1, :);
end

a = sum(x, 2);
b = sum(x);
e = a * b/sum(a);

%% Chi-matrix
cc = (x - e)./sqrt(e);

[g1,l1,d1] = svd(cc);

g = g1(:, 1:8);
d = d1;

l = diag(l1)';

%% Eigenvalues and percentages
ll   = l.*l;
aux  = cumsum(ll)./sum(ll);
perc = [ll', aux'];
r1   = repmat(l, length(g), 1).*g;       % multiplies each column of g with each corresponding element of l
r    = r1./repmat(sqrt(a), 1, 8)*(-1);   % divides each row of r1  with each corresponding element of sqrt(a)
s1   = repmat(l, length(d), 1).*d;       % multiplies each column of d with each corresponding element of l
s    = s1./repmat(sqrt(b)', 1, 8)*(-1);  % divides each row of s1  with each corresponding element of sqrt(b)

rr = r(:, 1:2);
ss = s(:, 1:2);

%% plot
hold on
title('Baccalaureat Data');
xlabel('r_1,s_1');
ylabel('r_2,s_2');
line([-0.8 0.8], [0 0], 'Color', 'k')
line([0 0], [0.8 -0.8], 'Color', 'k')
set(gca, 'box', 'on')

if Cors==0
    xlim([-0.25 0.25])
    ylim([-0.15 0.15])
else   
    xlim([-0.25 0.35])
    ylim([-0.5 0.2])
end

% labels of the regions
if Cors==0
    regions = char(data.Var1(1:end-1));
else
    regions = char(data.Var1);
end

text(rr(:, 1), rr(:, 2), regions, 'Color', 'b', 'Fontsize', 10)

modalities = ['A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'];

text(ss(:, 1), ss(:, 2), modalities, 'Color', 'r', 'Fontsize', 12);
hold off
