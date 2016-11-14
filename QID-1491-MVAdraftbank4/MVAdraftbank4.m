%% clear variables and close windows
close all 
clear
clc

%% load data
x     = load('bank2.dat');
x3456 = x(:,3:6);

%% plot
for i = 1:4

    for j = 1:i-1
        
        subplot(4,4,(i-1)*4+j)
        plot(x3456(1:100,j),x3456(1:100,i),'ob','MarkerSize',4);
        hold on
        plot(x3456(101:200,j),x3456(101:200,i),'*r','MarkerSize',4);
        axis off

    end
        

    for j = i+1:4
      
        subplot(4,4,(i-1)*4+j)
        [f1,xi1] = ksdensity(x3456(:,j));
        [f2,xi2] = ksdensity(x3456(:,i));
        contour(f1'*f2,10,'LineWidth',3)
        axis off
        
    end

end

subplot(4,4,1)
axis off
text(0.3,0.5,'VAR 3')
subplot(4,4,6)
axis off
text(0.3,0.5,'VAR 4')

subplot(4,4,11)
axis off
text(0.3,0.5,'VAR 5')

subplot(4,4,16)
axis off
text(0.3,0.5,'VAR 6')

hold off
