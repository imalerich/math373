function [x, u] = p2eig(n)

% generate the matrix A
A = diag(repmat(2, n-1, 1));
B = shift(resize(diag(repmat(-1, n-2, 1)), n-1, n-1), 1);
A += B + B';

% compute eigenvalues
e = eig(A);

% we want max/min in magnitude
mags = abs(e);
% find the indecies of the max/min magnituse
% we will use these to look up the actual values in e
[_max maxidx] = max(mags);
[_min minidx] = min(mags);

printf('for n=%d\n', n);
printf('minimum eigenvalue: %f\n', e(minidx(1)))
printf('maximum eigenvalue: %f\n', e(maxidx(1)))

end
