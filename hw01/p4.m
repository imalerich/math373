function p4

clear all;
close all;
hold on;

% This is the function we want to find 0's for.
f = @(t) (4 * t.^2) - e.^t - e.^(-t);
df = @(t) (8 * t) - e.^t + e.^(-t);
% Iterate via Newton's method until we are within 'err' of 0.
ERR = 10^-(5);
% List of starting points to use with Newton's method.
_y0 = [-10, -5, -3, -1, 1, 3, 5, 10];

% Loop through each starting point to run Newton's method.
for y0 = _y0

	% Steps will contain a list of each point in the iteration.
	% We can plot this, as well as examine it's size to see
	% how well each initial point is performing.
	steps = [y0];
	
	% loop while we still have too much error
	while abs(f(steps(end))) > ERR
		tmp = steps(end);
		nxt = tmp - f(tmp)/df(tmp);
		steps = [steps nxt];
	end

	y0
	size(steps)
	plot(steps, f(steps), 'LineWidth', 3);

end

end
