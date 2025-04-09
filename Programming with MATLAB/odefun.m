function dydx = odefun(x,y)
dydx=(exp(-x)-y).*(exp(-x)+2+y)
end