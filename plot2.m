y=linspace(2,0.5,100);
for i = 1:length(y)-2
    p(i)=exp(y(i))-y(i)-1;
    ptilde(i)= p(i)-(p(i+1)-p(i))^2/(p(i+2)-2*p(i+1)+p(i))
end
%plot(p,i,'o')