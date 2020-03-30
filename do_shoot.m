%do_shoot para resolver BVP2 pelo método do chute
t0 = 0; tf = 1; x0 = 1/4; xf = 1/3;
N = 100; tol = 1e-8; kmax = 10;
[t,x] = bvp2_shoot('df661',t0,tf,x0,xf,N,tol,kmax);
xo = 1./(4 - t.*t); err = norm(x(:,1) - xo)/(N + 1)
plot(t,x(:,1),'b', t,xo,'r')