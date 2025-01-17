

%%
%2(b)
syms t c
T(t)=-2*t^3+9*t^2-12*t+25
a=0;
b=6;
tan_slope(c)=diff(T(c),c)
avg_slope=(T(6)-T(0))/(6-0)
solv=vpa(solve(tan_slope==avg_slope,c),4)
for i=1:length(solv)
    if solv(i)>=a && solv(i)<=b
        
        mvc=vpa(solv(i),4);
        disp(mvc)
    
    end
end

display(['c:',num2str(3.791)])
%secant line equation :
values=linspace(a,b,1000)
sec_line=T(a)+avg_slope*(values-a)
%tangent line equation:
tan_line=T(mvc)+tan_slope(mvc)*(values-mvc)
VALUES=T(values);
%plotting

figure
hold on;

plot(values,VALUES,'c')
plot(values,sec_line,'r')
plot(values,tan_line,'k')
scatter(mvc,T(mvc),'ko','filled')
scatter([a,b],[T(a),T(b)],'yo','filled')
title('Temperature modelling')
xlabel('Time in hours')
ylabel('Temperature')
l = legend('function','Secant line','Tangent line');
title(l,'Tracking the temperature changes')
grid on
hold off
avg_temp=(T(6)-T(0))/(6-0)
% interpreting the result:
fprintf('The point c represents the time where the rate of temperature change equals the average rate of change over the interval.\nThis can help monitor when rapid changes in temperature occur,aiding in maintaining stable storage.\nThis will help tweaking temperature when it is mandatory')


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
% 3(ii)
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
