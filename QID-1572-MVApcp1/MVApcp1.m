% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp1
% ---------------------------------------------------------------------
% Description:  Computes parallel coordinates plots for car data.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for car data.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

clear
close all
clc

load carc.txt
z=carc;
y=(z-(ones(74,1)*min(z)))./(ones(74,1)*(max(z)-min(z)+(max(z)==min(z))));

k=0;
l=0;
m=0;
for i=1:length(z)
    if z(i,13)==1
        k=k+1;
        us(k,:)=y(i,:);
    
    elseif z(i,13)==2
            l=l+1;
            japan(l,:)=y(i,:);
      
        elseif z(i,13)==3
                m=m+1;
                europe(m,:)=y(i,:);
    end
end

hold on

p1=plot(us','linewidth',1,'Color','r','LineStyle',':');
p2=plot(japan','linewidth',1,'Color','k','LineStyle','-');
p3=plot(europe','linewidth',1,'Color','b','LineStyle','--'); 
title('Parallel Coordinate Plot (Car Data)')

P1=hggroup;
P2=hggroup;
P3=hggroup;

set(p1,'Parent',P1)
set(p2,'Parent',P2)
set(p3,'Parent',P3)

set(get(get(P1,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); % Include this hggroup in the legend
set(get(get(P2,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); % Include this hggroup in the legend
set(get(get(P3,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); % Include this hggroup in the legend

legend('us','japan','europe','Location','SouthOutside','Orientation','horizontal')
hold off