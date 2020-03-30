function yint = Lagrange(x,y,xx)
%m�todo de interpola��o de Lagrange
% interpola��o polinomial baseada em n pontos
% (x,y), para determinar o valor da vari�vel dependente yint
% para um determinado valor de vari�veis independentes, xx
% entradas:
%         x = vari�vel independente
%         y = vari�vel dependente
%         xx = ordem do polin�mio interpolador
% sa�da:
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