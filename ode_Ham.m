function [t,y] = ode_Ham(f,tspan,y0,N,KC,varargin)
%método de Hamming para resolver equações diferenciais y'(t)=f(t,y(t))
%para tspan=[t0,tf] e com condição inicial y0 e N passos
%usa runge-kutta modificado sobre a estimativa de erro, dependendo 
% do parâmtros KC=1/0
if nargin < 5, KC = 1;
end
if nargin < 4 || N <= 0, N = 100; end
if nargin < 3, y0 = 0; end
y0 = y0(:)';
h = (tspan(2)-tspan(1))/N;
tspan0 = tspan(1)+[0 3]*h;
[t,y] = ode_RK4(f,tspan0,y0,3,varargin{:});
t = [t(1:3)' t(4):h:tspan(2)]';
for k = 2:4, F(k - 1,:) = feval(f,t(k),y(k,:),varargin{:}); end
p = y(4,:); c = y(4,:); h34 = h/3*4; KC11 = KC*112/121; KC91 = KC*9/121;
h312 = 3*h*[-1 2 1];
for k = 4:N
    p1 = y(k - 3,:) + h34*(2*(F(1,:) + F(3,:)) - F(2,:));%Eq.(6.4.9a)
    m1 = p1 + KC11*(c - p);%Eq.(6.4.9b)
    c1 = (-y(k - 2,:) + 9*y(k,:) +...
h312*[F(2:3,:); feval(f,t(k + 1),m1,varargin{:})])/8; %Eq.(6.4.9c)
y(k+1,:) = c1 - KC91*(c1 - p1); %Eq.(6.4.9d)
p = p1; c = c1;
F = [F(2:3,:); feval(f,t(k + 1),y(k + 1,:),varargin{:})];
end
% t0 = 0; tf = 10; y0 = 0; N = 50; 
% df643 = inline('y + 1','t','y'); 
    