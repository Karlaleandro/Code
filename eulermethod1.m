clear, clf
a = 1; r = 1; y0 = 0; tf = 2;
t = [0:0.01:tf]; yt = 1 - exp(-a*t);%solu��o verdadeira
plot(t,yt,'k'), hold on
klasts = [8 4 2]; hs = tf./klasts;
y(1) = y0;
for itr = 1:3%testar em tr�s passos
    klast = klasts(itr); h = hs(itr); y(1)=y0;
    for k = 1:klast
        y(k + 1) = (1 - a*h)*y(k) +h*r;% equa��o (6.1.3)
        plot([k - 1 k]*h,[y(k) y(k+1)],'b', k*h,y(k+1),'ro')
        if k < 4, pause; end
    end
end