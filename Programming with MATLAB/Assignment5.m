%%
%1(i)
clc;clear all;close all
syms f(x)
f(x)=input('Enter the function:\n')
a=input('Enter lower limit:\n')
b=input('Enter upper limit:\n')
e=input('Enter tolerance:\n')
if f(a)*f(b)>0
    disp('Error: Invalid solution and no middle point found')
elseif f(a)*f(b)<0
    fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n')
    c=(a+b)/2;   
    while abs(f(c)) > e
        fprintf('%f\t%f\t%f\t%f\t\n',a,b,c,f(c))
        if f(a)*f(c)<0
            b=c;
        else
            a=c;
        end
        c=(a+b)/2;
        
end

fprintf('Solution is:%f\n',c )  
    
end
%%
%(ii)
%fixed point iteration
clc;clear all
syms f(x) g(x)
f(x) = sin(x)^2 - x^2 + 1;
g(x) = sqrt(sin(x)^2 + 1);
x0=input('Initial guess:');
e=input('Tolerable error:');
N=input('Maximum iteration:');
step=1;
while 1
    fx=f(x0);
    x1 = g(x0);
    if abs(fx)<e
        break
    end
    
    
    if step>N
        fprintf( 'Not Convergent')
		break
    end
    fprintf('\nstep:%d\t\t\tx=%f\t\t\tf(x)=%f\n',step,x0,f(x0))
	x0 = x1;
    
    step = step + 1;
    
    
end

fprintf('\nSolution is %.8f\n',x1)

%%
%(iii)
%Newton-Raphson method
clc;clear all;close all
syms f(x) g(x)
f(x)=input('Enter non-linear equations: ')
g(x)=diff(f,x,1)
x0=input('Enter initial guess:');
e=input('Tolerable error:');
N=input('Maximum iteration:');

step=1;
while 1
    fx=f(x0);
    gx=g(x0);
    if gx==0
        disp('Division by zero.');
        break
    end
    x1=x0-(fx./gx);
    fprintf('\n step:%d\t\t\tx=%f\t\t\tf(x)=%f\n',step,x0,f(x0))
    x0=x1;
    if N<step
        disp('Not convergent')
        break  
    end
    if abs(fx)<e
        fprintf('\nConverged successfully!\n');
        break
    end
    step=step+1;
end
fprintf('Root is:%.8f\n',x1)
%%
%(iv)
%Regula Falsi
clc;clear all;close all;
syms x
f=input('Function:');
x0=input('first guess:');
x1=input('second guess:');
e=input('tolerance:');
fx0=eval(subs(f,x,x0));
fx1=eval(subs(f,x,x1));

if fx0*fx1>0
    fprintf('roots not bracketed')
elseif fx0*fx1<0
    x2=-fx0*((x1-x0)/(fx1-fx0))+x0;
    
    fx2=eval(subs(f,x,x2));
    fprintf('\n\nx0\t\t\tx1\t\t\tx2\t\t\tf(x2)\n')
    while abs(fx2)>e
        fprintf('%f\t%f\t%f\t%f\n',x0,x1,x2,fx2)
        if fx0*fx2<0
            x1=x2;
            fx1=eval(subs(f,x,x1));
        else 
            x0=x2;
            fx0=eval(subs(f,x,x0));
        end
        x2=-fx0*((x1-x0)/(fx1-fx0))+x0;
       fx2=eval(subs(f,x,x2));
    end
fprintf('result is :%.8f\n',x2)    
end

%%
clc;clear all;close all
%3
syms f(x)
f(x)=0.5.*x*exp(0.1.*x.^2);
x=[0 0.5 1.0 1.5 2.0];
xp=1.25;
y = double(f(x));
%From lagrange_interpolation.m file:
lagrange_interpolation(f,y,x,xp)
%%
clc;clear all;close all
%2
%newton's interpolation
y=[1.0 0.242; 1.20 0.1942;1.4 0.1497;1.6 0.1109;1.8 0.079;2.0 0.054];
n=length(y);
x1=input('write the point to calculate the value');
for j=3:n+1
    for i=1:n
        if(i>j-2)
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
%%
%4(i)
%Trapezoidal rule
clc;clear all;close all
syms f(x)
f(x)=2./(x.^2+4);
lower_limit=input('Lower limit:');
upper_limit=input('Upper limit:');
n=input('Sub interval:');
h=(upper_limit-lower_limit)./n;
integration=f(lower_limit)+f(upper_limit);
for i=1:n-1
    k=lower_limit+i.*h;
    integration=integration+2.*f(k) ;  
