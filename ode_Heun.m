function [t,y] = ode_Heun(f,tspan,y0,N)
%Método de Heun para resolver equações diferenciais vetoriais y’(t) = f(t,y(t))
%para tspan = [t0,tf] e com condição inicial y0 e N passoso no tempo
if nargin<4 || N <= 0, N = 100; end
if nargin<3, y0 = 0; end
h = (tspan(2) - tspan(1))/N;
t = tspan(1)+[0:N]'*h;
y(1,:) = y0(:)';
for k = 1:N
    fk = feval(f,t(k),y(k,:)); y(k+1,:) = y(k,:)+h*fk;%Eq.(6.2.3)
    y(k+1,:) = y(k,:) +h/2*(fk +feval(f,t(k+1),y(k+1,:)));%Eq.(6.2.4)
end