x=linspace(0,1,10);
N=length(x);
for i=1:N
    Q(i+1,1)=cos(x(i));
end
for I = 1:N
 for J = 1:I
 Q(I+1,J+1) = (Q(I+1,J) - Q(I,J)) / (x(I) - x(I-J+1));
 end
end
