function p6
clear all;
close all;
hold on;

% The function to find 0's for...
f = @(t) 600.*t.^4 - 550.*t.^3 + 200.*t.^2 - 20.*t - 1;
df = @(t) 2400.*t.^3 - 1650.*t.^2 + 400.*t - 20;
% Use the midpoint as our initial guess.
MID = (0.1 + 1.0) / 2.0;
% Want a zero within this error.
ERR = 10^-(4);

%% (a) Bisection Method

int = [0.1 1.0];
steps = [(sum(int)/2.0)];

while abs(f(steps(end))) > ERR
	% Shrink our interval to approach the actual result.
	if ( sign(f(steps(end))) == sign(f(int(1))) )
		int(1) = steps(end);
	else 
		int(2) = steps(end);
	end

	% Update the midpoint.
	steps = [steps (sum(int)/2.0)];
end

% Output the results for the Bisection Method.
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Bisection Method');

%% (b) Newton's Method

steps = [MID];
while abs(f(steps(end))) > ERR
	tmp = steps(end);
	nxt = tmp - f(tmp)/df(tmp);
	steps = [steps nxt];
end

% Output the results for Newton's Method
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Newtons Method');

%% (c) Secant Method

% Initial guess is the midpoint,
% second guess is taken from newtons method
steps = [MID (MID - f(MID)/df(MID))];

while abs(f(steps(end))) > ERR
	tmp = steps(end);
	p1 = steps(end);
	p2 = steps(length(steps)-1);
	nxt = steps(end) - (f(p1) * (p1-p2)) / (f(p1)- f(p2));
	steps = [steps nxt];
end

% Output the results for Secant Method
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Secant Method');

%% (d) Muller's Method

% Initial guess is the midpoint,
% Second & Third guesses are taken from Newtons Method
p1 = MID;
p2 = p1 - f(p1)/df(p1);
p3 = p2 - f(p2)/df(p2);

% Run Muller's Method.
[steps fval] = muller(f, p1, p2, p3, ERR, 100);

% Output the results for Muller's Method
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Mullers Method');

legend('show');
end
