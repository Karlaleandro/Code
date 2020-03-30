 tspan = [0 2];
t = tspan(1)+[0:100]*(tspan(2) - tspan(1))/100;
df61 = inline('-y^2+log(1/y) + 1','t','y');
y0 = 0; N = 4;