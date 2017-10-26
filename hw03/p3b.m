function p2

clear all;
close all;
hold on;

P = @(x) 0.476177.*x.^3 + 0.047226.*x.^2 + 1.192398.*x + 0.987843
_X = 0:0.05:2;

f = @(x) e.^x;

plot(_X, f(_X), 'b', 'DisplayName', 'e^x', 'LineWidth', 3 );
plot(_X, P(_X), 'r', 'DisplayName', 'T3 Interpolating Polynomial', 'LineWidth', 3 );
legend('show');

end
