function [x,R,err,N] = rmbrg(f,a,b,tol,K)
%constru��o da tabela de Romberg para calcular a integral definida de f sobre [a,b]
h = b - a; N = 1;
if nargin < 5, K = 10; end
R(1,1) = h/2*(feval(f,a)+ feval(f,b));
for k = 2:K
    h = h/2; N = N*2;
    R(k,1) = R(k - 1,1)/2 + h*sum(feval(f,a +[1:2:N - 1]*h));
    tmp = 1;
    for n = 2:k
        tmp = tmp*4;
        R(k,n) = (tmp*R(k,n - 1)-R(k - 1,n - 1))/(tmp - 1);
    end
    err = abs(R(k,k - 1)- R(k - 1,k - 1))/(tmp - 1);
    if err < tol, break; end
end
x = R(k,k);