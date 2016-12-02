%% clear variables and close windows
clear
clc
close all

%% load data
x = load('bank2.dat');
x = x(:,6)';          % only consider the diagonal

n    = length(x);     % number of observations.
step = [2 8 4 16];    % define the number of shifts.

for l  = 1:4
    h  = 0.4;
    t0 = h*(floor(min(x)/h)+0.5); % min
    tf = h*(floor(max(x)/h)-0.5); % max

    m     = step(l);
    delta = h/m;
    
    nbin    = floor((tf-t0)/delta);
    binedge = t0:delta:tf; % define the bins of the histogram
    
    vk   = histc(x,binedge); % count the number of elements in each bin
    fhat = [zeros(1,m-1),vk,zeros(1,m-1)];
    kern = inline('1-(abs(x))');
    ind  = (1-m):(m-1);
    den  = sum(kern(ind/m));
    wm   = m*(kern(ind/m))/den;

    fhatk = zeros(1,nbin);
    
    for k   = 1:nbin
        ind      = k:(2*m+k-2);
        fhatk(k) = sum(wm.*fhat(ind));
    end
    
    fhatk   = fhatk/(n*h);
    binedge = [zeros(1,1),binedge];
    fhatk   = [zeros(1,1),fhatk,zeros(1,1)];
    
    %% plot the different histograms 
    subplot(2,2,l)
    stairs(binedge,fhatk) 
    
    axis 'auto y'
    axis manual
    
    % modify the subplots
    ylim([0 0.5])
    xlim([137.1 142.9])
    
    h = findobj(gca,'Type','patch');
    set(h,'FaceColor','w','EdgeColor','k')
    
    title('Swiss Bank Notes')
    xlabel([num2str(step(l)),' shifts'])
    ylabel('Diagonal')
    
end