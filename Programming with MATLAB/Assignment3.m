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
hold on
syms y(x)
p=dsolve(diff(y)==x+y,y(-1)==0)
hold on
ezplot(p,[-6,6])
hold on
plot(-1,0,'o','MarkerSize',7,'markerfacecolor','b'),axis tight 
legend('direction field of the DE','solution curve passing through (-1,0)','(-1,0) point')
hold off
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
plot(x,y,'b-','linewidth',2)
hold on
plot(2,3,'o','markersize',10,'markerfacecolor','g')
axis tight
legend('direction field','solution curve for y(2)=-1','(x,y)=(2,-1)','solution curve for y(2)=3','(x,y)=(2,3)')
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
plot(x,y,'k-','linewidth',2)
hold on
plot(2,3,'o','markersize',10,'markerfacecolor','g')
axis tight
hold off
%%
%3
clc;clear all
syms Q(t) Q0 k
general_solution=dsolve(diff(Q,t)==-k*Q,Q0==Q(0))
half_life_eq=subs(general_solution,t,1500)==Q0/2
k_solution= solve(half_life_eq,k)
fprintf('Decay constant k is: %f\n',k_solution)
Q_sol_k=subs(general_solution,k,k_solution)
time_3q0by4=solve(Q_sol_k==3*Q0/4,t)
fprintf('The time(years) of when \nthe original amount be reduced to 3Q0/4 is: %f years\n',time_3q0by4)
Q_2000=subs(Q_sol_k,t,2000)
fprintf('Amount left after 2000 years: %s\n',Q_2000)
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
%%
%5
clc;clear all;close all;format compact
syms t
K=106;
r=0.71;
P0=0.25*K;
P(t)=(K.*P0)./(P0+(K-P0).*exp(-r.*t));
fprintf('Biomass after 2years is: %f kg\n',P(2))
tau=solve(P(t)==0.75*K,t)
fprintf('Time for P(t)=0.75K is: %f years\n',tau)
t1=solve(diff(P,t,2)==0,t)
fprintf('Time for population growing fastest is: %f years\n',t1)
t = linspace(0, 10, 100); % 0 to 10 years
figure;
plot(t,P(t),'k','linewidth',3)
grid on
xlabel('time(years)')
ylabel('biomass(kg)')
title('Logistic model of the halibut population growth')
hold on
plot(2,P(2),'o','markersize',10,'markerfacecolor','b')
hold on
plot(tau,0.75*K,'o','markersize',10,'markerfacecolor','g')
hold on
plot(t1,K/2,'o','markersize',10,'markerfacecolor','r')
legend('graph of population P(t)','biomass after 2 years point','0.75K point','fastest growth')
hold off