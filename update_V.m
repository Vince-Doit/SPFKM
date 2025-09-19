function B_new = update_V(X,A)


% X is the data matrix (d x N)
% A is the learned U (c x N)
% B is the cluster matrix (d x c)

[d,~] = size(X);
   
Bup = X * A';           % d*c
Bdown = sum(A,2);       % c*1
B_new = Bup./repmat(Bdown',d,1); % d*c

