[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **pava** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: pava

Published in: Applied Multivariate Statistical Analysis

Description: Computes a monotonic regression using pool-adjacent-violators (PAV) algorithm.

Keywords: 'pool adjacent violators algorithm, monotonic regression, isotonic, regression'

See also: MVAcarrankings

Author: Awdesch Melzer

Submitted: 06/09/2018 by Piedad Castro, Wolfgang Härdle

```

### MATLAB Code
```matlab

function p = pava(x)
    n = max(size(x));
    if(nargin == 1)
        wt=ones(size(x));
    end
    lvlsets = (1:n)';
    while (true)
      viol = (x(1:(n-1)) - x(2:n) > 0);
      if(~any(viol));
          break;
      end
      i             = find(viol, 1 );
      lvl1          = lvlsets(i);
      lvl2          = lvlsets(i + 1);
      ilvl          = (lvlsets == lvl1) | (lvlsets == lvl2);
      x(ilvl)       = sum( x(ilvl).*wt(ilvl) )/sum(wt(ilvl));
      lvlsets(ilvl) = lvl1;
    end
    p = x;
end
```

automatically created on 2018-09-06