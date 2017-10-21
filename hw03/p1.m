function p1

clear all;
close all;
hold on;

X = [1.0 1.1 1.3 1.5 1.9 2.1];
Y = [1.84 1.96 2.21 2.45 2.94 3.18];

P = @(x) -0.010853 .* x.^2 + 1.253293 .* x + 0.596581;
_X = 0.5:0.01:2.5;

plot(_X, P(_X), 'r', 'DisplayName', 'Least Squares', 'LineWidth', 3 );
scatter(X, Y, 50, 'k', 'filled', 'DisplayName', 'Interpolating Points');
legend('show');

end
