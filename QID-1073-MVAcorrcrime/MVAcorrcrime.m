% -------------------------------------------------------------------------
% Book:         MVA
% -------------------------------------------------------------------------
% Quantlet:     MVAcorrcrime
% -------------------------------------------------------------------------
% Description:  MVAcorrcrime performs a correspondence analysis for the US 
%               crime (uscrime.dat), shows the eigenvalues of the singular 
%               value decomposition of the chi-matrix and displays 
%               graphically its factorial decomposition.
% -------------------------------------------------------------------------
% Usage:        -
% -------------------------------------------------------------------------
% Inputs:       None
% -------------------------------------------------------------------------
% Output:       Correspondence analysis for the US crime(uscrime.dat), 
%               shows the eigenvalues of the singular value decomposition 
%               of the chi-matrix and displays graphically its factorial 
%               decomposition.
% -------------------------------------------------------------------------
% Example:      -
% -------------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron, Song
%               Song
% -------------------------------------------------------------------------

%Note: Matlab decomposes matrixes differently from Xplore, and
%hence some of the eigenvectors have different signs. This does not change
%the results, but it does change the order of the graph by inverting the
%axes around the origin (Not always, and not necessarily all of the axis;
%it depends on which eigenvectors we choose to plot)

clear
close all
clc

x1=load('uscrime.dat');
x=x1(:,3:9);
dim=size(x);

% Row sums
a(1:dim(1))=0;
for j=1:dim(1)
    for i=1:dim(2)
        a(j)=a(j)+x(j,i);
    end
end

% Column sums
b(1:dim(2))=0;
for j=1:dim(1)
    for i=1:dim(2)
        b(i)=b(i)+x(j,i);
    end
end

e=a'*b/sum(a);

cc=(x-e)./sqrt(e);             % Chi-matrix

[g,l1,d]=svd(cc);              % Singular value decomposition
l=diag(l1)';

ll=l.^2;
s=0;
for i=1:dim(2)
    s=s+ll(i);
end
cs(1)=ll(1);
for i=2:dim(2)
    cs(i)=cs(i-1)+ll(i);
end

aux=cs./s;
perc=[ll',aux']                 % Eigenvalues & percentages

for i=1:dim(2)
    r1(:,i)=l(i)*g(:,i);
end
for i=1:dim(1)
    r(i,:)=r1(i,:)/sqrt(a(i));
end

for i=1:dim(2)
    s1(:,i)=l(i)*d(:,i);
end

for i=1:dim(2)
    s1(i,:)=s1(i,:)/sqrt(b(i));
end
s=s1;

rr=r(:,1:2);
ss=s(:,1:2);

crime=['mur';'rap';'rob';'ass';'bur';'lar';'aut'];

for i=1:7
    text(ss(i,1),ss(i,2),crime(i,1:3),'Color','r','Fontsize',12);
end;

state=['ME';'NH';'VT';'MA';'RI';'CT';'NY';'NJ';'PA';'OH';'IN';'IL';'MI';...
    'WI';'MN';'IA';'MO';'ND';'SD';'NE';'KS';'DE';'MD';'VA';'VW';'NC';...
    'SC';'GA';'FL';'KY';'TN';'AL';'MS';'AR';'LA';'OK' ;'TX';'MT';'ID';...
    'WY';'CO';'NM';'AZ';'UT';'NV';'WA';'OR';'CA';'AK';'HI'];

for i=1:50
    text(rr(i,1),rr(i,2),state(i,1:2),'Color','b','Fontsize',10);
end;

title('US Crime Data');
xlabel('r_1,s_1');
ylabel('r_2,s_2');
xlim([-0.45 0.65])
ylim([-0.35 0.55])
set(gca,'box','on')

hold on
line([-0.8 0.8],[0 0],'Color','k')
line([0 0],[0.8 -0.8],'Color','k')