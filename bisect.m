%método da bissecção
function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varargin)
%método da bisecção: localiza as raizes da equação f(x)=0
%[root,fx,ea,ite]=bisect(func,xl,xu,es,maxit,p1,p2,...)
% usa o método da biseção para encontrar as raízes da equação func.
% entradas:
%          func=nome da função
%          xl, xu = limite inferior e superior, respectivamente, do 
%          do intervalo de busca
%          es= erro relativo (padrão 0.0001)
%          maxit = iterações máximas permitidas (padrão 50)
%          p1, p2,... = parâmetros adicionais usados pela função func
% saídas:
%          root = raiz real
%          fx = valor da função no ponto root
%          ea = erro relativo aproximado
%          iter = número de iterações

if nargin<3, error('pelo menos 3 argumentos de entrada são requeridos'),
end
test=func(xl,varargin{:})*func(xu,varargin{:});
if test>0, error('nenhuma mudança no sinal'), end
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