function [x U] = GaussE(A, b)
% Solve linear system Ax = b
% using Gaussian elimination without pivoting
% A is an n by n matrix
% b is n-vectors
% x is solution vectors
% U is the reduced upper-triangular form

if size(A,1) ~= length(b)
    ['Wrong size of A and b']
    return
end

[n, n] = size(A);     % Find size of matrix A


x = zeros(n,1);      % Initialize x
for i = 1:n-1
    m = -A(i+1:n,i)/A(i,i); % multipliers
    A(i+1:n,:) = A(i+1:n,:) + m*A(i,:);
    b(i+1:n) = b(i+1:n) + m*b(i);
end;

U = triu(A);

% Use back substitution to find unknowns
x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i);
end

x  = x(:);
