%%
%1
syms x
f(x)=sin(x)/x
g(x)=log(x+1)/x+1
limf=limit(f(x),x,0) 
limg=limit(g(x),x,0) 
figure
fplot(f(x),[-10 10],'b')
hold on
fplot(g(x),[-10 10],'r')
scatter(limf,f(limf),'r','filled')
scatter(limg,g(limg),'k','filled')
hold off
grid on
title('graphs of f(x) and g(x)')
xlabel('x');
ylabel('functions(x)');
l = legend('f(x)','g(x)','limit of f(x)','limit of g(x)');
title(l,'brief description')
%%
%2(a)
syms x c
func=matlabFunction(6*x^4-12*x^3+8*x^2-4*x);
first_derivative=matlabFunction(diff(func,x,1));
second_derivative=matlabFunction(diff(func,x,2));
%intervals of increasing and decreasing
extreme_points=double(solve(diff(func,x,1)==0,x));
inflection_points=double(solve(diff(func,x,2)==0,x));
%plotting
figure
fplot(func,[-2 2],'r','LineWidth',2)
hold on
fplot(first_derivative,[-2 2],'b','LineWidth',2)
fplot(second_derivative,[-2 2],'k','LineWidth',2)
scatter(inflection_points,func(inflection_points),'r','filled')
scatter(extreme_points,func(extreme_points),'g','filled')
hold off
grid on
title('graph of the f(x) function and its first and second derivatives ')
xlabel('time');
ylabel('population growth ');
l = legend('f(x)','df(x)/d(x)','d^2(f(x))/dx^2','inflection points','extremas');
title(l,'Brief description of graph')

%local maxima and minima:
for i=1:length(extreme_points)
    left_slope=first_derivative(extreme_points(i)-0.01)
    right_slope=first_derivative(extreme_points(i)+0.01)
    if left_slope>0 && right_slope<0
        fprintf('Local maxima exists at x=%f',extreme_points(i))
    elseif left_slope<0 && right_slope>0
        
        fprintf('Local minima exists at x=%f',extreme_points(i))
        
        
    end
end
%concavity checking:
for i=1:length(inflection_points)
    left_inflection=second_derivative(inflection_points(i)-0.01)
    right_inflection=second_derivative(inflection_points(i)+0.01)
    if left_inflection* right_inflection<0
        fprintf('concavity exists at x=%f',inflection_points(i))
    end
    
end


%%
%2(b)
syms t c
T=matlabFunction(-2*t^3+9*t^2-12*t+25)
first_derivative=matlabFunction(diff(T,t,1))
a=0
b=6
avg_rate=(T(b)-T(a))/(b-a)
values_of_c=double(solve(first_derivative(c)==avg_rate,c))
%since T(t) is a polynomial so it is continuous in [0,6] and differentiable in (0,6) so mean value theorem
%is satisfied
for i=1:length(values_of_c)
    if a<=values_of_c(i) && b>=values_of_c(i)
        mvc=values_of_c(i)
        fprintf('Mean value theorem is satisfied at c=%f',mvc)
    end
end
%equations
secant_line=T(a)+avg_rate*(t-a)
tangent_line=T(mvc)+avg_rate*(t-mvc)
%plotting
figure
fplot(T,[0 6],'r','LineWidth',2)
hold on
fplot(secant_line,[0 6],'b','LineWidth',2)
fplot(tangent_line,[0 6],'k','LineWidth',2)
scatter(mvc,T(mvc),'g','filled')
scatter([a,b],[T(a),T(b)],'c','filled')
title('Temperature modelling')
xlabel('Time in hours')
ylabel('Temperature')
l = legend('function','Secant line','Tangent line','mean value theorem point','secant line points');
title(l,'Tracking the temperature changes')
grid on
hold off
avg_temp=(T(6)-T(0))/(6-0)
% interpreting the result:
fprintf('The point c represents the time where the rate of temperature change equals the average rate of change over the interval.\nThis can help monitor when rapid changes in temperature occur,aiding in maintaining stable storage.\nThis will help tweaking temperature when it is mandatory')


%%
%2(c)
syms t
P(t)= 50*exp(0.2*t)-10*t^2
growth_rate=matlabFunction(diff(P(t),t,1))
acceleration=matlabFunction(diff(P(t),t,2))
Time_of_maximum_growth=double(solve(diff(P(t),t,1)==0,t))
Time_of_growth_acceleration=double(solve(diff(P(t),t,2)==0,t))
for i=1:length(Time_of_maximum_growth)
    lhl=growth_rate(Time_of_maximum_growth(i)-0.01)
    rhl=growth_rate(Time_of_maximum_growth(i)+0.01)
    if lhl>0 && rhl<0
        fprintf('maximum exist in %f',Time_of_maximum_growth(i))
    elseif lhl<0 && rhl>0
        fprintf('minimum exist in %f',Time_of_maximum_growth(i))
    
    end
end
%plotting
figure
hold on
fplot(P(t),[0 10],'r','LineWidth',2);
hold on
fplot(growth_rate,[0 10],'b','LineWidth',2);
fplot(acceleration,[0 10],'k','LineWidth',2);
scatter(Time_of_maximum_growth,P(Time_of_maximum_growth),'c','filled','d')
scatter(Time_of_growth_acceleration,P(Time_of_growth_acceleration),'m','filled','d')
hold off
grid on
title('The growth rate of a bacterial colony in a controlled field')
xlabel('time(in hours)');
ylabel('size of colony');
l = legend('function','growth rate','acceleration of growth or decay','maximum point','growth trend','Location','southwest');
title(l,'graph of modelling')

% Remarks
fprintf('\nThis analysis helps identify the time period for \n the fastest growth and when growth slows down . \n Conditions like nutrient supply can be provided.\nThis will consequently optimize the peak growth during accelerating phase. ')

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
figure
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
%calculating area
area=int(y4-y3,x,0,pi)
disp(vpa(area,4))
%plotting
figure
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
