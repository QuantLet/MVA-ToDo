% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAlinregbh
% ---------------------------------------------------------------------
% Description:  Linear regression for the complete transformed Boston 
%               housing data.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Linear regression for the complete transformed Boston 
%               housing data.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Till Grossmass, Jorge Patron,
%               Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x=load('bostonh.dat'); 

xt=x;

%Transformations
xt(:,1)=log(x(:,1));
xt(:,2)=x(:,2)/10;
xt(:,3)=log(x(:,3));
xt(:,5)=log(x(:,5));
xt(:,6)=log(x(:,6));
xt(:,7)=(x(:,7).^(2.5))/10000;
xt(:,8)=log(x(:,8));
xt(:,9)=log(x(:,9));
xt(:,10)=log(x(:,10));
xt(:,11)=exp(0.4*x(:,11))/1000;
xt(:,12)=x(:,12)/100;
xt(:,13)=sqrt(x(:,13));
xt(:,14)=log(x(:,14));

Z = [ones(size(xt(:,1))) xt(:,1) xt(:,2) xt(:,3) xt(:,4) xt(:,5) xt(:,6) xt(:,7) xt(:,8) xt(:,9) xt(:,10) xt(:,11) xt(:,12) xt(:,13)]; 
y = xt(:,14);

[m n]=size(Z);
df = m-n;
b = inv(Z'*Z)*Z'*y; 
yhat = Z*b;
r = y - yhat;
mse = r'*r./df;
covar = inv(Z'*Z).*mse;
se = sqrt(diag(covar));
t = b./se;
t2 = abs(t);
k = t2.^2./(df + t2.^2);
p = 0.5.*(1+sign(t2).*betainc( k, 0.5, 0.5*df)) ;
Pvalues = 2*(1-p);

tablex(:,1)
for i=1:n 
      tablex(i,1)=b(i);
      tablex(i,2)=se(i);
      tablex(i,3)=t(i);
      tablex(i,4)=Pvalues(i);
end

disp('Table with coefficient estimates, Standard error, value of the t-statistic and ');
disp('p-value (for the intercept (first line) and the 13 variables (lines 2 to 14))');
tablex
