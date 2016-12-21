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