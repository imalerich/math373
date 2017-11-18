function p2a

f = @(x) x.^4;
y = f(0.5:0.1:1);

total = 0;
for n=1:5
	s = y(n) + y(n+1);
	area = 0.5 * 0.1 * s;
	total += area;
	% printf('%f & \n', area);
end

total

end
