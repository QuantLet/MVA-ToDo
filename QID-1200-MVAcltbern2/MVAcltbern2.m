% ----------------------------------------------------------------------------
% Book:         MVA
% ----------------------------------------------------------------------------
% Quantlet:     MVAcltbern2
% ----------------------------------------------------------------------------
% Description:  MVAcltbern2 illustrates the 2D Central Limit Theorem
%               (CLT). n*2000 sets of n-dimensional Bernoulli samples are
%               generated and used to approximate the distribution of
%               t = sqrt(n)*(mean(x)-mu)/sigma -> N(0,1). The estimated joint 
%               density is shown.
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None
% ------------------------------------------------------------------------------
% Output:       The estimated two-dimensional density is displayed for different
%               sample sizes
% ------------------------------------------------------------------------------
% Example:      Examples are produced for n=85 or n=5.
% ------------------------------------------------------------------------------
% Author:       Wolfgang Haerdle 20091001; Matlab: Awdesch Melzer 20120228
% ------------------------------------------------------------------------------

% Clear loaded variables and close graphic windows
clear all
close all
clc

p = 0.5;
n = 85;

bsample = binornd(1,0.5,n,2000);          %Random generation of the binomial distribution with parameters 2000*n and 0.5

bsamplem = (mean(bsample) - p)/sqrt(p*(1-p)/n);
bsamplemstd = [bsamplem(1:1000);bsamplem(1001:2000)]';

h = 1.06*[std(bsamplemstd(:,1)) std(bsamplemstd(:,2))].* 200.^(-1/5);

[f1,xi1] = ksdensity(bsamplemstd(:,1));
[f2,xi2] = ksdensity(bsamplemstd(:,2));
[xxi,yyi] = meshgrid(xi1,xi2);

xrange = min(bsamplemstd(:,1)):(max(bsamplemstd(:,1))-min(bsamplemstd(:,1)))./99:max(bsamplemstd(:,1));
yrange = min(bsamplemstd(:,2)):(max(bsamplemstd(:,2))-min(bsamplemstd(:,2)))./99:max(bsamplemstd(:,2));

endx = length(xrange);
endy = length(yrange);
ndata = length(bsamplemstd(:,1));

for xxxi=1:endx
    for yyyi=1:endy
        u1 =(xrange(xxxi)-bsamplemstd(:,1))/h(1);
        u2 =(yrange(yyyi)-bsamplemstd(:,2))/h(2);
        u=[u1,u2]';
        for is=1:ndata
            KD(is)=1/(2*pi)^(2/2)*exp(-1/2*u(:,is)'*u(:,is));
        end
        fhat(xxxi,yyyi)=mean(KD)/prod(h);
    end
end

mesh(yyi,xxi,fhat)
