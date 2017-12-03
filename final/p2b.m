function [x u] = p2b(f, alpha, beta, n)

% want to approximate u(x)
h = 1/n;
k = 0:n;
x = k/n;

% boundary condition
u0 = alpha;
un = beta;

% construct the linear system we need to solve
% this will give us u_1 through u_{n-1}

A = diag(repmat(2, n-1, 1));
B = shift(resize(diag(repmat(-1, n-2, 1)), n-1, n-1), 1);
A += B + B';

b = [];
for k=2:n
	b = [b f(x(k))];
end

b(1) += u0 / (h^2);
b(length(b)) += un / (h^2);
b *= (h^2);

% Use Gaussian Elimination to solve the system.
[u U] = GaussE(A, b');
% add the boundaries to the result
u = [u0 u' un];

end
