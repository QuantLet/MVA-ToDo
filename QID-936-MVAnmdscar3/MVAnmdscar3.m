% -------------------------------------------------------------------------
% Book:         MVA
% -------------------------------------------------------------------------
% Quantlet:     MVAnmdscar3
% -------------------------------------------------------------------------
% Description:  MVAnmdscar3 shows the first iteration of the PAV algorithm 
%               for nonmetric MDS for car marks data.
% -------------------------------------------------------------------------
% Usage:        -
% -------------------------------------------------------------------------
% Inputs:       None
% -------------------------------------------------------------------------
% Output:       Shows the first iteration of the PAV algorithm for 
%               nonmetric MDS for car marks data.
% -------------------------------------------------------------------------
% Example:      -
% -------------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% -------------------------------------------------------------------------

clear
close all
clc

x=[3     2
   2     7
   1     3
   0.37  4.36
   10    4];

x=x';

hold on
title('First Iteration for Ferrari')
xlim([0 12])
ylim([0 8])

scatter(x(1,1),x(2,1),90,'r','fill')
text(x(1,1)+0.2,x(2,1),'Mercedes')

scatter(x(1,2),x(2,2),90,'r','fill')
text(x(1,2)+0.2,x(2,2),'Jaguar')

scatter(x(1,3),x(2,3),90,'r','fill')
text(x(1,3)+0.2,x(2,3),'Ferrari Init')

scatter(x(1,4),x(2,4),90,'r','fill')
text(x(1,4)+0.2,x(2,4),'Ferrari New')

scatter(x(1,5),x(2,5),90,'r','fill')
text(x(1,5)+0.2,x(2,5),'VW')

line([x(1,3) x(1,4)],[x(2,3) x(2,4)],'Color','r','LineWidth',2)

hold off