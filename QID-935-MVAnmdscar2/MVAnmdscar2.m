% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnmdscar2
% ---------------------------------------------------------------------
% Description:  MVAnmdscar2 illustrates the PAV algorithm for nonmetric 
%               MDS for car marks data. 
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Illustrates the PAV algorithm for nonmetric MDS for car 
%               marks data as a scatterplot of dissimilarities against
%               distances.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

clear
close all
clc

x=[[3 2 1 10];[2 7 3 4]];

d=dist(x);

delta=[ 1    2    3    d(1,2)
        1    3    2    d(1,3)
        1    4    5    d(1,4)
        2    3    1    d(2,3)
        2    4    4    d(2,4)
        3    4    6    d(3,4)];

fig=[1   d(2,3)   
     2   d(1,3)   
     3   d(1,2)  
     4   d(2,4)   
     5   d(1,4)   
     6   d(3,4)];
 
labels=[2    3
        1    3
        1    2
        2    4
        1    4
        3    4];
 
scatter(fig(:,1),fig(:,2),'b','s','fill')
xlim([0 7])
ylim([0 10])
title('Dissimilarities and Distances')
xlabel('Dissimilarity')
ylabel('Distance')

for i=1:5
    line([fig(i,1) fig(i+1,1)],[fig(i,2) fig(i+1,2)],'Color','k','LineWidth',1.5)
end

text(fig(1,1)+0.2,fig(1,2),'(2,3)','Color','r')
text(fig(2,1)+0.2,fig(2,2),'(1,3)','Color','r')
text(fig(3,1)+0.2,fig(3,2),'(1,2)','Color','r')
text(fig(4,1)+0.2,fig(4,2),'(2,4)','Color','r')
text(fig(5,1)+0.2,fig(5,2),'(1,4)','Color','r')
text(fig(6,1)+0.2,fig(6,2),'(3,4)','Color','r')