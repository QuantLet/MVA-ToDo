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

%%
S1 = cov(data1) * 1e+05;  % Sample covariance*10^5 of 1 month maturity data
S2 = cov(data2) * 1e+05;  % Sample covariance*10^5 of 2 months maturity data
S3 = cov(data3) * 1e+05;  % Sample covariance*10^5 of 3 months maturity data

S          = [S1; S2; S3];             % Combine data by rows
A          = S1;                                
A(:, :, 2) = S2;                       % Create a 3d array
A(:, :, 3) = S3;
n          = [253; 253; 253];          % Number of trading days in 1999
N          = n - 1;

preB    = 1e-10;          % Precision for maximum deviation of an element of matrix B
maxit   = 15;             % Maximal number of iteration
preQ    = 1e-10;          % Precision for maximum deviation of an element of matrix Q
maxiter = 10;             % Maximal number of iteration
p       = size(A, 1);     % Covariances are pxp
k       = size(A, 3);     % Number of groups
B       = eye(p);         % Initial value for B, the unit matrix
f       = 0;

%%
rep1 = true;
while (rep1)
  f    = f + 1;
  Bold = B;
  j    = 1;
  while (j <= p)
    m = 1;
    while (m < j) 
      Bmj        = [B(:, m), B(:, j)];
      T          = Bmj' * A(:, :, 1) * Bmj;
      T(:, :, 2) = Bmj' * A(:, :, 2) * Bmj;
      T(:, :, 3) = Bmj' * A(:, :, 3) * Bmj;  
      Q          = eye(2);  % orthogonal matrix to start with
      g          = 0;

      rep2 = true;
      while (rep2)
        g    = g + 1;
        Qold = Q;
        for ii = 1:k
            Delta1(:, :, ii) = Q .* T(:, :, ii) .* Q; 
            abcd(ii, :)      = diag(Delta1(:, :, ii))';
        end               
        d = N .* (abcd(:, 1) - abcd(:, 2))./(abcd(:, 1) .* abcd(:, 2));
        for iii = 1:k
            Tsum1(:, :, iii) = d(iii) * T(:, :, iii);
        end        
        f    = sum(Tsum1(1, 1, :));
        g    = sum(Tsum1(2, 1, :));
        h    = sum(Tsum1(1, 2, :));
        y    = sum(Tsum1(2, 2, :));
        Tsum = [f g; h y];

        [EigVec, EigVal] = eig(Tsum); 
        Q(:, 1)          = EigVec(:, 2);
        Q(:, 2)          = EigVec(:, 1);
        maxim            = max(max(abs(Q - Qold)));

        if ((maxim < preQ) || (g > maxiter)) 
          rep2 = false;
        end
      end      

      J       = eye(p);
      J(m, m) = Q(1, 1);
      J(m, j) = Q(1, 2);
      J(j, m) = Q(2, 1);
      J(j, j) = Q(2, 2);
      B       = B * J;
      m       = m + 1;
      disp(m)
    end
    j = j + 1;
  end
  maximum = max(max(abs(B - Bold)));
  if ((maximum < preB) || (f > maxit)) 
    rep1 = false;
  end
end

%%
a1b1c1 = [];
for i = 1:k
    lambda1(:, :, i) = B' .* A(:, :, i) .* B;
    lambda(:, :, i)  = diag(lambda1(:, :, i));
    a1b1c1           = [a1b1c1, lambda(:, :, i)];
end

%% Sort eigenvectors according to size of its corresponding eigenvalues
u   = [a1b1c1'; B];
us  = u';
us  = sortrows(us, 1);
uss = [];
for i = 1:p
    uss = [uss; us(p-i+1, :)] ;
end

B  = (uss(:, (k + 1):(k + p)))';
BB = (B(:, 1:k))';
 
%% plot
figure
set(gcf,'color','w') % set the background color to white
plot(BB(1, :), 'black', 'LineWidth', 4)
ylim([-1 1])
title('PCP for CPCA, 3 eigenvectors')
xlabel('moneyness')
ylabel('loading')
hold on
plot(BB(2, :), 'black', 'LineWidth', 3)
plot(BB(3, :), 'black', 'LineWidth', 2)


%% estimated population covariances
V            = diag(uss(:, 1));
V(:, :, 2)   = diag(uss(:, 2));
V(:, :, 3)   = diag(uss(:, 3));

psi          = B * V(:, :, 1) * B';
psi(:, :, 2) = B * V(:, :, 2) * B';
psi(:, :, 3) = B * V(:, :, 3) * B';
 
%% Test statistic
de   = [det(psi(:, :, 1)), det(psi(:, :, 2)), det(psi(:, :, 3))];
det  = [det(A(:, :, 1)), det(A(:, :, 2)), det(A(:, :, 3))];
test = 2 * log((n - 1)' * (de./det)');

%% P-value
df = 1/2 * (k - 1) * p * (p - 1)
t  = 1 - chi2cdf(test, df)  % falta mirar como es esto en Matlab
