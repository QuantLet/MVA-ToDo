% ------------------------------------------------------------------------------
% Book:         MVA
% ------------------------------------------------------------------------------
% Quantlet:     MVAsirdata
% ------------------------------------------------------------------------------
% Description:  MVAsirdata generates a data set and applies the sliced inverse 
%               regression algorithm (SIR) for dimension reduction.
% ------------------------------------------------------------------------------
% Usage:        -
% ------------------------------------------------------------------------------
% Inputs:       None      
% ------------------------------------------------------------------------------
% Output:       Effective dimension reduction directions (EDR-directions) for the 
%               simulated data and plots for the response versus the estimated 
%               EDR-directions, a three-dimensional plot for the first two 
%               directions and the response, plot for the eigenvalues and the 
%               cumulative sum and plots for the true response versus the true 
%               indices.
% ------------------------------------------------------------------------------
% Example:      -
% ------------------------------------------------------------------------------
% Author:       Zografia Anastasiadou 20100805;
%               Awdesch Melzer 20120417
% ------------------------------------------------------------------------------

%clear variables and close windows
clear all;
close all;
clc

%number of observations
n = 300;
%number of elements in each slice
ns = 20; 
%number of slices
hOld = floor(n/ns);
%n x 3 matrix, the explanatory variable
x = normrnd(0,1,n,3);
%n vector, the noise variable
e = normrnd(0,1,n,1);
%projection vectors
b2 = [1,-1,-1]';
b1 = [1,1,1]';
%n vector, the response variable
y = x*b1+((x*b1).^3)+4*((x*b2).^2)+e;
h=-20;

[n ndim] = size(x); % number of observations and number of dimension                    
  
% calculate the covariance matrix and its inverse root to standardize X
% step 1 in original article

  xb   = mean(x);                         % mean of x                       
  s    = (x'*x - n.*xb'*xb)./(n-1);       % cov of x                        
  [evec,eval] = eigs(s);                % eigendecomposititon of cov   
  si2  = evec*diag(sqrt(1./diag(eval)))*evec';  % compute cov(x)^(-1/2)        
  xt   = (x-repmat(xb,length(x),1))*si2;                      % stand. x to mean=0, cov=I    

% construct slices in Y space
%  step 2 in original article

  data  = sortrows([y,xt]);    

  
  % build slices 
%  ns     = number of slices 
%  condit = n values controlling which x-data fall
%           in a slice depending on choic
%  choice = vector of ns choices to build the slice subset of x 
% case 1: h<=-2  -> each slice with <= abs(h) elements                   
% if n div h != 0 then the first and last slice get the remainder        
  h = abs(h);
  ns = floor(n / h);
  condit = [1:1:n]'; % enumber the x values             
  choice0 = [1:1:ns]';
  choice = [choice0.*h];         % take h values in each slice      
  if (h*ns ~= n)                     % if there are remaining values    
    hk = floor((n-h*ns)/2);
    if (hk>=0)
      choice = [hk;choice+hk];          % generate a new first ...         
    end
    choice = [choice;n];              % ... and last slice               
  end
  ns = length(choice);                  % number of slices 
  
  

%   compute width of slices and vector of upper limit of slice intervals  

  slwidth = (data(n,1) - data(1,1))/h;
  first = data(1,1)-slwidth;
  last=data(n,1);
  slend   = first:slwidth:last;
  if (slend(ns) > data(n-1,1))      % does only the last value            
    slend(ns) = data(n,1);           % lay behind the last slice ?         
  else
    slend = [slend,data(n,1)];         % if not, build another slice         
  end
  condit = data(:,1);                 % choose on original y values  
  choice = slend';                    % choice to end of slice              
  ns     = length(choice);             % compute the number of slices        
 
  %  run over all slices, compute estimate for V = Cov(E(x|y))            
%  step 3                
  

  hk   = 0;
    % initialise V matrix                        
  ind  = ones(n,1);             % index vector of length n% 0 means,         
  j=0;
  sborder=0;
  v=0;
while j<ns
    j=j+1;
         sborder = (condit(:) <= choice(j)); % sborder is index            
  
  p = sum(sborder);                      % if jth obs. belongs         
  
  % current slice               
  if p~=0
  ind    = ind - sborder;              % don't take this values        
                                          % in further slices           
      xslice = data(find(sborder),2:end); % get sliced x-values         
      xmean  = mean(xslice);
      v = v + xmean'*xmean*length(xslice);      % compute V                   
      hk = hk+1;
  end
end
  
    v1          = (v+v')/2/n;              % for numerical errors 
  [b,eigen] = eigs (v1);               % step 5, eigenvectors of V  
  b          = si2 * b;                 % calculate e.d.r. direction 
  data       = sqrt(sum(b.^2))';         % ... and standardize them   
  edr        = b./repmat(data,1,3);
  
  f=edr;
  g=diag(eigen);
  
  

%matrices for the true indices and the true responses 
m1 = [x*b1,y];
m2 = [x*b2,y];
m1 = sortrows(m1,1);
m2 = sortrows(m2,1);

sg = sum(g);
g = g/sg;
%the ratio of the sum of the 3 eigenvalues and the sum of all eigenvalues
psi = [g(1),g(1)+g(2),g(1)+g(2)+g(3)]';

figure(1)
subplot(2,2,1)
%plot of the response versus the first estimated EDR-direction
p11 = [x*f(:,1),y];
plot(p11(:,1),p11(:,2),'bo')
xlabel('first index')
ylabel('response')
title('XBeta1 vs Response')
box on

%plot of the response versus the second estimated EDR-direction
subplot(2,2,3)
p21 = [x*f(:,2),y];
plot(p21(:,1),p21(:,2),'bo')
xlabel('second index')
ylabel('response')
title('XBeta2 vs Response')
box on
%three-dimensional plot of the first two directions and the response
subplot(2,2,2)
p12 = [x*f(:,1),x*f(:,2),y];
scatter3(p12(:,1),p12(:,2),p12(:,3),'ko'),view(-60,80)
view(-44,13)

xlabel('first index')
ylabel('second index')
zlabel('response')
box on
title('XBeta1 XBeta2 Response')


i = [1,2,3]';
ig = [i,g];
psii = [i,psi];
p22 = [ig;psii];
%plot of the eigenvalues and the cumulative sum
subplot(2,2,4)
plot(p22(1:3,2),'k*')
hold on
plot(p22(4:6,2),'bo')
xlabel('K')
ylabel('Psi(k) Eigenvalues')
title('Scree Plot')
box on

%plots of the true response versus the true indices
figure(2)
plot(m1(:,1),m1(:,2),'o')
xlabel('first index')
ylabel('response')
title('True index vs Response')
figure(3)
plot(m2(:,1),m2(:,2),'o')
xlabel('second index')
ylabel('response')
title('True index vs Response')

