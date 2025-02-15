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
%1(c)(i)
f = @(x,y) x^2+y^2;
figure
fsurf(f,[-3 3],'ShowContours','on')
hold on
fmesh(f,[-3 3],'ShowContours','on')
hold off
%%
%1(c)(ii)
f = @(x,y) sqrt(16*(1-x^2/9-y^2/4));
figure
fsurf(f,[-3 3],'ShowContours','on')

hold on
fmesh(f,[-3 3],'ShowContours','on')
hold on
hold off

%%
%1(c)(iii)
f = @(x,y) sqrt(x^2+y^2+1);
figure
fsurf(f,[-3 3],'ShowContours','on')
hold on
fmesh(f,[-3 3],'ShowContours','on')
hold off











%%
%2(i)
syms x y
f(x,y)=x^3-3*x*y+y^3
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
syms x y
f(x,y)=x^4-4*x*y+y^4
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
s=solve([x^2/16-y^2/9==1, x^2/9-y^2/16== 1], [x,y]);
s.x
area=int((sqrt(16*(x^2/9-1))-sqrt(9*(x^2/16-1))),0,12/5)
display('the area is not real number so there is no area between the two hyperbolas')
figure

ezplot(x^2/16- y^2/9==1)
hold on
ezplot(x^2/9- y^2/16==1)
grid on
title('Area between hyperbolas')
hold off