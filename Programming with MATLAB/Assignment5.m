%%
%1(i)
clc;clear all;close all
syms x
f(x)=(sin(x)).^2-x.^2+1;
x0=input('enter first guess:');
x1=input('enter second guess:');
tolerance=input('enter tolerance error:');
%double(f(x0)*f(x1))
if f(x0)*f(x1)>0
    display('incorrect initial guesses')
elseif f(x0)*f(x1)<0
    x2=(x0+x1)/2;
    i=1;
    while abs(f(x2))>tolerance
        x2=(x0+x1)/2;
        if f(x0)*f(x2)<0
            x1=x2;
        else
            x0=x2;
        end        
    end
else
    display(x0,x1)
    
end
disp('root is:')
disp(x2)
%%
clc;clear all;close all
%2
%newton's interpolation
y=[1.0 0.242; 1.20 0.1942;1.4 0.1497;1.6 0.1109;1.8 0.079;2.0 0.054];
n=6;
x1=input('write the point to calculate the value');
for j=3:n+1
    for i=1:n
        if(j<i+2)
            y(i,j)=y(i,j-1)-y(i-1,j-1);
        else
            y(i,j)=0;
        end
    end
end
%y
p=(x1-y(n,1))/(y(2,1)-y(1,1));
fx=0;
for i=0:n-1
    pro=1.;
    for j=1:i
        pro=pro*(p+j-1);
    end
    pro=pro/factorial(i);
    fx=fx+pro*y(n,i+2);
end
fprintf('the value of f(x) at %f is %f\n',x1,fx)

   