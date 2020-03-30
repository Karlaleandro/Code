function yint = Lagrange(x,y,xx)
%método de interpolação de Lagrange
% interpolação polinomial baseada em n pontos
% (x,y), para determinar o valor da variável dependente yint
% para um determinado valor de variáveis independentes, xx
% entradas:
%         x = variável independente
%         y = variável dependente
%         xx = ordem do polinômio interpolador
% saída:
%         yint = valor interpolado
n = length(x);
if length(y)~=n, error('x e y devem ter o mesmo comprimento'); end
b = zeros(n,n);
b(:,1) = y(:);
for j=2:n
    for i = 1:n-j+1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end
xt = 1;
yint = b(1,1);
for j = 1:n-1
     xt = xt*(xx-x(j));
     yint = yint+b(1,j+1)*xt;
end
% usa o seguinte exemplo: 
%x = [1 4 6 5]';
% y = log(x);
% Newtint(x,y,2)