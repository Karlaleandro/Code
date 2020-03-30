df = 'df651';
t0 = 0; tf = 2; x0 = [1 -1];
N = 45; [tH,xH] = ode_Ham(df,[t0 tf],x0,N);
plot(tH,xH)
