function yint = diferenca(x,y,xx)
%cálculo do polinômio de taylor pelo método das diferenças finitas
% entradas:
%          x=variável independente
%          y=variável dependente
%          xx= valor da variável independente no qual a interpolação é  calculada
%           
% saída:
%       valor interpolado da variável dependente
n = length(x);
if length(y)~=n, error('x e y devem ter o mesmo comprimento'); end
b = zeros(n,n);
b(:,1) = y(:);
for j = 2:n
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
% format long
% x = [1 4 6 5]';
% y = log(x);
% diferenca(x,y,2)
% 
% ans =
% 
%    0.62876857890841