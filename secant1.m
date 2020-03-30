function[xr,ea]=secant1(f,x0,xm,TolX,MaxIter)
% resolve f(x)=0 usando o método da secante
% entradas: 
% f = função que deve ser fornecida como uma string f definida em um arquivo M-file
% x0,xm = aproximações iniciais
% tolx = tolerância máxima para o erro |x(k)-x(k-1)|
% MaxIter = número máximo de iterações
% saídas: xr = solução aproximada para a equação f(x)=0
%         ea = erro absoluto
clc
xr(1)=x0;
xr(2)=xm;
i=2;
MaxIter=100;
ea=100;
error=0.0001
while(i>2 & i<MaxIter & ea>error)
xr(i+1)=xr(i)-(f(xr(i))*(x(i-1)-xr(i)))/(f(xr(i-1))-f(x(r)));
ea(i)=abs((xr(i+1)-xr(i))/xr(r+1))*100;
i=i+1;
end
xr
ea
end


% Exemplo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%f42=inline('tan(pi-x)-x','x')
%[x,err,xx]=secant1(f42,2.5,1e-5,50)
