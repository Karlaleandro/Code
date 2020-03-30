function [l,L] = lagrange2(x,y)
%Entradas: x = [x0 x1 ... xN], y = [y0 y1 ... yN]
% Saídas: l = os coeficientes do polinômio de Lagrange de ordem N
%         L = o polinômo de Lagrange
N = length(x)-1;
l = 0;
for m = 1:N + 1
    P=1;
    for k = 1:N + 1
        if k ~= m, P = conv(P,[1 -x(k)])/(x(m)-x(k)); end
    end
    L(m,:) = P; % coeficientes do polinômio de Lagrange
    l = l + y(m)*P; % polinômio de Lagrange
end
% x = [-2 -1 1 2]; y = [-6 0 0 6]; 
% l = lagranp(x,y) 
% xx = [-2: 0.02 : 2]; yy = polyval(l,xx); 
% clf, plot(xx,yy,'b', x,y,'*') 
    