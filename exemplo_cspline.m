%exemplo_csplines.m
KC = 1; dy0 = 2; dyN = 2; 
x = [0 1 2 3]; y = [0 1 4 5];
xi = x(1)+[0:200]*(x(end)-x(1))/200; 
[yi,S] = cspline(x,y,xi,KC,dy0,dyN); S 
clf, plot(x,y,'ko',xi,yi,'k:')
yi = spline(x,[dy0 y dyN],xi); 
hold on, pause, plot(x,y,'ro',xi,yi,'r:')
yi = spline(x,y,xi); 
pause, plot(x,y,'bo',xi,yi,'b')
KC = 3; [yi,S] = cspline(x,y,xi,KC);
pause, plot(x,y,'ko',xi,yi,'k')