function [root,ea,iter]  =  secante(func,xr,es,maxit,varargin)
%newtraph: método para a determinação das raízes da equação f(x)
% sintaxe:  [root,ea,iter]  =  newtraph(func,dfunc,xr,es,maxit,p1,p2,...)
% entradas:
%           func = nome da função
%           xr = aproximação inicial
%           es = erro relativo desejado (default = 0.0001)
%           maxit = número máximo de iterações permitida (default)
%           p1, p2,... = parâmetros adicionais usados pela função func
% output:
%           root = solução aproximada da equação f(x)=0
%           ea = erro relativo aproximado 
%           iter = número de iterações (default 50)

if nargin < 3, error('pelo menos três argumentos são necessários'),end
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
% Comentário%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% usar o sequinte exemplo para testar o algoritmo
%y = @(m) sqrt(9.81*m/0.25)*tanh(sqrt(9.81*0.25/m)*4)?36;
%dy =   @(m) 1/2*sqrt(9.81/(m*0.25))*tanh((9.81*0.25/m) ... 
%^(1/2)*4)?9.81/(2*m)*sech(sqrt(9.81*0.25/m)*4)^2;