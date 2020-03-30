function [INTf,nodes,err] = quadadptivsimpson(f,a,b,INTf,tol,varargin)
c = (a+b)/2;
INTf1 = simpson(f,a,c,1,varargin{:});
INTf2 = simpson(f,c,b,1,varargin{:});
INTf12 = INTf1 + INTf2;
err = abs(INTf12 - INTf)/15;
if isnan(err) || err < tol || tol<eps
    INTf = INTf12;
    points = [a c b];
else
    [INTf1,nodes1,err1] = quadadptivsimpson(f,a,c,INTf1,tol/2,varargin{:});
    [INTf2,nodes2,err2] = quadadptivsimpson(f,c,b,INTf2,tol/2,varargin{:});
    INTf = INTf1 + INTf2;
    nodes = [nodes1 nodes2(2:length(nodes2))];
    err = err1 + err2;
end
    