%%clear all variables 
clear all
close all
clc
%% input parameters
n   = 200;
mu  = [3 2];
sig = [1   -1.5 ; -1.5  4];

[vector,value] = eig(sig); %Calculate Eigenvalues and Eigenvectors
ll = sqrt(value);
sh = vector*ll*vector';

nr = normrnd(0,1,n,size(sig,1));
y  = nr*sh';

for i = 1:length(sig)
    y(:,i) = y(:,i)+mu(i);
end

%% plot
hold on
subplot(1,2,1)
scatter(y(:,1),y(:,2),25,'k')
title('Normal sample')
xlabel('X1')
ylabel('X2')

%Contour ellipses
subplot(1,2,2)
ymin   = min(y);
yrange = max(y)-min(y);

ng(:,1:2) = 30;


% Constructing the grid
d    = yrange./(ng-1);
min1 = ymin(1,1);
m1   = min1;
min2 = ymin(1,2);
m2   = min2;


grid(1,1) = min1;
grid(1,2) = min2;

for i = 1:900
    
    if mod(i-1,30)==0
        min1      = m1;
        grid(i,1) = m1;
    else
        grid(i,1) = min1+d(1,1);
        min1      = min1+d(1,1);
    end;
    
    if mod(i-1,30)==0
        min2      = min2+d(1,2);
        grid(i,2) = min2;
    else
        grid(i,2) = min2;
    end;
    
end;

scatter(grid(:,1),grid(:,2));
for i=1:2
    diff(:,i) = (grid(:,i)-mu(i));
end
ff = diff*inv(sig);
ff = ff.*diff;
for i = 1:length(ff)
    f1(i) = -(ff(i,1)+ff(i,2));
end
f2=exp(f1/2);

f = f2/sqrt(det(2*pi*sig));

g = [grid,f'];

% Plotting the contours
j = 1;
k = 1;
for i = 1:900
    xx(j,k) = g(i,2);
    j       = j+1;
    if mod(i,30)==0
        j = 1;
        k = k+1;
    end
end

j = 1;
k = 1;
for i = 1:900
    yy(j,k) = g(i,1);
    j       = j+1;
    if mod(i,30)==0
        j = 1;
        k = k+1;
    end
end

j = 1;
k = 1;
for i = 1:900
    zz(j,k) = g(i,3);
    j       = j+1;
    if mod(i,30)==0
        j = 1;
        k = k+1;
    end
end

[C,h] = contour(xx,yy,zz,9);
title('Contour Ellipses')
xlabel('X2')
ylabel('X1')
view(90,-90)
hold off
