%aproximação derivada ordem N
function [c,err,eoh,A,b] = difapx(N,points)
l = max(points);
L = abs(points(1)-points(2))+ 1;
if L < N + 1, error('Mais pontos são necessários!'); end
for n = 1: L
    A(1,n) = 1;
    for m = 2:L + 2, A(m,n) = A(m - 1,n)*l/(m - 1);
        l = l-1;
    end
    b = zeros(L,1); b(N + 1) = 1;
    c =(A(1:L,:)\b)';
    err = A(L + 1,:)*c';
    eoh = L-N;
    if abs(err) < eps, err = A(L + 2,:)*c'; eoh = L - N + 1; end
    if points(1) < points(2), c = fliplr(c); end
end