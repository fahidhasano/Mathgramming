%%
%(3[i])
syms x y
y1=exp(x)
y2=x^2
%Intersecting points:
intersect=solve([y==exp(x),y==x^2],[x,y])

xi=intersect.x
disp(vpa(xi,4))
%finding the area
vpa(int(y2-y1,xi(1),xi(2)),4)
%plotting
fplot(y1,[-1 1],'b')
hold on
fplot(y2,[-1 1],'r')
hold off
grid on
title('Plot of e^x and x^2')
xlabel('x');
ylabel('y');
l = legend('e^x','x^2');
title(l,'plotting');
%%
y3=cos(x)
y4=1-cos(x)
intersect1=solve([y == cos(x), y==1-cos(x)], [x, y])
x2=intersect1.x
disp(vpa(x2,4))
area=int(y4-y3,x,0,pi)
disp(vpa(area,4))
fplot(y3,[0 pi],'g')
hold on
fplot(y4,[0 pi],'k')
hold off
grid on
title('Plot of cos(x) and 1-cos(x)')
xlabel('x');
ylabel('y');
l = legend('cos(x)','1-cos(x)');
title(l,'plotting');
