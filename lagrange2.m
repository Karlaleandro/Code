function [l,L] = lagrange2(x,y)
%Entradas: x = [x0 x1 ... xN], y = [y0 y1 ... yN]
% Sa�das: l = os coeficientes do polin�mio de Lagrange de ordem N
%         L = o polin�mo de Lagrange
N = length(x)-1;
l = 0;
for m = 1:N + 1
    P=1;
    for k = 1:N + 1
        if k ~= m, P = conv(P,[1 -x(k)])/(x(m)-x(k)); end
    end
    L(m,:) = P; % coeficientes do polin�mio de Lagrange
    l = l + y(m)*P; % polin�mio de Lagrange
end
% x = [-2 -1 1 2]; y = [-6 0 0 6]; 
% l = lagranp(x,y) 
% xx = [-2: 0.02 : 2]; yy = polyval(l,xx); 
% clf, plot(xx,yy,'b', x,y,'*') 
    