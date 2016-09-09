% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdecofood
% ---------------------------------------------------------------------
% Description:  MVAdecofood computes a spectral decomposition of the 
%               French food data and gives a repesentation of food 
%               expenditures and family types in two dimensions.       
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Spectral decomposition of the French food data and 
%               repesentation of food expenditures and family types 
%               in two dimensions.      
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu,  
%               Song Song
% ---------------------------------------------------------------------

%Note: Matlab decomposes matrixes differently from Xplore(MVA book), and
%hence some of the eigenvectors have different signs. This does not change
%the results, but it does change the order of the graph by inverting the
%axes around the origin (Not always, and not necessarily all of the axis;
%it depends on which eigenvectors we choose to plot)

clear
clc
close all

[familytype,bread,vegetables,fruits,meat,poultry,milk,wine]=textread('food.dat','%s %f %f %f %f %f %f %f');
food=horzcat(bread,vegetables,fruits,meat,poultry,milk,wine); % Horizontal concatenation, creates data matrix

n=length(food);
p=7;
h=diag(ones(n,1))-ones(n,n)./n;  % Centering Matrix
y=mean(food); 
a=food-repmat(y,n,1);            % Substracts mean
d=diag(1./sqrt(sum(a.*a)'/n));   
xs=h*food*d;
xs=xs./sqrt(n);
xs2=xs'*xs;
[gamma lambda1]=eigs(xs2,p,'la');    % Eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
lambda=(lambda1*ones(p,1))';         % Turns Eigenvalue matrix into a row vector 
w1=gamma.*sqrt(repmat(lambda,p,1));  % coordinates of food
w=w1(:,1:2);                         % Two eigenvectors with highest eigenvalues

z1=xs*gamma;         % coordinates of families
z1=sqrt(n/p).*z1;    % xs' scaled by square root of p 
z=z1(:,1:2); 

namew=['bread'
       'veget'
       'fruit'
       'meat '
       'poult'
       'milk '
       'wine '];
          
namez=['ma2'
       'em2'
       'ca2'
       'ma3'
       'em3'
       'ca3'
       'ma4'
       'em4'
       'ca4'
       'ma5'
       'em5'
       'ca5'];


%Food
subplot(2,2,1);
hold on
title('Food');
xlabel('W[.1]');
ylabel('W[.2]');
xlim([-1.2 0.8]);
ylim([-1 0.5]);

line([-1.2 0.8],[0 0],'Color','k');
line([0 0],[1 -1],'Color','k');

for i=1:7
    text(w(i,1),w(i,2),namew(i,1:5),'FontSize',7);
end;       

%Families
subplot(2,2,2);
hold on
title('Families');
xlabel('Z[.1]');
ylabel('Z[.2]');
xlim([-2 2]);
ylim([-1.2 1]);

line([-2 2],[0 0],'Color','k');
line([0 0],[-1 1.5],'Color','k');

for i=1:12
    text(z(i,1),z(i,2),namez(i,1:3),'FontSize',7);
end;  

%Details Food
subplot(2,2,3);
axis off
for i=1:7
    text(0,1-0.1*i,namew(i,1:5))
    w1=num2str(w(i,1),'%10.5f');
    w2=num2str(w(i,2),'%10.5f');
    if w(i,1)<0
        text(0.38,1-0.1*i,w1)
    else
        text(0.4,1-0.1*i,w1)
    end
    if w(i,2)<0
        text(0.78,1-0.1*i,w2)
    else
        text(0.8,1-0.1*i,w2)
    end
end

%Details Families
subplot(2,2,4);
axis off
for i=1:12
    text(0,1-0.1*i,namez(i,1:3))
    z1=num2str(z(i,1),'%10.5f');
    z2=num2str(z(i,2),'%10.5f');
    if z(i,1)<0
        text(0.38,1-0.1*i,z1)
    else
        text(0.4,1-0.1*i,z1)
    end
    if z(i,2)<0
        text(0.78,1-0.1*i,z2)
    else
        text(0.8,1-0.1*i,z2)
    end
end