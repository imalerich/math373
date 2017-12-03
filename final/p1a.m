function [x, y] = p1a(n)

% step size
h = 1/n;
x = 0:h:1;

% initial condition
y = [1];

% forward difference
ynext = @(yk) yk + h * sin(yk);

% skip the initial condition
for _x = h:h:1
	yk = y(length(y))
	y = [y ynext(yk)]
end

end
