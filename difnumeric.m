function [dfx] = difnumeric(x,y)
px = lagrange2(x,y);
dpx = polyder(px);
dfx = polyval(dpx, x);
fprintf(' dfx(%6.4f) = %10.6f (error: %10.6f)\n', x,dfx,dfx - y);