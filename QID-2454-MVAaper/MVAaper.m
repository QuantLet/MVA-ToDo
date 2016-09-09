% -------------------------------------------------------------------------
% Book:         MVA
% -------------------------------------------------------------------------
% Quantlet:     MVAaper
% -------------------------------------------------------------------------
% Description:  MVAaper demonstrates ML discrimination rule and 
%               calculate the apparent error rate for swiss banknotes.
% -------------------------------------------------------------------------
% Usage:        -
% -------------------------------------------------------------------------
% Inputs:       none
% -------------------------------------------------------------------------
% Output:       Apparent error rate for swiss banknotes. 
% -------------------------------------------------------------------------
% Example:     
% -------------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% -------------------------------------------------------------------------

clear
clc 
close all

x=load('bank2.dat');
xg=x(1:100,:);
xf=x(101:200,:);

mg=mean(xg);
mf=mean(xf);
m=(mf+mg)/2;
s=(99*cov(xg)+99*cov(xf))/198;
alpha=inv(s)*(mg-mf)';

miss1=0;
for i=1:length(xg)
    if (xg(i,:)-m)*alpha<0
        miss1=miss1+1;
    end
end
miss2=0;
for i=1:length(xf)
    if (xf(i,:)-m)*alpha>0
        miss2=miss2+1;
    end
end

disp('Genuine banknotes classified as forged:')
disp(miss1)
disp('Forged banknotes classified as genuine:')
disp(miss2)
disp('APER (apparent error rate):')
aper=(miss1+miss2)/length(x);
disp(aper)