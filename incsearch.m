function xb = incsearch(func,xmin,xmax,ns)
%incsearch: pesquisa incremental da localiza��o de ra�zes
% xb = incsearch(func,xmin,xmax,ns)
% encontra o menor intervalo de x que cont�m mudan�a de sinal
% de uma fun��o em um dado intervalo
% entradas
%         func = nome da fun��o
%         xmin, xmax = extremos do intervalo
%         ns = n�mero de subintervalos (default = 50)
% sa�das
%         xb(k,1) = limite inferior do k-�simo intervalo
%         xb(k,2) = limite superior do k-�simo intervalo
%         se n�o existir intervalo, xb = []
if nargin < 3, error('Pelo menos 3 argumentos s�o necess�rios'), end
if nargin < 4, ns = 50; end % se ns � vazio, tome valor de refer�ncia 50
% pesquisa incremental
x = linspace(xmin,xmax,ns);
f = func(x);
nb = 0; xb = [];
for k = 1:length(x)-1
    if sign(f(k)) ~= sign(f(k+1))% testa se os sinais s�o diferentes
        nb = nb + 1;
        xb(nb,1) = x(k);
        xb(nb,2) = x(k+1);
    end
end
if isempty(xb)
    disp('nenhum intervalo encontrado')
    disp('tente outro intervalo ou aumente ns')
else
    disp('n�mero de intervalo:')
    disp(nb)
end
function f = func(x)
 f = 1-exp(x)+(exp(1)-1)*sin(pi/2*x)
