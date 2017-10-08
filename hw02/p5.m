function p5

x = [0 1 2];
y = [0 1 2];

%% Natural Cubic Spline

[a b c d] = naturalcubicspline(x, y)

%% Clamped Cubic Sline

[a b c d] = clampedcubicspline(x,y,1,1)

end
