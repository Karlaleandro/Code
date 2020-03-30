%método corretor/preditor-de-Adam-Bashforth-Moulton
clear
format rat
[l,L] = lagrange2([-3 -2 -1 0],[0 0 0 0]);
for m = 1:4
    iL = polyint(L(m,:));
    cAP(m) = polyval(iL,1)-polyval(iL,0);
end
cAP
[l,L] = lagrange2([-2 -1 0 1],[0 0 0 0]);
for m = 1:4
iL = polyint(L(m,:));
cAC(m) = polyval(iL,1) - polyval(iL,0);
end
cAC
format short