%do_polyfit
load xy11.dat
x = xy11(:,1); y = xy11(:,2);
% for i=1:220
%     x(i,1)=xy11(i,1);
%     x(i,2)=xy11(i,2);
% end
% for i=1:220
%     for j=1:2
%         xmatriz=x(i,j);
%     end
[x,i] = sort(x); y = y(i);
xi = min(x)+[0:100]/100*(max(x) - min(x));
for i = 1:4
    [th,err,yi] = polyfits(x,y,2*i - 1,xi);
    subplot(220+i)
    plot(x,y,'k*',xi,yi,'b:')
end
