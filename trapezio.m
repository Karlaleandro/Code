function Integral = trapezio(f,a,b,N)
if abs(b - a) < eps || N <= 0, Integral = 0; return; end
h = (b - a)/N; x = a +[0:N]*h; fx = feval(f,x);
Integral = h*((fx(1) + fx(N + 1))/2 + sum(fx(2:N)));