%%
%1(a)(i)
%some arbitrary values:
syms t
A=2;
B=3;
a=7;
b=29;
del=34;
xt = @(t) A*sin(a*t+del);
yt = @(t) B*cos(b*t);
figure
fplot(xt,yt)
axis on
%%
%1(a)(ii)
syms t
xt =  @(t)cos(t);
yt =  @(t)sin(t);
dxt= diff(xt,t)
dyt= diff(yt,t)
figure
subplot(2,1,1)
fplot(xt,yt)
title('parametric curve')
xlabel('x')
ylabel('y')
subplot(2,1,2)
t=linspace(0,2*pi,100)
x=cos(t)
y=sin(t)
dx=-sin(t)
dy=cos(t)
quiver(x,y,dx,dy,0.5)
title('tangent vector curve')
xlabel('x')
ylabel('y')
%%
%1(b)(i)
xt = @(t) cos(t);
yt = @(t) sin(t);
zt = @(t) t;
figure
fplot3(xt,yt,zt)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
%%
%1(b)(ii)
xt = @(t) exp(-0.1*t)*cos(t);
yt = @(t) exp(-0.1*t)*sin(t);
zt = @(t) t;
figure
fplot3(xt,yt,zt)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
%%
%1(b)(iii)
xt = @(t) t;
yt = @(t) t^2;
zt = @(t) t^3;
figure
fplot3(xt,yt,zt)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
%%
%1(b)(iv)
xt = @(t) sin(3*t);
yt = @(t) sin(2*t);
zt = @(t) cos(5*t);
figure
fplot3(xt,yt,zt)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
%%
%1(b)(v)
xt = @(t) t*cos(t);
yt = @(t) t*sin(t);
zt = @(t) t;
figure
fplot3(xt,yt,zt)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
%%
clear all;close all;clc;
%1(c)(i)
syms x y
z=x.^2+y.^2;
figure
subplot(3,1,1)
fsurf(z)
colorbar
subplot(3,1,2)
fmesh(z)
colorbar
subplot(3,1,3)
fcontour(z)
colorbar
display('Level curve can be plotted using fsurf or fmesh or fcontour')
%%
%1(c)(ii)
clear all;close all;clc;
syms x y
z =sqrt(16*(1-((x.^2)/9)-((y.^2)/4)));
figure
subplot(3,1,1)
fsurf(z)
colorbar
subplot(3,1,2)
fmesh(z)
colorbar
subplot(3,1,3)
fcontour(z)
colorbar
display('Level curve can be plotted using fsurf or fmesh or fcontour')
%%
%1(c)(iii)
syms x y
z =sqrt(x.^2+y.^2+1);
figure
subplot(3,1,1)
fsurf(z)
colorbar
subplot(3,1,2)
fmesh(z)
colorbar
subplot(3,1,3)
fcontour(z)
colorbar
display('Level curve can be plotted using fsurf or fmesh or fcontour')
%%
%2(i)
clc;clear all;close all;format compact
syms x y
f(x,y)=x.^3-3.*x.*y+y.^3
gradient(f);
[cx,cy]=solve(gradient(f),'real',true);
critical_points=[cx,cy];
fx(x,y)=diff(f,x,2)
D(x,y)=det(hessian(f))
[x,y] = meshgrid(-5:.2:5);
z = (x.^3-3.*x.*y+y.^3);
[DX,DY] = gradient(z);
figure
quiver(x,y,DX,DY,'b')
hold on
C=contour(x,y,z)
hold on
plot(cx,cy,'o','markersize',10,'markerfacecolor','k')
hold on
clabel(C)
hold on

title('Gradient vector fields')

xlabel('x axis')
ylabel('y axis')
axis on
hold off
legend('gradient','contour','critical points','clabel')
for i=1:length(cx)
    if D(cx(i),cy(i))>0 && fx(cx(i),cy(i))>0
        fprintf('f has relative minimum at (%.2f,%.2f,%.2f)\n',cx(i),cy(i),f(cx(i),cy(i)))        
    elseif D(cx(i),cy(i))>0 && fx(cx(i),cy(i))<0      
        fprintf('f has relative maximum at (%.2f,%.2f,%.2f)\n',cx(i),cy(i),f(cx(i),cy(i)))
        
    elseif D(cx(i),cy(i))<0 
        fprintf('f has a saddle point at (%.2f,%.2f,%.2f)\n',cx(i),cy(i),f(cx(i),cy(i)))
        
    elseif D(cx(i),cy(i))==0
        fprintf('no conclusion can be drawn')
    end
