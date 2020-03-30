clear, format rat
for i = 1:3, [ci,erri] = difapx(i,[-3 0]); c(i,:) = ci; err(i) = erri;
end
cAP = [0 0 0 1]+[1/2 1/6 1/24]*c, errp = -[1/2 1/6 1/24]*err' + 1/120
cAC = [0 0 0 1]+[-1/2 1/6 -1/24]*c, errc = -[-1/2 1/6 -1/24]*err' + 1/120
format short
