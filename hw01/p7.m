function p7
clear all;
close all;
hold on;

%% Initial Parameters
g = 32.17;
m = 0.25;
k = 0.1;
s0 = 300;
ERR = 0.01;

% Initial guess of 5 seconds. Turned out to be super close.
GUESS = 5;

%% Find the 0 of f, using function f,df, and/or g.
f = @(t) s0 - (m*g/k).*t + (m*m*g/(k*k)).*(1 - exp(-k.*t./m));
df = @(t) (m*g*(exp(-k.*t./m)-1)) ./ k;
g = @(t) (s0 + m^2*g/(k^2)*(1-exp(-k*t/m))) * k/(m*g);

%% Fixed-Point Iteration

steps = [GUESS];
while abs(f(steps(end))) > ERR
	tmp = steps(end);
	steps = [steps g(tmp)];
end

% Output the results for Fixed-Point Iteration
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Fixed-Point Iteration');

%% Steffensen's Method
 
steps = [GUESS];
while abs(f(steps(end))) > ERR
	p0 = steps(end);
	p1 = g(p0);
	p2 = g(p1);
	p = p0 - (p1-p0)^2 / (p2 - 2*p1 + p0);
	steps = [steps p];
end

% Output the results for Steffensen's Method
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Steffensens Method');

%% Newton's Method

steps = [GUESS];
while abs(f(steps(end))) > ERR
	tmp = steps(end);
	nxt = tmp - f(tmp)/df(tmp);
	steps = [steps nxt];
end

% Output the results for Newton's Method
steps
f(steps(end))
plot(steps, f(steps), 'LineWidth', 3, 'DisplayName', 'Newtons Method');

legend('show');
end
