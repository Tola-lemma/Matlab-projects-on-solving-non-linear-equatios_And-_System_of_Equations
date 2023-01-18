% example like [10 3 1;3 10 2 ;1 2 10]
A = input('Enter a co-efficient Matrix A:');
%example like [19;29;35]
B = input('Enter source Vector B:');
% example like [0;0;0]
P = input('Enter initial Guess Vector: ');
%example like 10
n = input('Enter number of iterations :');
% example like 0.0001
e = input('Enter enter your tolerance:');
N = length(B);
X = zeros(N,1);
Y = zeros(N,1);%stopping criteria

for j=1:n
    for i=1:N
        X(i) = (B(i)/A(i,i)) - (A(i,[1:i-1,i+1:N])*P([1:i-1,i+1:N]))/A(i,i);
        P(i) = X(i);
    end
    fprintf('Iteration number %d\n',j);
    X
    if abs(Y-X) < e
        break
    end
    Y = X;
end
