%% Clear loaded variables and close graphic windows
clear all
close all
clc

%% set parameters
p = 0.5;
n = 85;

bsample = binornd(1,0.5,n,2000);          %Random generation of the binomial distribution with parameters 2000*n and 0.5

bsamplem    = (mean(bsample) - p)/sqrt(p*(1-p)/n);
bsamplemstd = [bsamplem(1:1000);bsamplem(1001:2000)]';

h = 1.06*[std(bsamplemstd(:,1)) std(bsamplemstd(:,2))].* 200.^(-1/5);

%% compute Kernel density
[f1,xi1]  = ksdensity(bsamplemstd(:,1));
[f2,xi2]  = ksdensity(bsamplemstd(:,2));
[xxi,yyi] = meshgrid(xi1,xi2);

xrange = min(bsamplemstd(:,1)):(max(bsamplemstd(:,1))-min(bsamplemstd(:,1)))./99:max(bsamplemstd(:,1));
yrange = min(bsamplemstd(:,2)):(max(bsamplemstd(:,2))-min(bsamplemstd(:,2)))./99:max(bsamplemstd(:,2));

endx  = length(xrange);
endy  = length(yrange);
ndata = length(bsamplemstd(:,1));

for xxxi = 1:endx
    for yyyi = 1:endy
        u1 = (xrange(xxxi)-bsamplemstd(:,1))/h(1);
        u2 = (yrange(yyyi)-bsamplemstd(:,2))/h(2);
        u  = [u1,u2]';
        for is = 1:ndata
            KD(is) = 1/(2*pi)^(2/2)*exp(-1/2*u(:,is)'*u(:,is));
        end
        fhat(xxxi,yyyi) = mean(KD)/prod(h);
    end
end
%% plot
mesh(yyi,xxi,fhat)
