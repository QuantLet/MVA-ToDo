%% clear all variables and console and close windows
clear
clc
close all

%% set directory
% cd('\\tsclient\D\Trabajo HU\AAA-MVA')

%% data import
data1 = load('XFGvolsurf01.dat');  % 1 month maturity data
data2 = load('XFGvolsurf02.dat');  % 2 months maturity data
data3 = load('XFGvolsurf03.dat');  % 3 months maturity data

%% sample covariance matrices
C          = cov(data1); 
C(:, :, 2) = cov(data2); 
C(:, :, 3) = cov(data3); 

K  = size(C,3);     % number of groups
P  = size(C, 1);    % number of variables

%% CPCA computation
L  = 15;            % number of iterations
B  = eye(P);
d1 = zeros(K, 1);
d2 = zeros(K, 1);
for l = 1:L
  for p = 1:(P - 1)
    for e = (p + 1):P
      Q = eye(2);
      M = eye(2);
      for k = 1:K
        H          = B(: ,[p, e]);
        T(:, :, k) = H' * C(:, :, k) * H;
        d1(k)      = Q(:, 1)' * T(:, :, k) * Q(:, 1);
        d2(k)      = Q(:, 2)' * T(:, :, k) * Q(:, 2);
        M          = M + (d1(k) - d2(k))/(d1(k) * d2(k)) * T(:, :, k);
      end
      [EigVec, EigVal] = eig(M);
      Q = EigVec;
      B(: ,[p, e]) = H * Q;
    end
  end
end

%% sort eigenvectors
NewB = [];
absi = abs(sum(B, 1));
while sum(absi) > -size(B,2)    
    maxi        = max(absi);
    index       = find(absi == maxi);    
    NewB        = [NewB B(:,index)];
    absi(index) = -1;
end

%% plot 
figure
set(gcf,'color','w')            % set the background color to white
plot(-NewB(:, 1), 'black', 'LineWidth', 5)
ylim([-0.8 0.8])
title('PCP for CPCA, 3 eigenvectors')
xlabel('moneyness')
ylabel('loading')
hold on
plot(NewB(:, 2), 'black', 'LineWidth', 3)
plot(-NewB(:, 3), 'black', 'LineWidth', 1)

%% test statistic
test = 0;
n    = [size(data1, 1), size(data2, 1), size(data3, 1)]; % number of observations per group
for k = 1:K
    lambda(:, :, k) = diag(diag(NewB' * C(:, :, k) * NewB));
    Sig(:, :, k)    = NewB * lambda(:, :, k) * NewB';
    test            = test + (n(k)-1) * det(Sig(:, :, k))/det(C(:, :, k));
end

%% p-value
df   = 1/2 * (K - 1) * P * (P - 1);
pval = 1 - chi2cdf(test, df);
