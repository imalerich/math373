function [x, y] = p1b(n)

% step size
h = 1/n;
x = 0:h:1;

% initial condition
y = [1];

% backward difference
guess = @(yk) yk + h * sin(yk);
ynext = @(yk, ykk) yk + h * sin(ykk);

% skip the initial condition
for _x = h:h:1
	yk = y(length(y));
	g = @(guess) yk + h * sin(guess);
	[ykk _ykk] = fixedpoint(g, guess(yk), 1e-6, 1000);

	y = [y ynext(yk, ykk(length(ykk)))];
end

end
