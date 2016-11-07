function [xhat, yhat] = PAVAlgo(x,y)  %Define the PVA algorithm as a function

for i = 1:length(x)
 data  = [x y];
 sdata = sortrows(data,1);  % Sort the bivariate data by the first variable
 xhat  = sdata(:,1);
 yhat  = sdata(:,2);
 for n = 1:length(x)-1 % checking from left to right
     if yhat(n) > yhat(n+1) 
        yhat(n:n+1) = mean(yhat(n:n+1))*ones(2,1); 
        p           = 0;
        while p < n-1 % checking from right to left 
        if yhat(n-p-1) > yhat(n-p) 
           yhat(n-p-1:n+1) = mean(yhat(n-p-1:n+1))*ones(p+3,1);  
           p               = p+1;
        else
            p = n-1;
        end
        end
     end  
 end
end
