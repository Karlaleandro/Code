function Integral = simpson(f,a,b,N,varargin)
if nargin < 4, N = 100; end
if abs(b - a)<1e-12 || N <= 0, Integral = 0; return; end
if mod(N,2) ~= 0, N = N + 1; end
h = (b - a)/N; x = a + [0:N]*h;
fx = feval(f,x,varargin{:});
fx(find(fx == inf)) = realmax; fx(find(fx == -inf)) = -realmax
kodd = 2:2:N;
keven = 3:2:N - 1;
Integral = h/3*(fx(1) + fx(N + 1)+4*sum(fx(kodd)) + 2*sum(fx(keven)));
% a= 0; b = 4; N = 80;
% format short e
% It = trpzds(f,a,b,N), errt = It-true_I %trapezoidal
% It = 9.9071e-001, errt = -8.2775e-002
% Is = Integral(f,a,b,N), errs = Is-true I %Simpson