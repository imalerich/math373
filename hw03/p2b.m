function p2b

clear all;
close all;
hold on;

P = @(x) 0.536715.*x.^2 + 1.1036.*x + 0.996295;
_X = -1:0.05:1;

f = @(x) e.^x;

plot(_X, f(_X), 'b', 'DisplayName', 'e^x', 'LineWidth', 3 );
plot(_X, P(_X), 'r', 'DisplayName', 'Legendre', 'LineWidth', 3 );
legend('show');

end
