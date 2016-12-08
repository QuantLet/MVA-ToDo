%% clear all variables and console and close windows
clear
clc
close all

%% Drug data
zi = [1,0,1,0,1,0,0,0,0,21;
      1,0,1,0,0,1,0,0,0,32;
      1,0,1,0,0,0,1,0,0,70;
      1,0,1,0,0,0,0,1,0,43;
      1,0,1,0,0,0,0,0,1,19;
      1,0,0,1,1,0,0,0,0,683;
      1,0,0,1,0,1,0,0,0,596;
      1,0,0,1,0,0,1,0,0,705;
      1,0,0,1,0,0,0,1,0,295;
      1,0,0,1,0,0,0,0,1,99;
      0,1,1,0,1,0,0,0,0,46;
      0,1,1,0,0,1,0,0,0,89;
      0,1,1,0,0,0,1,0,0,169;
      0,1,1,0,0,0,0,1,0,98;
      0,1,1,0,0,0,0,0,1,51;
      0,1,0,1,1,0,0,0,0,738;
      0,1,0,1,0,1,0,0,0,700;
      0,1,0,1,0,0,1,0,0,847;
      0,1,0,1,0,0,0,1,0,336;
      0,1,0,1,0,0,0,0,1,196];
  
y = zi(:,10); % number of obs per cell

%% design matrix
I = 2; %  sex M - F
J = 2; %  drug Yes - No
K = 5; %  age category 16-29, 30-44, 45-64, 65-74, 75++
%
%%  Mean age per group: for Men and for Women
average = [23.2 36.5 54.3 69.2 79.5 23.2 36.5 54.3 69.2 79.5]';

%%   Design Matrix
X = [1   1    
     1   1  
     1   1 
     1   1      
     1   1     
     1  -1     
     1  -1      
     1  -1      
     1  -1      
     1  -1];

%%  Age
X        = [X  average];
[n,npar] = size(X);
df       = n-npar;

Xform = [];
for i=1:n
   temp = sprintf('%10.2f',X(i,:));
   Xform = [Xform;temp];
end

label = zi(:,3)==1;
n1jk  = y(label);
label = zi(:,3)==0;
n2jk  = y(label);
b0    = 0*ones(npar,1);

%% max likelihood in log-lin models
% y is the effective in each cell
% X*b is the expected value in cell if b is the current value
lnliklogist = @(b) -sum(n1jk.*log(ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b)))) - sum(n2jk.*log(ones(size(ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b))))-ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b))))

iter = 100;
opt  = [1 1e-2 1e-2 1e-4  0 0 0 0 0 0 0 0 0 iter 0 0 0 1];
[b,~] = fminsearch(lnliklogist,b0)
N     = sum(y)
p1    = ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b));
p2    = ones(size(n2jk))./(ones(size(n2jk))+exp(X*b));
nfit  = [(n1jk+n2jk).*p1 ;  (n1jk+n2jk).*p2];
nobs  = [n1jk ;n2jk];
e     = log(nobs)-log(nfit);

disp('degree of freedom')
disp(df)

G2     = 2*sum(nobs.*e)
pvalG2 = 1- chi2cdf(G2,df)
X2     = sum(((nobs-nfit).^2)./nfit)
pvalG2 = 1- chi2cdf(G2,df)

disp(' ')
disp('  observed    fitted')
disp('    values    values')
disp([nobs  nfit])
disp(' ')
disp('design matrix')
disp(Xform)

oddratfit = log(p1./p2);
oddrat    = log(n1jk./n2jk);

%% plot
figure(1)
hold on
plot(X(1:K,3),oddratfit(1:K),'-',X(K+1:2*K,3),oddratfit(K+1:2*K),'-',...
   X(1:K,3),oddrat(1:K),'*',X(K+1:2*K,3),oddrat(K+1:2*K),'o')
xlabel('Age category')
ylabel('log of odds-ratios')
hold off

%% calculate model with age*age
X = [1   1    
     1   1  
     1   1 
     1   1      
     1   1     
     1  -1     
     1  -1      
     1  -1      
     1  -1      
     1  -1];
 
%%  Age and Age^2
X = [X  average average.*average];

[n,npar] = size(X);
df2      = n-npar;

Xform = [];
for i=1:n
   temp  = sprintf('%10.2f',X(i,:));
   Xform = [Xform;temp];
end

label = zi(:,3)==1;
n1jk  = y(label);
label = zi(:,3)==0;
n2jk  = y(label);
b0    = 0*ones(npar,1);

%% max likelihood in log-lin models
% y is the effective in each cell
% X*b is the expected value in cell if b is the current value
lnliklogist = @(b) -sum(n1jk.*log(ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b)))) - sum(n2jk.*log(ones(size(ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b))))-ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b))))

iter  = 100;
opt   = [1 1e-2 1e-2 1e-4  0 0 0 0 0 0 0 0 0 iter 0 0 0 1];
[b,~] = fminsearch(lnliklogist,b0)
N     = sum(y)
p1    = ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b));
p2    = ones(size(n2jk))./(ones(size(n2jk))+exp(X*b));
nfit  = [(n1jk+n2jk).*p1 ;  (n1jk+n2jk).*p2];
nobs  = [n1jk ;n2jk];
e     = log(nobs)-log(nfit);

disp('degree of freedom')
disp(df2)

GG2     = 2*sum(nobs.*e)
pvalG2  = 1- chi2cdf(GG2,df2)
X2      = sum(((nobs-nfit).^2)./nfit)
pvalGG2 = 1- chi2cdf(GG2,df2)

disp(' ')
disp('  observed    fitted')
disp('    values    values')
disp([nobs  nfit])
disp(' ')
disp('design matrix')
disp(Xform)
oddratfit = log(p1./p2);
oddrat = log(n1jk./n2jk);

%% plot
figure(2)
hold on
plot(X(1:K,3),oddratfit(1:K),'-',X(K+1:2*K,3),oddratfit(K+1:2*K),'-',...
   X(1:K,3),oddrat(1:K),'*',X(K+1:2*K,3),oddrat(K+1:2*K),'o')
xlabel('Age category')
ylabel('log of odds-ratios')
hold off
overallG2     = G2-GG2
pvalG2        = 1- chi2cdf(overallG2,df-df2)
pvaloverallG2 = 1- chi2cdf(overallG2,df-df2)
