
clear
clc
close all
disp('Please input n, rho as: [200,0.5]') ;
disp('Feel free to vary nu between 1 and 0 to see the different effects')
disp(' ') ;
para=input('[n, roh]=');
disp(' ');
disp('Please input sig as: [1 0.5; 0.5 1]') ;
disp(' ') ;
sig=input('[sig]=');
n=para(1);
rho=para(2);
[vector,value] = eig(sig);
ll = sqrt(value);
sh = vector*ll*vector';
nr = normrnd(0,1,n,size(sig,1));
x = nr*sh';
v(:,1)=vector(:,2);
v(:,2)=-vector(:,1);
direction1=v(:,1);
direction2=v(:,2);
norm=[direction1'*direction1 direction1'*direction1];
direction1=direction1./sqrt(norm(1));
direction2=direction2./sqrt(norm(2));
pd1=sort(x*direction1);  % give the magnitude
d31=pd1*direction1';      % "direction" controls the direction
pd2=sort(x*direction2);  % give the magnitude
d32=pd2*direction2';      % "direction" controls the direction
d4(:,1)=x(:,1);
d4(:,2)=0;
d5(:,1)=x(:,2);
d5(:,2)=0;
subplot(3,1,1,'FontSize',16,'FontWeight','bold');
hold on
title('Direction in Data');
scatter(x(:,1),x(:,2),'k');
plot(d31(:,1),d31(:,2),'r','LineWidth',2);
hold off
subplot(3,1,2,'FontSize',16,'FontWeight','bold');
hold on
scatter(d4(:,1),d4(:,2),'k');
title('Projection');
subplot(3,1,3,'FontSize',16','FontWeight','bold');
varexp=var(pd1);
varsum=sum(var(x)');
varperc=varexp/varsum;
axis off
text(0,0.7,'Explained variance','FontSize',16,'FontWeight','bold');
w=num2str(varexp,'%10.5f');
text(0.6,0.7,w,'FontSize',16,'FontWeight','bold');
text(0,0.4,'Total variance','FontSize',16,'FontWeight','bold');
w=num2str(varsum,'%10.5f');
text(0.6,0.4,w,'FontSize',16,'FontWeight','bold');
text(0,0.1,'Explained percentage','FontSize',16,'FontWeight','bold');
w=num2str(varperc,'%10.5f');
text(0.6,0.1,w,'FontSize',16,'FontWeight','bold');
figure(2)
subplot(3,1,1,'FontSize',16,'FontWeight','bold');
hold on
title('Direction in Data');
scatter(x(:,1),x(:,2),'k');
plot(d32(:,1),d32(:,2),'r','LineWidth',2);
hold off
subplot(3,1,2,'FontSize',16,'FontWeight','bold');
hold on
scatter(d5(:,1),d5(:,2),'k');
title('Projection');
subplot(3,1,3,'FontSize',16','FontWeight','bold');
varexp=var(pd2);
varsum=sum(var(x)');
varperc=varexp/varsum;
axis off
text(0,0.7,'Explained variance','FontSize',16,'FontWeight','bold');
w=num2str(varexp,'%10.5f');
text(0.6,0.7,w,'FontSize',16,'FontWeight','bold');
text(0,0.4,'Total variance','FontSize',16,'FontWeight','bold');
w=num2str(varsum,'%10.5f');
text(0.6,0.4,w,'FontSize',16,'FontWeight','bold');
text(0,0.1,'Explained percentage','FontSize',16,'FontWeight','bold');
w=num2str(varperc,'%10.5f');
text(0.6,0.1,w,'FontSize',16,'FontWeight','bold');
hold off