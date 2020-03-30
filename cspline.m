function [yi,S] = cspline(x,y,xi,KC,dy0,dyN)
%Esta fun��o calcula splines c�bicas para os dados de entrada(x,y)
%Entradas: x = [x0 x1 ... xN], y = [y0 y1 ... yN], xi=ponto a ser
%interpolado
% KC = 1/2 representa a condi��o de fronteira para a 1� e 2� derivada
%KC = 3 for para a 2� derivada sobre a fronteira extrapolada
%dy0 = S�(x0) = S01: initial derivative
% dyN = S�(xN) = SN1: derivada final
%Sa�das: S(n,k); n = 1:N, k = 1,4  em ordem decrescente
if nargin < 6, dyN = 0; end, if nargin < 5, dy0 = 0; end
if nargin < 4, KC = 0; end
N = length(x) - 1;
A = zeros(N + 1,N + 1); b = zeros(N + 1,1);
S = zeros(N + 1,4);
k = 1:N; h(k) = x(k + 1) - x(k); dy(k) = (y(k + 1) - y(k))/h(k);
if KC <= 1
    A(1,1:2) = [2*h(1) h(1)]; b(1) = 3*(dy(1) - dy0);
    A(N + 1,N:N + 1) = [h(N) 2*h(N)]; b(N + 1) = 3*(dyN - dy(N));
elseif KC == 2
    A(1,1) = 2; b(1) = dy0; A(N + 1,N+1) = 2; b(N + 1) = dyN;
else
    A(1,1:3) = [h(2) - h(1) - h(2) h(1)];
    A(N + 1,N-1:N + 1) = [h(N) - h(N)-h(N - 1) h(N - 1)];
end
for m = 2:N
    A(m,m - 1:m + 1) = [h(m - 1) 2*(h(m - 1) + h(m)) h(m)];
    b(m) = 3*(dy(m) - dy(m - 1));
end
S(:,3) = A\b;
for m = 1: N
    S(m,4) = (S(m+1,3)-S(m,3))/3/h(m);
    S(m,2) = dy(m) -h(m)/3*(S(m + 1,3)+2*S(m,3));
    S(m,1) = y(m);
end
S = S(1:N, 4:-1:1);
pp = mkpp(x,S);
yi = ppval(pp,xi);
%usar o exemplo abaixo
% KC = 1; dy0 = 2; dyN = 2;
% x = [0 1 2 3]; y = [0 1 4 5];
% xi = x(1)+[0:200]*(x(end)-x(1))/200;
% [yi,S] = cspline(x,y,xi,KC,dy0,dyN);
% clf, plot(x,y,'ko',xi,yi,'k:')
