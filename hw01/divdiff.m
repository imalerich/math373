function [d] = divdiff(x, f)

if length(x) == 1
	d = f(x(1));
else if length(x) == 2
	d = f(x(2)) - f(x(1));
else
	d = (divdiff(x(2:length(x)), f) - divdiff(x(1:length(x)-1), f)) / (x(length(x)) - x(1));
end

end
