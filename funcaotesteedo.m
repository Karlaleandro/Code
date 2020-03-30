tspan = [0 2];
t = tspan(1)+[0:100]*(tspan(2) - tspan(1))/100;
a = 1; yt = 1 - exp(-a*t); %Eq.(6.1.5): soluçlão analítica
plot(t,yt,'k'), hold on
df61 = inline('-y + 1','t','y');%Equação Diferencial a ser resolvida
y0 = 0; N = 4;
[t1,ye] = edo_Euler(df61,tspan,y0,N);
[t1,yh] = ode_Heun(df61,tspan,y0,N);
[t1,yr] = ode_RK4(df61,tspan,y0,N);
plot(t,yt,'k', t1,ye,'b:', t1,yh,'b:', t1,yr,'r:')
plot(t1,ye,'bo', t1,yh,'b+', t1,yr,'r*')
N = 1e3;
tic, [t1,ye] = edo_Euler(df61,tspan,y0,N); time_Euler = toc
tic, [t1,yh] = ode_Heun(df61,tspan,y0,N); time_Heun = toc
tic, [t1,yr] = ode_RK4(df61,tspan,y0,N); time_RK4 = toc