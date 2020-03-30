y=linspace(2,0.5,10);
for i = 1:length(y)
    p(i)=exp(y(i))-y(i)-1
end
%plot(p,i,'o')