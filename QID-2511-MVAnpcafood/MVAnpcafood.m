% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcafood
% ---------------------------------------------------------------------
% Description:  MVAnpcafood performs a PCA for the standarized French 
%               food data ("food.dat") and shows the first two 
%               principal components in for the individuals and the 
%               variables. The normalization corresponds to that of 
%               Lebart/Morineau/Fenelon.
%               Need "rmask" function.
% ---------------------------------------------------------------------
% Usage:        MVAnpcafood
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Performs a PCA for the standarized French food data
%               ("food.dat") and shows the first two principal 
%               components in for the individuals and the variables. 
%               The normalization corresponds to that of 
%               Lebart/Morineau/Fenelon.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu,
%               Song Song
% ---------------------------------------------------------------------

[familytype,bread,vegetables,fruits,meat,poultry,milk,wine]=textread('food.dat','%s %f %f %f %f %f %f %f');
x=horzcat(bread,vegetables,fruits,meat,poultry,milk,wine);          % Horizontal concatenation, creates data matrix
[n p]=size(x);                                                      % Records dimensions of data matrix
m=mean(x);
x=(x-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x)/n),n,1);           % Standardizes the data matrix
a=(x*x')/n;
[gamma1 lambda1]=eig(a);

% Arranging eigenvalues and eigenvectors for output similar to XploRe
for i=1:12
    lambda(13-i) = lambda1(i,i);
end

gamma(:,1)=-gamma1(:,12);
gamma(:,2)=-gamma1(:,11);
gamma(:,3)=gamma1(:,10);
gamma(:,4)=-gamma1(:,9);
gamma(:,5)=gamma1(:,8);
gamma(:,6)=gamma1(:,7);
gamma(:,7)=gamma1(:,6);
gamma(:,8)=gamma1(:,5);
gamma(:,9)=gamma1(:,4);
gamma(:,10)=gamma1(:,3);
gamma(:,11)=-gamma1(:,2);
gamma(:,12)=gamma1(:,1);

for i=1:12
    w(i,1)=gamma(i,1)*sqrt(lambda(1));
    w(i,2)=gamma(i,2)*sqrt(lambda(2));
end;

line([-1.5 1],[0 0],'Color','k');
line([0 0],[-0.6 1],'Color','k');

namew=['MA2'
       'EM2'
       'CA2'
       'MA3'
       'EM3'
       'CA3'
       'MA4'
       'EM4'
       'CA4'
       'MA5'
       'EM5'
       'CA5'];

namez=['bread     '
       'vegetables'
       'fruit     '
       'meat      '
       'poultry   '
       'milk      '
       'wine      '];
   
figure(1);
hold on
title('French Food Data');
xlabel('First Factor - Families');
ylabel('Second Factor - Families');
for i=1:12
    text(w(i,1),w(i,2),namew(i,1:3));
end;  
line([w(1,1) w(2,1)],[w(1,2) w(2,2)],'Color','k','LineStyle',':');
line([w(2,1) w(3,1)],[w(2,2) w(3,2)],'Color','k','LineStyle',':');
line([w(1,1) w(4,1)],[w(1,2) w(4,2)],'Color','k','LineStyle',':');
line([w(2,1) w(5,1)],[w(2,2) w(5,2)],'Color','k','LineStyle',':');
line([w(4,1) w(5,1)],[w(4,2) w(5,2)],'Color','k','LineStyle',':');
line([w(5,1) w(6,1)],[w(5,2) w(6,2)],'Color','k','LineStyle',':');
line([w(6,1) w(9,1)],[w(6,2) w(9,2)],'Color','k','LineStyle',':');
line([w(8,1) w(9,1)],[w(8,2) w(9,2)],'Color','k','LineStyle',':');
line([w(5,1) w(8,1)],[w(5,2) w(8,2)],'Color','k','LineStyle',':');
line([w(7,1) w(8,1)],[w(7,2) w(8,2)],'Color','k','LineStyle',':');
line([w(4,1) w(7,1)],[w(4,2) w(7,2)],'Color','k','LineStyle',':');
line([w(7,1) w(10,1)],[w(7,2) w(10,2)],'Color','k','LineStyle',':');
line([w(10,1) w(11,1)],[w(10,2) w(11,2)],'Color','k','LineStyle',':');
line([w(8,1) w(11,1)],[w(8,2) w(11,2)],'Color','k','LineStyle',':');
line([w(11,1) w(12,1)],[w(11,2) w(12,2)],'Color','k','LineStyle',':');
line([w(9,1) w(12,1)],[w(9,2) w(12,2)],'Color','k','LineStyle',':');
hold off

b=(x'*x)/n;
[gam1 lamb1]=eig(b);

%Arranging eigenvalues and eigenvectors for output similar to XploRe
for i=1:7
    lamb2(8-i) = lamb1(i,i);
end
lamb=lamb2(1:7);
gam(:,1)=-gam1(:,7);
gam(:,2)=gam1(:,6);
gam(:,3)=gam1(:,5);
gam(:,4)=-gam1(:,4);
gam(:,5)=-gam1(:,3);
gam(:,6)=gam1(:,2);
gam(:,7)=-gam1(:,1);

for i=1:7
    z(i,1)=-gam(i,1)*sqrt(lamb(1));
    z(i,2)=-gam(i,2)*sqrt(lamb(2));
end;

figure(2);
hold on
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
circle = rsmak('circle');
fnplt(circle)
title('French Food Data');
xlabel('First Factor - Goods');
ylabel('Second Factor - Goods');
xlim([-1.2 1.2]);
ylim([-1.2 1.2]);
for i=1:7
    text(z(i,1),z(i,2),namez(i,1:10));
end;  
hold off


