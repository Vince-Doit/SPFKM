function A = update_U(X,B,gama,D)

% X is the d x n matrix
% B is the cluster matrix (d x c)
% gama is the regulatization parameter
% D store the distance^2  between data points

% A is the learned U (c x n)

[~,n] = size(X);
[~,c] = size(B);
A = zeros(c,n);   


%%%% in this papaer:
%U(i,:) ~ -H_ba(i,:)/2*gama  ---> U(i,:)*sqrt(2*gama) ~ -H_ba(i,:)/sqrt(2*gama) 

for i = 1:n
    dnew = - D(i,:)'/(sqrt(2*gama));
    [anew,~] = EProjSimplex_new2(dnew,sqrt(2*gama));
    A(:,i) = (anew./sqrt(2*gama));
end
