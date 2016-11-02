% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAboxcar
% ---------------------------------------------------------------------
% Description:  MVAboxcar computes Boxplots for the mileage (Variable 14) 
%               of US, Japanese and European cars from carc.dat, 
%               respectively.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Boxplots for the mileage (Variable 14) of US, Japanese 
%               and European cars from carc.dat,respectively.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

close all 
clear
clc

load carc.txt
%[model,P,M,R78,R77,H,R,Tr,W,L,T,D,G,C]=textscan('carc.txt','%s %f %f %f %f %f %f %f %f %f %f %f %f %f','emptyvalue',NaN);
x=carc;
x
k=0;
l=0;
m=0;
M=carc(:,2);
C=carc(:,13);
for i=1:length(x)
    if x(i,13)==1
        k=k+1;
        us(k,:)=x(i,:);
    elseif x(i,13)==2
            l=l+1;
            japan(l,:)=x(i,:);
        elseif x(i,13)==3
                m=m+1;
                europe(m,:)=x(i,:);
    end
end
m1=mean(us(:,2))
m2=mean(japan(:,2))
m3=mean(europe(:,2))
hold on
line([0.775 1.225],[m1 m1],'Color','k','LineStyle',':','LineWidth',1.2)
line([1.775 2.225],[m2 m2],'Color','k','LineStyle',':','LineWidth',1.2)
line([2.775 3.225],[m3 m3],'Color','k','LineStyle',':','LineWidth',1.2)
boxplot(M,C,'Symbol','o','labels',{'US','JAPAN','EU'})  
title('Car Data')
five=quantile(x(:,2),[.025 .25 .50 .75 .975]);
five