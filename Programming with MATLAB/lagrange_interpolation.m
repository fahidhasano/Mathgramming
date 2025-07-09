function lagrange_interpolation(f,y,x,xp)
yp=0;
n=length(x);
for i=1:n
    p=1;
    for j=1:n
        if i~=j
            p=p.*(xp-x(j))./(x(i)-x(j));
        end       
    end
    yp=yp+p.*y(i) ; 
end
fprintf('Exact:%.8f\tApprox:%.8f\tError is: %.8f\n',double(f(xp)),double(yp),double(abs(double(f(xp))-double(yp))) );
end

