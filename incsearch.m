function xb = incsearch(func,xmin,xmax,ns)
%incsearch: pesquisa incremental da localização de raízes
% xb = incsearch(func,xmin,xmax,ns)
% encontra o menor intervalo de x que contém mudança de sinal
% de uma função em um dado intervalo
% entradas
%         func = nome da função
%         xmin, xmax = extremos do intervalo
%         ns = número de subintervalos (default = 50)
% saídas
%         xb(k,1) = limite inferior do k-ésimo intervalo
%         xb(k,2) = limite superior do k-ésimo intervalo
%         se não existir intervalo, xb = []
if nargin < 3, error('Pelo menos 3 argumentos são necessários'), end
if nargin < 4, ns = 50; end % se ns é vazio, tome valor de referência 50
% pesquisa incremental
x = linspace(xmin,xmax,ns);
f = func(x);
nb = 0; xb = [];
for k = 1:length(x)-1
    if sign(f(k)) ~= sign(f(k+1))% testa se os sinais são diferentes
        nb = nb + 1;
        xb(nb,1) = x(k);
        xb(nb,2) = x(k+1);
    end
end
if isempty(xb)
    disp('nenhum intervalo encontrado')
    disp('tente outro intervalo ou aumente ns')
else
    disp('número de intervalo:')
    disp(nb)
end
function f = func(x)
 f = 1-exp(x)+(exp(1)-1)*sin(pi/2*x)
