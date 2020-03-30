function x = trid(A,b)
% resolve sistemas tridiagonais de equa��es
N = size(A,2);
for m = 2:N
    tmp = A(m,m - 1)/A(m - 1,m - 1);
    A(m,m) = A(m,m) -A(m - 1,m)*tmp; A(m,m - 1);
    b(m,:) = b(m,:) -b(m - 1,:)*tmp;
end
x(N,:) = b(N,:)/A(N,N);
for m = N - 1: -1: 1
    x(m,:) = (b(m,:) -A(m,m + 1)*x(m + 1))/A(m,m);
end
