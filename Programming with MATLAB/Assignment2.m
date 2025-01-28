%%
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
%%
[X,Y] = meshgrid(-2:.2:2);
Z = x^3-3*x*y+y^3;
[DX,DY] = gradient(Z,.2,.2);

figure
contour(X,Y,Z)
hold on
quiver(X,Y,DX,DY)
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
%%