end
hold off
%%
%2(i)
%ALTERNATIVE WAY
clc;clear all;close all;format compact
syms x y
f(x,y)=x.^3-3.*x.*y+y.^3
fx=diff(f(x,y),x)
fy=diff(f(x,y),y)
[xc,yc]=solve(fx, fy ,x,y,'Real',true)
fxx=diff(fx,x)
fyy=diff(fy,y)
fxy=diff(fx,y)
D=fxx*fyy-fxy^2
for i=1:length(xc)
fn=subs(f, {x, y}, {xc(i),yc(i)});
d=subs(D, {x, y}, {xc(i),yc(i)});
p=subs(fxx, {x, y}, {xc(i),yc(i)});
if d>0 && p>0 
    fprintf('%d,%d,%s\n',xc(i),yc(i)','minimum')
elseif d>0 && p<0
        fprintf('%d,%d,%s\n',xc(i),yc(i),'maximum')
elseif d<0
    fprintf('%d,%d,%s\n',xc(i),yc(i),'saddle')
elseif d==0
    fprintf('no conclusion')      
end
end
ffunc=matlabFunction(f)
figure
fsurf(ffunc,[-5 0 -5 5],'MeshDensity' ,20)
hold on
plot3(xc,yc,f(xc,yc),'ro','MarkerFaceColor','r','MarkerSize',14)
title('2-D Line Plot')
xlabel('x')
ylabel('y')
zlabel('z')
title('maxmin')
alpha(.5)

[x,y] = meshgrid(-5:0.2:5);
z = x.^3-3.*x.*y+y.^3
[px,py] = gradient(z,.2,.2)
figure
[C,h] = contour(x,y,z)
clabel(C,h)
hold on
quiver(x,y,px,py)
hold on 
scatter(xc,yc)
title('contour')
xlabel('x')
ylabel('cos(5x)')
zlabel('z')
legend('contour','field','critical point')

hold off

%%
%2(ii)
clc;clear all;close all;format compact
syms x y
f(x,y)=x.^4-4.*x.*y+y.^4
gradient(f);
[cx,cy]=solve(gradient(f),'real',true);
critical_points=[cx,cy];
fx(x,y)=diff(f,x,2)
D(x,y)=det(hessian(f))
[x,y] = meshgrid(-5:.2:5);
z = (x.^4-4.*x.*y+y.^4);
[DX,DY] = gradient(z);
figure
quiver(x,y,DX,DY,'b')
hold on
C=contour(x,y,z)
hold on
plot(cx,cy,'o','markersize',10,'markerfacecolor','k')
hold on
clabel(C)
hold on
title('Gradient vector fields')
xlabel('x axis')
ylabel('y axis')
axis on
hold off
legend('gradient','contour','critical points','clabel')
for i=1:length(cx)
    if D(cx(i),cy(i))>0 && fx(cx(i),cy(i))>0
        fprintf('f has relative minimum at (%.2f,%.2f,%.2f)\n',cx(i),cy(i),f(cx(i),cy(i)))        
    elseif D(cx(i),cy(i))>0 && fx(cx(i),cy(i))<0      
        fprintf('f has relative maximum at (%.2f,%.2f,%.2f)\n',cx(i),cy(i),f(cx(i),cy(i)))
        
    elseif D(cx(i),cy(i))<0 
        fprintf('f has a saddle point at (%.2f,%.2f,%.2f)\n',cx(i),cy(i),f(cx(i),cy(i)))
        
    elseif D(cx(i),cy(i))==0
        fprintf('no conclusion can be drawn')
    end
end
hold off
%%
%2(ii)
%ALTERNATIVE WAY
syms x y
f(x,y)=x.^4-4.*x.*y+y.^4
fx=diff(f(x,y),x)
fy=diff(f(x,y),y)
[xc,yc]=solve(fx, fy ,x,y,'Real',true)
fxx=diff(fx,x)
fyy=diff(fy,y)
fxy=diff(fx,y)
D=fxx*fyy-fxy^2
for i=1:length(xc)
fn=subs(f, {x, y}, {xc(i),yc(i)});
d=subs(D, {x, y}, {xc(i),yc(i)});
p=subs(fxx, {x, y}, {xc(i),yc(i)});
if d>0 && p>0 
    fprintf('%d,%d,%s\n',xc(i),yc(i),'minimum')
elseif d>0 && p<0
        fprintf('%d,%d,%s\n',xc(i),yc(i),'maximum')
elseif d<0
    fprintf('%d,%d,%s\n',xc(i),yc(i),'saddle')
elseif d==0
    fprintf('no conclusion')      
end
end
ffunc=matlabFunction(f)
figure
fsurf(ffunc,[-5 0 -5 5],'MeshDensity' ,20)
hold on
plot3(xc,yc,f(xc,yc),'ro','MarkerFaceColor','r','MarkerSize',14)
title('2-D Line Plot')
xlabel('x')
ylabel('y')
zlabel('z')
title('maxmin')
alpha(.5)
[X,Y] = meshgrid(-5:.2:5);
Z = X.*Y.*-4.0+X.^4+Y.^4
[DX,DY] = gradient(Z,.2,.2);
figure
C=contour(X,Y,Z)
hold on
scatter(xc,yc)
hold on
clabel(C)
hold on
quiver(X,Y,DX,DY)
title('Gradient vector fields')
legend('contour','critical points')
xlabel('x axis')
ylabel('y axis')
axis on
hold off
%%
%3(b)
syms x y
a=int(sqrt(9*(1-x^2/16)),0,4)
b=int(sqrt(4*(1-x^2/9)),0,3)
area=4*(a-b)
figure
ezplot(x^2/9+ y^2/4==1)
hold on 
ezplot(x^2/16+ y^2/9==1)
grid on
title('Area between ellipses')
hold off
%%
%3(a)
syms x y
y1=sqrt((9*x.^2-144)/16)
y2=sqrt((16*x.^2-144)/9)
a1=int(y1,x,0,4)
a2=int(y2,x,0,3)
area=4*(a1-a2)
fprintf('the area between hyperbolas is %f ',area)
ezplot(x^2/16- y^2/9==1)
hold on
ezplot(x^2/9- y^2/16==1)
grid on
title('Area between hyperbolas')
hold off