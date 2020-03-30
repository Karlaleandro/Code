function [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit,varargin)
% newtraph: método de Newton-Rapshon para localização das raízes
% sintaxe da função
% [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit,p1,p2,...)
% entradas:
%         func = nome da função
%         dfunc = derivada da função func
%         xr = aproximação inicial
%         es = erro relativo (default 0.0001%)
%         maxit = numéro máximo de iterações permitidas
%         p1, p2,... = parâmetros adicionais usados pela função func
% saídas:
%         root = solução aproximada da equação f(x)
%         ea = erro absoluto cometido na aproximação
%         iter = número de iterações
if nargin<3,error('pelo menos 3 argumentos são necessários'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxit),maxit=50;end
iter = 0;
while (1)
xrold = xr;
xr = xr - func(xr)/dfunc(xr);
iter = iter + 1;
if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
if ea <= es | iter >= maxit, break, end
end
root = xr;
%usar o seguinte exemplo
% y = @m sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*4)-36;
% dy = @m
% -39.24*(39.24*tanh(4*(2.45/m)^0.5))^(-0,5)*(sech(4*(2,45/m)^0.5))^2*(2.45
% /m)^(-0.5)*(2.45/(m^2))