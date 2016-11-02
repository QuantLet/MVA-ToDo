% ---------------------------------------------------------------------
% Book:         MVA 3
% ---------------------------------------------------------------------
% Quantlet:     MVAbluepullover
% ---------------------------------------------------------------------
% Description:  MVAbluepullover rewrites the 5.3 example using the classic
%               "blue pullover" example
% ---------------------------------------------------------------------
% Usage:        MVAbluepullover
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       conditional distribution of X1 - X4
% ---------------------------------------------------------------------
% Example:
% ---------------------------------------------------------------------
% Author:       Matthias Eckardt 20090914 Song Song 20090918
%               Matlab: Awdesch Melzer 20120307
% ---------------------------------------------------------------------

% clear variables and close windows
clear all
close all
clc


blue = load('pullover.dat');

  % generating mu and S
  
mu = mean(blue)';


s_unbiased = cov(blue);    % the result of cov(xy) is the unbiased one 
                              % meaning n/n-1*S 

covxy = s_unbiased/(10/9);      % in ex. 5.3 the biased one is used
 
 % partial correlation between "Sales" and "Price" given "Advertisement" and "Sales Assistans"


	%x1 = Sales
	%x2 =  Price
	z = blue(:,3:4);

	data = [blue(:,1),blue(:,2),z];

		xdata = data(:,1:2);
	Sxx = cov(xdata);

	xzdata = data;
	xdata = xzdata(:,1:2);
	zdata = xzdata(:,3:4);
	Sxz = cov(data);

    Sxz = Sxz(1:2,3:4);
    
	zdata = data(:,3:4);
	Szz = cov(zdata);

	Sxxz = Sxx-(Sxz*inv(Szz)*Sxz');
	
	%rxxz = cov2cor(Sxx.z)[1,2]
    s_xxz = sqrt(diag(Sxxz));
    rxxz = Sxxz./(s_xxz*s_xxz');
    rxxz = rxxz(1,2);
    


% correlation matrix 
P_blue = corr(blue);

 
mu
covxy
rxxz
P_blue 
 
