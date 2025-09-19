function [outA,outB,outObj,outNumIter] = FKMeans_UV(X,U,c,N,gama)
% X is a  d x N matrix
% c is the number of clusters
% N is the number of data points
% gama is the regularization parameter

% initzlize
% U = initfcm(c, N); % fuzzy belonging matrix (c x N)

thresh = 10^-4;
maxIter=50;
obj = zeros(maxIter,1);


for t = 1:maxIter
    %-------- update B when fixed A and lamda--------%
    V = update_V(X,U);
    D = pdist2( X',V');  % D:n*c
    %-------- update A when fixed B--------%
    U = update_U(X,V,gama,D);

    %------- calculate the obj --------%
    for i = 1:N
        obj(t) = obj(t) + D(i,:)*U(:,i) + U(:,i)'*U(:,i)*gama; 
    end
    
    if(t > 1)
        diff = obj(t-1)-obj(t);
        if(diff < thresh)
            break;
        end
    end
    
    
    
end

outNumIter = t;
outObj = obj(1:t);
outA = U';
outB = V;
% outObj = obj(outNumIter);