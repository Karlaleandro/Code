% M=100;
% N=100;
% a1=1.2;
% b1=2;
% h1=(b1-a1)/N;
% a2=1.3;
% b2=2.1;
% h2=(b2-a2)/N;
% a3=1.4;
% b3=2.2;
% h3=(b3-a3)/N;
% for i=1:N
%     x(i)=a1+i*h1;
%     y(i)=a2+i*h2;
%     r(i)=a3+i*h3;
% end
% x=x(:);
% xi=r(:);
% y=y(:);
% for i=1:M+1
%     A(i,N)=1;
% end
% for j=1:M
%     for n=N:-1:1
%         soma=0;
%     A(j,n)= soma+A(j,n)*x(n);
%     end
% end
% for m=1:M
%     for j=1:N
%         A(m,j)=A(m,j)/r(m);
%         y(m)=y(m)/r(m);
%     end
% end
% th=(A\y)';
% ye=polyval(th,x);
% erro=norm(y-ye);
% yi=polyval(th,xi);
function [th,err,yi] = polyfits(x,y,N,xi,r) 
%x,y : vetor linha de pares de dados
%N : ordem do polinômio(>=0)
%r : fator de ponderação; mesma dimensão de y
M = length(x); x = x(:); y = y(:);
if nargin == 4
    if length(xi) == M, r = xi; xi = x;
        else r = 1;
    end
    elseif nargin == 3, xi = x; r = 1;
end
A(:,N + 1) = ones(M,1);
for n = N:-1:1, A(:,n) = A(:,n+1).*x; end %Eq.(3.8.9)
if length(r) == M
    for m = 1:M, A(m,:) = A(m,:)/r(m); y(m) = y(m)/r(m);end %Eq.(3.8.8)
end
th = (A\y)'; %Eq.(3.8.3) ou (3.8.7)
ye = polyval(th,x); err = norm(y - ye)/norm(y);
yi = polyval(th,xi);