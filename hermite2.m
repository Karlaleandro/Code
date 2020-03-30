%polinômio de Hermite
x=linspace(0,1,10);
for i=1:length(x)
    Q(2*i,1)=cos(x(i));
    Q(2*i+1,1)=cos(x(i));
    Q(2*i+1,2)=-sin(x(i));
    Z=ones(2*length(x)+2);
    Z(2*i)=x(i);
    Z(2*i+1)=x(i);
%     Q(2*i+2,1)=Q(2*i+1,1);
    Q(2*i+1,1)= (Q(2*i+1,1)-Q(2*i,1))/(Z(2*i+1)-Z(2*i));
end

    K = 2*length(x);
    for I = 2:K
 for J = 2:I
 Q(I+1,J+1) = (Q(I+1,J)-Q(I,J))/(Z(I+1)-Z(I-J+1));
 end
 end