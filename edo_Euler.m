function [t,y] = edo_Euler(f,tspan,y0,N)
%Método de Euler para resolver equações diferenciais y’(t) = f(t,y(t))
% para o intervalo tspan = [t0,tf], condição inicial y0 e N passos
if nargin<4 || N <= 0, N = 100; end
if nargin<3, y0 = 0; end
h = (tspan(2) - tspan(1))/N;
t = tspan(1)+(0:N)'*h; %vetor tempo
y(1,:) = y0(:)';%condição inicial
for k = 1:N
    y(k + 1,:) = y(k,:) +h*feval(f,t(k),y(k,:));%Eq.(6.1.7)
end
% tspan = [2 5];
% t = tspan(1)+[0:100]*(tspan(2) - tspan(1))/100;
% df61 = inline('(y^2/(log(t+1)*y)+cos(y/(1+t)))*h','t','y','h');
% y0 = 1.5; N = 10;
% [t1,ye] = edo_Euler(df61,tspan,y0,N);
% plot(t1,ye)