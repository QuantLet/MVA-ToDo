%% clear variables and close windows 
 clear
 clc 
 close all

 %% load data
 x = load('bank2.dat'); 
 z = x(96:105,:);                                      % extracts observations 96-105
 s = size(z);
 
 minz   = repmat(min(z),s(1,1),1);
 maxmin = repmat(max(z)-min(z),s(1,1),1);
 
 z1 = (z-minz)./(maxmin);                               % standardizes the data     
 z2 = z1(:,[6;5;4;3;2;1]); 
 
 zgen = z2(1:5,:);
 zcou = z2(6:10,:);
 
%% plot
 hold on
 andrewsplot(zgen,'LineWidth',1.5,'Color','k')      
 andrewsplot(zcou,'LineWidth',1.5,'Color','r','Linestyle',':')
 title('Andrews curves (Bank data)')
 hold off
