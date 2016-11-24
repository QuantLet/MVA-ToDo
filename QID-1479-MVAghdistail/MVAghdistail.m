%% Clear variables and close windows
clear all
close all
clc

%% set input
% Generalised Hyperbolic Distribution
y     = -6:0.1:6;
xx    = y;
alpha = 1;
beta  = 0;
delta = 1; 
mu    = 0;    % mean
lam   = 0.5; % lambda

% Generalized Hyperbolic

gh05pdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );


% Generalized Hyperbolic
lam     = 1.5; % lambda
gh15pdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );
% Normal Inverse Gaussian

 lam    = -1/2;
 nigpdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );


% Hyperbolic

lam    = 1;
hyppdf =  (alpha^2-beta^2)^(lam/2) / (sqrt(2*pi) * alpha^(lam-1/2) * delta^lam * ... 
                                       besselk(lam, delta*sqrt(alpha^2-beta^2) ) ) * ...
                                (delta^2 + (y-mu).^2).^(1/2*(lam-1/2)) .* ...
                                 besselk( lam-1/2, alpha*sqrt(delta^2 + (y-mu).^2) ) .* ...
                                 exp( beta*(y-mu) );


%% PDF plots
hold on
box on
plot(y,gh05pdf,'Color','b','Linewidth',2.5)
plot(y,gh15pdf,'Color','k','Linewidth',2.5)
plot(y,nigpdf,'Color','m','Linewidth',2.5)
plot(y,hyppdf,'Color','r','Linewidth',2.5)
ylim([0,0.02]);
xlim([4,5]);
xlabel('X');
ylabel('Y');
title('Tail comparison - GH');
legend('GH(f=0.5)','GH(f=1.5)','NIG','HYP','Location','NorthEast')


