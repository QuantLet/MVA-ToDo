% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcondnorm
% ---------------------------------------------------------------------
% Description:  MVAcondnorm computes conditonal normal densities f(x2|x1) 
%               where the joint distribution has mean=(0|0) and
%               cov=(1|-0.8)~(-0.8|2).
%               Corresponds to Example 5.1 in MVA.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the conditional mean of (x2|x1) and the shifted 
%               conditonal normal densities f(x2|x1). 
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

clear
clc
close all

c=sqrt(1.36);
k=0;
l=-10;
i=0;

while i<=2100
   i=i+1; 
   k=k+1;
   x(i,2)=l;
   if mod(k,7)==0 
       k=0;
       l=l+0.05;
   end
end

i=0;
l=0;
while i<=2100
   i=i+1; 
   x(i,1)=l;
   l=l+0.75;
   if mod(i,7)==0 
       l=0;
   end
end

f=normpdf(0,(x(:,2)+0.8*x(:,1))/c,1)/c;
x1=[x,f];

l=0;
i=1;

hold on

xlim([-2 6])
title('Conditional Normal Densities f(X2|X1)');
for k=1:7
        while l<2100    
            plot3(x1(i+l,1),x1(i+l,2),x1(i+l,3),'LineStyle','.','Color','k')
            l=l+7;
        end
        i=k+1;
        l=0;
        view(30,-20)
end

%Conditional means
xm=x(1:7,1);
m=[xm, -0.8*xm, zeros(7,1)];
xm1=-2;
xm2=6;
xmf=[xm1;xm;xm2];

%Line through conditional means
plot(m(:,1),m(:,2),'Marker','x','MarkerSize',10,'Color','r','LineWidth',2);
line(xmf,-0.8*xmf,'Color','k','LineWidth',2);

hold off