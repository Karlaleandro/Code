%método de Neville
x = [7,14,21,28];
fx = [58,50,54,53];
t = 10;

n = length(x);
Q = zeros(n,n);


for i = 1:n
    Q(i,1) = fx(i);
end
for j = 2:n
    for i = j:n
        Q(i,j) = ((t-x(i-j+1)) * Q(i,j-1)/(x(i)-x(i-j+1))) + ((t-x(i)) * Q(i-1,j-1)/(x(i)-x(i-j+1)));
    end
end

%print('Q')