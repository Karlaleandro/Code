function INTf = trpzds(f,a,b,N)
% integral da função f, no intervalo [a,b], pela regra trapezoidal com N
% elementos
if abs(b - a) < eps | N <= 0, INTf = 0; return; end
h = (b - a)/N; x = a +[0:N]*h; fx = feval(f,x);
INTf = h*((fx(1) + fx(N + 1))/2 + sum(fx(2:N)));