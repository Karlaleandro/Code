function INTf = smpsns(f,a,b,N,varargin)
% integral de f sobre [a,b] pela regra de Simppson com N segmento 
if nargin < 4, N = 100; end 
if nargin < 4, N = 100; end
if abs(b - a)<1e-12 | N <= 0, INTf = 0; 
    return
end 
if mod(N,2) ~= 0, N = N + 1; end
h = (b - a)/N; x = a + [0:N]*h;
fx = eval(f,x,varargin{:});
fx(find(fx == inf)) = realmax; 
fx(find(fx == -inf)) = -realmax;
kodd = 2:2:N; keven = 3:2:N - 1;
INTf = h/3*(fx(1) + fx(N + 1)+4*sum(fx(kodd)) + 2*sum(fx(keven)))
