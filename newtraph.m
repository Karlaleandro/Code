function [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit,varargin)
% newtraph: m�todo de Newton-Rapshon para localiza��o das ra�zes
% sintaxe da fun��o
% [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit,p1,p2,...)
% entradas:
%         func = nome da fun��o
%         dfunc = derivada da fun��o func
%         xr = aproxima��o inicial
%         es = erro relativo (default 0.0001%)
%         maxit = num�ro m�ximo de itera��es permitidas
%         p1, p2,... = par�metros adicionais usados pela fun��o func
% sa�das:
%         root = solu��o aproximada da equa��o f(x)
%         ea = erro absoluto cometido na aproxima��o
%         iter = n�mero de itera��es
if nargin<3,error('pelo menos 3 argumentos s�o necess�rios'),end
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