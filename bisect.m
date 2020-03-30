%m�todo da bissec��o
function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varargin)
%m�todo da bisec��o: localiza as raizes da equa��o f(x)=0
%[root,fx,ea,ite]=bisect(func,xl,xu,es,maxit,p1,p2,...)
% usa o m�todo da bise��o para encontrar as ra�zes da equa��o func.
% entradas:
%          func=nome da fun��o
%          xl, xu = limite inferior e superior, respectivamente, do 
%          do intervalo de busca
%          es= erro relativo (padr�o 0.0001)
%          maxit = itera��es m�ximas permitidas (padr�o 50)
%          p1, p2,... = par�metros adicionais usados pela fun��o func
% sa�das:
%          root = raiz real
%          fx = valor da fun��o no ponto root
%          ea = erro relativo aproximado
%          iter = n�mero de itera��es

if nargin<3, error('pelo menos 3 argumentos de entrada s�o requeridos'),
end
test=func(xl,varargin{:})*func(xu,varargin{:});
if test>0, error('nenhuma mudan�a no sinal'), end
if nargin<4 | isempty(es), es=0.0001; end
if nargin<4 | isempty(maxit), maxit=50;end
iter = 0; xr = xl; ea = 100;
while(1)
xrold = xr;
xr = (xl + xu)/2;
iter = iter +1;
if xr ~=0, ea=abs((xr-xrold)/xr)*100;end
test=func(xl,varargin{:})*func(xr,varargin{:});
if test<0
xu=xr;
elseif test>0
xl=xr;
else
ea=0
end
if ea<=es | iter>=maxit,break,end
end
root = xr; fx = func(xr, varargin{:});