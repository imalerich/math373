function v = CompositeSimpsonsRule(f, a, b, n)

	h = (b-a)/n;
	x = (a+h):h:b;

	i = 1:((n/2)-1);
	j = 1:(n/2);

	part1 = 2 * sum(f(x(2.*i)));
	part2 = 4 * sum(f(x(2.*j-1)));
	inner = f(a) + part1 + part2 + f(b);

	v = (h/3) * inner;
end
