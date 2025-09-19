function [obj,U,W,F]=SPFKM(X,c,Reduced_dim,gamma,beta)

% X: dim*num data matrix, each column is a data point
% c: number of clusters
% Reduced_dim: projected dimension
% W: the projection matrix, a  dim * Reduced_dim matrix
% U: the fuzzy cluter indicator matrix, a Num *c matrix
% obj_value: the objective function values in each iteration.

NITER = 30;


if nargin < 4
    Reduced_dim=c;
end; 

[~,N]=size(X);
St = X*X';
invSt = inv(St);

% Initialization
% U = Initalize_UV(X,c,N,gamma);
U = initfcm(c, N); % fuzzy belonging matrix (c x N)
U = U';
I =eye(N);
obj=zeros(1,NITER);

for iter = 1:NITER      
    B = diag(1./(sum(U)+1e-6));
    M = I - U*B*U';
    MM = M+beta*I;

    %-------- update W ------------%
    temp = X/MM*X';
    TT = invSt*temp;
    W = eig1(TT,Reduced_dim,1,0);
    W =real(W);
    W=W*diag(1./sqrt(diag(W'*St*W)));
    %-------- update F ------------%
    F =beta*W'*X*inv(MM);
    
     %-------- Objective function--------%
    temp_obj1 = trace(F*M*F')+gamma*trace(U*U');
    temp_obj2 = trace(W'*X*X'*W-2*W'*X*F'+F*F');
    obj(iter) = temp_obj1+beta*temp_obj2;
    
    
    %-------- update U and V when  W and F are fixed--------%
    U = FKMeans_UV(F,U',c,N,gamma);
    

    
    if iter >1
        if abs(obj(iter-1) - obj(iter)) < 1e-6
            break;
        end
    end
    
end

obj=obj(1:iter);
