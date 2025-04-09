%%
%1(c)
[x,y]=meshgrid(-6:0.5:6,-6:0.5:6);
s=x+y;  %for slope function f=x+y
L=sqrt(1+s.^2);
figure(1)
quiver(x,y,1./L,s./L,0.5),axis tight
hold on
xlabel 'x', ylabel 'y'
title 'Direction field for dy/dx=x+y'
%%
syms y(x)
p=dsolve(diff(y)==x+y,y(-1)==0)
figure(1)
ezplot(p,[-6,6])
hold on
plot(-1,0,'r.','MarkerSize',10),axis tight 

%%
%same as 1
%Using ode45 without declaring function in another .m file
%2(a)
[x,y]=meshgrid(-10:0.5:10,-10:0.5:10)
s=(exp(-x)-y).*(exp(-x)+2+y)
L=sqrt(1+s.^2)
quiver(x,y,1./L,s./L)
axis tight
hold on
xspan=[2 10];
y0=-1;
[x,y]=ode45(@(x,y) (exp(-x)-y).*(exp(-x)+2+y), xspan, y0);
hold on
plot(x,y,'r-','linewidth',2)
hold on
plot(2,-1,'o','markersize',10,'markerfacecolor','b')
axis tight
hold on
y0=3;
[x,y]=ode45(@(x,y) (exp(-x)-y).*(exp(-x)+2+y), xspan, y0);
hold on
plot(x,y,'r-','linewidth',2)
hold on
plot(2,3,'o','markersize',10,'markerfacecolor','g')
axis tight
%%
%2(b)
fprintf('Plotting a direction field helps because the differential equation\nis quite complicated and nonlinear.An exact analytical solution might be\n very hard or impossible to find. By plotting the direction field, we can\n visually understand the behavior of solutions — for example, where solutions are\n increasing, decreasing, or\n staying constant. It gives a qualitative idea of the system''s\n dynamics without solving it exactly.')
%%
%2(c)
y0=3; %for (2,3)
[x,y]=ode45(@(x,y) (exp(-x)-y).*(exp(-x)+2+y), xspan, y0);
hold on
plot(x,y,'r-','linewidth',2)
hold on
plot(2,3,'o','markersize',10,'markerfacecolor','g')
axis tight
hold off
%%
%Using ode45 by declaring function in another .m file
%2(d)
xspan=[2 10]
y0=3
[x,y] = ode45(@odefun, xspan, y0);
hold on
plot(x,y,'r-','linewidth',2)
hold on
plot(2,3,'o','markersize',10,'markerfacecolor','g')
axis tight
hold on
%%
%4
clc;clear all;
%Using ode45 command
[x,y] = ode45(@vdp1,[0 20],[6; 8]);
plot(x,y(:,1),'-o',x,y(:,2),'-o')
title('Solution of second order ODE with ODE45');
xlabel('x');
ylabel('Solution y');
legend('y_1','y_2')
%%
%Using dsolve command
syms  y(x)
Dy = diff(y);
p=dsolve(diff(y, 2) == 4*diff(y,1)-3*y+9*x.^2+4, y(0) == 1, Dy(0) == 8)
ezplot(p,[0, 20])



