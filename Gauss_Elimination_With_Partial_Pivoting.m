% Inputs:
% A: coefficient matrix
A = input('Enter Coeffient Matrix')
% b: right-hand side vector
b = input('Enter Source vector')
N = length(b);
% Output:
% X: solution vector
X = zeros(N,1);
Aug = [A,b]
% Perform Gaussian elimination with partial pivoting
for j=1:N-1
    %  Find pivot row (P is pivotrow)
    [M,P] = max(abs(Aug(j:N,j)))
    C = Aug(j,:);
     % Swap current row with pivot row
    Aug(j,:) = Aug(P+j-1,:);
    Aug(P+j-1,:) = C;

    % Perform elimination
    for i=j+1:N
        n = Aug(i,j)/Aug(j,j);
        Aug(i,:) = Aug(i,:) - n*Aug(j,:);
    end
end
disp('Echelon form of the given System using Gauss Elimination with Partial Pivoting is')
Aug
% Perform back substitution
X(N) = Aug(N,N+1)/Aug(N,N);
for k = N-1:-1:1
    X(k) = (Aug(k,N+1) - Aug(k,k+1:N)*X(k+1:N))/Aug(k,k);
end
disp('Solution  of the given System using Gauss Elimination with Partial Pivoting is')
Answer=X
