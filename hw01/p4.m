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
% Change the order so they show up better when I plot the results.
_y0 = [-10, 10, -5, 5, -3, 3, -1, 1];
% Use these colors for plotting Newton's method for each _y0.
COL = [
	[243 54 51] ./ 255,
	[234 78 92] ./ 255,
	[155 234 51] ./ 255,
	[51 234 118] ./ 255,
	[51 234 222] ./ 255,
	[51 88 234] ./ 255,
	[130 51 234] ./ 255,
	[234 51 152] ./ 255
]

% Loop through each starting point to run Newton's method.
for y0 = _y0

	% Steps will contain a list of each point in the iteration.
	% We can plot this, as well as examine it's size to see
	% how well each initial point is performing.
	steps = [y0];
	
	% loop while we still have too much error
	% infinite loop if we don't converge... but we do
	% for these y, so it's cool
	while abs(f(steps(end))) > ERR
		tmp = steps(end);
		nxt = tmp - f(tmp)/df(tmp);
		steps = [steps nxt];
	end

	y0
	steps
	plot(steps, f(steps), 'LineWidth', 3, 'Color', COL(end, :), 'DisplayName', int2str(y0));
	COL = COL(1:end-1, :);

end

legend('show');

end
