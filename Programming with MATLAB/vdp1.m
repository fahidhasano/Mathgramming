function dydx = vdp1(x,y)
dydx = [y(2); 4*y(2)-3*y(1)+9*x.^2+4];
end