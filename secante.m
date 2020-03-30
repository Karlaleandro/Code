function [root,ea,iter]  =  secante(func,xr,es,maxit,varargin)
%newtraph: m�todo para a determina��o das ra�zes da equa��o f(x)
% sintaxe:  [root,ea,iter]  =  newtraph(func,dfunc,xr,es,maxit,p1,p2,...)
% entradas:
%           func = nome da fun��o
%           xr = aproxima��o inicial
%           es = erro relativo desejado (default = 0.0001)
%           maxit = n�mero m�ximo de itera��es permitida (default)
%           p1, p2,... = par�metros adicionais usados pela fun��o func
% output:
%           root = solu��o aproximada da equa��o f(x)=0
%           ea = erro relativo aproximado 
%           iter = n�mero de itera��es (default 50)

if nargin < 3, error('pelo menos tr�s argumentos s�o necess�rios'),end
if nargin < 4 | isempty(es), es=0.0001;end
if nargin<5 | isempty(maxit), maxit = 50;end
iter = 0;
h = 1e-4;
h2 = 2*h;
while(1)
xrold = xr;
dfdx=(func(xr+h,varargin{:})-...
func(xr-h,	varargin{:}))/h2;
xr = xr - func(xr)/dfdx;
  iter = iter + 1;
  if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
  if ea <= es | iter >= maxit, break, end
end
root = xr;
% Coment�rio%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% usar o sequinte exemplo para testar o algoritmo
%y = @(m) sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*4)?36;
%dy =   @(m) 1/2*sqrt(9.81/(m*0.25))*tanh((9.81*0.25/m) ... 
%^(1/2)*4)?9.81/(2*m)*sech(sqrt(9.81*0.25/m)*4)^2;