end
integration=integration.*(h./2);
exact_integration=int(f,x,lower_limit,upper_limit);
fprintf('Solution is: %.8f\n',double(integration));
fprintf('Exact integration : %.8f\n',double(exact_integration))
fprintf('Error: %.8f\n',abs(double(integration)-double(exact_integration)))
%%
%4(ii)
%Sympson's 1/3 rule
clc;clear all;close all
syms f(x)
f(x)=2./(x.^2+4);
lower_limit=input('Lower limit:');
upper_limit=input('Upper limit:');
n=input('Sub interval:');
h=(upper_limit-lower_limit)./n;
integration=f(lower_limit)+f(upper_limit);
for i=1:n-1
    k=lower_limit+i.*h;
    if  mod(i,2)==0
        integration=integration+2.*f(k);
    else
        integration=integration+4.*f(k);
    end
    
end
integration=integration.*(h./3);
exact_integration=int(f,x,lower_limit,upper_limit);
fprintf('Solution is: %.8f\n',double(integration));
fprintf('Exact integration : %.8f\n',double(exact_integration))
fprintf('Error: %.8f\n',abs(double(integration)-double(exact_integration)))
%%
%4(iii)
%Sympson's 3/8 rule
clc;clear all;close all
syms f(x)
f(x)=2./(x.^2+4);
lower_limit=input('Lower limit:');
upper_limit=input('Upper limit:');
n=input('Sub interval:');
h=(upper_limit-lower_limit)./n;
integration=f(lower_limit)+f(upper_limit);
for i=1:n-1
    k=lower_limit+i.*h
    if  mod(i,3)==0
        integration=integration+2.*f(k);
    else
        integration=integration+3.*f(k);
    end
    
end
integration=integration.*(3.*h./8);
exact_integration=int(f,x,lower_limit,upper_limit);
fprintf('Solution is: %.8f\n',double(integration));
fprintf('Exact integration : %.8f\n',double(exact_integration))
fprintf('Error: %.8f\n',abs(double(integration)-double(exact_integration)))
%%
%4(iv)
%Weedle's rule
clc;clear all;close all
syms f(x)
f(x)=2./(x.^2+4);
lower_limit=input('Lower limit:');
upper_limit=input('Upper limit:');
n=input('Sub interval(must be a multiple of 6):');
h=(upper_limit-lower_limit)./n;
integration=0;
for i=0:n-6
    x0=lower_limit+i.*h;
    x1=x0+1.*h;
    x2=x0+2.*h;
    x3=x0+3.*h;
    x4=x0+4.*h;
    x5=x0+5.*h;
    x6=x0+6.*h;
    temp=f(x0)+5*f(x1)+f(x2)+6*f(x3)+f(x4)+5*f(x5)+f(x6);
    integration=integration+temp;
end
integration=integration.*(3.*h./10);
exact_integration=int(f,x,lower_limit,upper_limit);
fprintf('Exact integration : %.8f\n',double(exact_integration))
fprintf('Solution is: %.8f\n',double(integration));
fprintf('Error: %.8f\n',abs(double(integration)-double(exact_integration)))

%%
%4(v)
%Romberg integration
clc;clear all;close all
syms f(x)
f(x)=2./(x.^2+4);
lower_limit=input('Lower limit:');
upper_limit=input('Upper limit:');
d=input('Length of table:')
r=zeros(d)
for j=1:d
n=2.^(j-1)
h=(upper_limit-lower_limit)./n;
integration=f(lower_limit)+f(upper_limit);
for i=1:n-1
    k=lower_limit+i.*h;
    integration=integration+2.*f(k) ;  
end
integration=integration.*(h./2);
r(j,1)=integration;
end
for i=2:d
    for j=2:i
        r(i,j)=(1./3).*(4.*r(i,j-1)-r(i-1,j-1));
    end
end
exact_integration=int(f,x,lower_limit,upper_limit);
fprintf('Exact integration : %.8f\n',double(exact_integration))
fprintf('Solution is: %.8f\n',r(d,d));
fprintf('Error: %.8f\n',abs(r(d,d)-double(exact_integration)))
%%
%5(i)
%By Gaussian Elimination:
clc;clear all;close all
A=[3 -7 -2;-3 5 1;6 -4 0]
b=[-7 ;5 ;2]
a=[A b]
U=a
for k=1:length(A)-1
    for i=k+1:length(A)
        coeff= U(i,k)/U(k,k)
       
       U(i,:)=U(i,:)-coeff*U(k,:)
    end    
end
c=U(:,1:length(A))
solution=linsolve(c,U(:,length(a)))
%%
%alternative
A=[3 -7 -2;-3 5 1;6 -4 0]
b=[-7 ;5 ;2]
sol=rref([A,b])
Solution_x=sol(:,length(A)+1)
%%
%5(ii)
%By LU decomposition:
clc;clear all;close all
A=[3 -7 -2;-3 5 1;6 -4 0]
b=[-7 ;5 ;2]
L=eye(length(A))
U=A
for k=1:length(A)-1
    for i=k+1:length(A)
        coeff= U(i,k)/U(k,k)
       L(i,k)=coeff
       U(i,:)=U(i,:)-coeff*U(k,:)
    end    
end
if (L*U==A)
    fprintf('Pass')
end
y=L^-1*b
solution_x=U^-1*y


   