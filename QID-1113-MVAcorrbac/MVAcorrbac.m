% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcorrbac
% ---------------------------------------------------------------------
% Description:  MVAcorrbac performs a correspondence analysis for the
%               baccalaureat data (bac.dat), shows the eigenvalues of
%               the singular value decomposition of the chi-matrix and
%               displays graphical its factorial decomposition.
%               Corresonds to example 14.4 in MVA.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Correspondence analysis for the baccalaureat data
%               (bac.dat), shows the eigenvalues of the singular
%               value decomposition of the chi-matrix and displays
%               graphically its factorial decomposition.
% ---------------------------------------------------------------------
% Example:      With Corsica and without Corsica
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

clear
clc
close all

%Choose whether or not to include Corsica in the analysis.
disp('Would you like to include Corsica? If yes please enter [Cors]=1, if no [Cors]=0')
disp(' ')
Cors=input('[Cors]=');

while length(Cors)<1
    disp('Please input choice.')
    disp(' ')
    Cors=input('[Cors]=');
end

while (Cors~=0 && Cors~=1)
    disp('Wrong input. Please correct')
    disp('')
    Cors=input('[Cors]=');
end

%Reading a file that does not contain only numerical data
x1 = textread('bac.dat','%s');

%Generating a vector of values
bac=str2double(x1);
k=1;
for i=2:length(bac)
    if or(bac(i)>0,bac(i)==0)
        y(k)=bac(i);
        k=k+1;
    end
end

%Generating the matrix form the vector
k=1;
j=1;
for i=1:length(y)
    x(k,j)=y(i);
    j=j+1;
    if mod(j,9)==0
        k=k+1;
        j=1;
    end
end

if Cors==0
    x=x(1:21,:);
end

a(1:length(x))=0;
for j=1:length(x)
    for i=1:8
        a(j)=a(j)+x(j,i);
    end
end

b(1:8)=0;
for j=1:length(x)
    for i=1:8
        b(i)=b(i)+x(j,i);
    end
end

e=a'*b/sum(a);

%Chi-matrix
cc=(x-e)./sqrt(e);


[g1,l1,d1]=svd(cc);

%Transforming the data so that the matrix is identical to the one in
%Explore. Obs: the 7-th column of the g matrix in Explore cannot be found
%in the Matlab g matrix
g2=g1(:,1:8);


g(:,1)=g2(:,1);
g(:,2)=-g2(:,2);
g(:,3)=g2(:,3);
g(:,4)=g2(:,4);
g(:,5)=g2(:,5);
g(:,6)=-g2(:,6);
g(:,7)=g2(:,8);
g(:,8)=-g2(:,7);

l=diag(l1)';

%Transforming the data so that the matrix is identical to the one in
%Explore
d(:,1)=d1(:,1);
d(:,2)=-d1(:,2);
d(:,3)=d1(:,3);
d(:,4)=d1(:,4);
d(:,5)=d1(:,5);
d(:,6)=-d1(:,6);
d(:,7)=d1(:,8);
d(:,8)=-d1(:,7);

%Eigenvalues and percentages
for i=1:8
    ll(i)=l(i)*l(i);
end
s=0;
for i=1:8
    s=s+ll(i);
end
cs(1)=ll(1);

for i=2:8
    cs(i)=cs(i-1)+ll(i);
end

aux=cs./s;
perc=[ll',aux'];

for i=1:8
    r1(:,i)=l(i)*g(:,i);
end
for i=1:length(x)
    r(i,:)=r1(i,:)/(sqrt(a(i))*(-1));
end

for i=1:8
    s1(:,i)=l(i)*d(:,i);
end


for i=1:8
    s1(i,:)=s1(i,:)/(sqrt(b(i))*(-1));
end

s=s1;

rr=r(:,1:2);
ss=s(:,1:2);

hold on
title('Baccalaureat Data');
xlabel('r_1,s_1');
ylabel('r_2,s_2');
line([-0.8 0.8],[0 0],'Color','k')
line([0 0],[0.8 -0.8],'Color','k')
set(gca,'box','on')

if Cors==0
    xlim([-0.25 0.25])
    ylim([-0.15 0.15])
else
    xlim([-0.25 0.35])
    ylim([-0.15 0.55])
end
if Cors==0
    regions=['ildf';'cham';'pica';'hnor';'cent';'bnor';'bour';'nopc';...
        'lorr';'alsa';'frac';'payl';'bret';'pcha';'aqui';'midi';'limo';...
        'rhoa';'auve';'laro';'prov'];
else
    regions=['ildf';'cham';'pica';'hnor';'cent';'bnor';'bour';'nopc';...
        'lorr';'alsa';'frac';'payl';'bret';'pcha';'aqui';'midi';'limo';...
        'rhoa';'auve';'laro';'prov';'cors'];

end

for i=1:length(x)
    text(rr(i,1),rr(i,2),regions(i,1:4),'Color','b','Fontsize',10);
end

modalities=['A';'B';'C';'D';'E';'F';'G';'H'];

for i=1:8
    text(ss(i,1),ss(i,2),modalities(i,1),'Color','r','Fontsize',12);
end

hold off








