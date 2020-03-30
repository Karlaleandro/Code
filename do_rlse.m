%do_rlse
clear
xo = [2 1]';
NA = length(xo);
x = zeros(NA,1); P = 100*eye(NA,NA);
for k = 1:100
    A(k,:) = [k*0.01 1];
    b(k,:) = A(k,:)*xo +0.2*rand;
    [x,K,P] = rlse_online(A(k,:),b(k,:),x,P);
end
x
A\b