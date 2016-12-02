%% clear all variables
clear
close all
clc

%% load data
x     = load('carc.txt');
frame = x;
n     = size(frame,1);

%% standarize data
minf  = ones(n,1)*min(frame); % matrix of min values
maxf  = ones(n,1)*max(frame); % matrix of max values
equal = ones(n,1)*(max(frame)==min(frame)); %  equals 1 if true so that denominator is never equal zero

frame = (frame - minf)./(maxf - minf + equal);

%% plot
k = 0;
l = 0;
m = 0;

for i = 1:length(x)
    if x(i,13) == 1
        k = k + 1;
        us(k,:) = frame(i,:);
    
    elseif x(i,13) == 2
            l = l + 1;
            japan(l,:) = frame(i,:);
      
        elseif x(i,13) == 3
                m = m + 1;
                europe(m,:) = frame(i,:);
    end
end

hold on

p1 = plot(us','linewidth',1,'Color','r','LineStyle',':')
p2 = plot(japan','linewidth',1,'Color','k','LineStyle','-')
p3 = plot(europe','linewidth',1,'Color','b','LineStyle','--')
title('Parallel Coordinate Plot (Car Data)')

P1 = hggroup;
P2 = hggroup;
P3 = hggroup;

set(p1,'Parent',P1)
set(p2,'Parent',P2)
set(p3,'Parent',P3)

set(get(get(P1,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on') % Include this hggroup in the legend
set(get(get(P2,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on') % Include this hggroup in the legend
set(get(get(P3,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on') % Include this hggroup in the legend

legend('us','japan','europe','Location','SouthOutside','Orientation','horizontal')
hold off