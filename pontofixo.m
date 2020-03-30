function [root,fx,ea,iter] = pontofixo(func,p0,es,maxit,varargin)
% pontofixo: calcula solução da equação f(x)=0 por ponto fixo
% sintaxe: xp = pontofixo(func,xmin,xmax,es,maxit,varargin,p1,p2,...)
% entradas:
%           func = nome da função
%           p0 = aproximação inicial
%           es = erro relativo (padrão)
%           maxit = numéro de iterações (padrão 50)
%           p1, p2,... = parâmetros da função func
% saídas:
%           root = raiz da equação f(x) = 0
%           fx = valor da função no ponto x = root
%           ea = erro absoluto
%           iter = numéro máximo de iterações
if nargin<3, error('pelo menos 3 argumentos de entrada são requeridos'),
end
if nargin<4 | isempty(es), es=0.0001; end
if nargin<4 | isempty(maxit), maxit=50;end
iter = 0; p = p0; ea = 100;
while(1)
    pvelho = p;
    p = func(p0);
    iter = iter +1;
    if p ~=0, ea=abs((p-pvelho)/p);end
    p0 = p;
    if ea<=es | iter>=maxit,break,end
end
root = p; fx = func(p, varargin{:});
% utilizar o seguinte exemplo: [root fx ea iter]=pontofixo(@(x)
% sin(10*x)+cos(3*x),0,0.001,5000)  