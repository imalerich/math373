function p5
clear all;
close all;
hold on;

% The function to find 0's for...
f = @(t) 1 - 4.*t .* cos(t) + 2 .* (t.^2) + cos(2.*t);
df = @(t) 4.*t + 4.*t.*sin(t) - 2.*sin(2.*t) - 4.*cos(t);
% We'll need this for Modified Newton's Method.
dff = @(t) 8.*sin(t) + 4.*t.*sin(t) - 4.*cos(2.*t) + 4
% Use the midpoint as our initial guess.
MID = (0.0 + 1.0) / 2.0
% Want a zero within this error.
ERR = 10^-(5);

%% Newton's Method

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

%% Modified Newton's Method

% Use the midpoint as the initial step.
steps = [0.5];

mu = @(t) f(t) ./ df(t);
% Use the quotient rule from Calculus to get the derivative of mu.
dmu = @(t) (df(t) .* df(t) - f(t) .* dff(t)) ./ (df(t).^2);

while abs(mu(steps(end))) > ERR
	tmp = steps(end);
	nxt = tmp - mu(tmp)/dmu(tmp);
	steps = [steps nxt];
end

% Output the results for Newton's Method
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Modified Newtons Method');

legend('show');
end
