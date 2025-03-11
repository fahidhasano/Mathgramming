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
