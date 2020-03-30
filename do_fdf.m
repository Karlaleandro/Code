%do_fdf resolve BVP2 pelo método das diferenças finitas
clear, clf
t0 = 1; x0 = 5; tf = 2; xf = 3; N = 100;
a1 = inline('2./t','t'); a0 = inline('-2./t./t','t');u = 0;
[tt,x] = bvp2_fdf(a1,a0,u,t0,tf,x0,xf,N);
plot(tt,x)