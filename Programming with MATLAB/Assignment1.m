%%
%1
syms x
f(x)=sin(x)./x
g(x)=log(x+1)./(x+1)
limf=limit(f(x),x,0) 
figure
fplot(f(x),[-10 10],'b')
hold on
fplot(g(x),[-10 10],'r')
plot(0, 1, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')%f(0)
plot(0, 0, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b')%g(0)
hold off
grid on
title('graphs of f(x) and g(x)')
xlabel('x');
ylabel('functions(x)');
l = legend('f(x)','g(x)','limit of f(x)','limit of g(x)');
title(l,'brief description')
%%
%2(a)
f(x)= 6*x.^4-12*x.^3+8*x.^2-4*x
f1(x)=diff(f,x,1)
f2(x)=diff(f,x,2)
%intervals of increasing and decreasing
ii=solve(f1>0,'returnconditions',true,'real',true)
increasing_interval=ii.conditions
di=solve(f1<0,'returnconditions',true,'real',true)
decreasing_interval=di.conditions

%local maxima and minima:
critical_points=double(solve(f1==0,x,'real',true))
critical_points_number=numel(critical_points)
for i=1:length(critical_points)
    if f2(critical_points(i))>0
        fprintf('minima at (%.2f,%.2f)\n\n',critical_points(i),f(critical_points(i)))
    elseif f2(critical_points(i))<0
        fprintf('maxima at (%.2f,%.2f)\n\n',critical_points(i),f(critical_points(i)))
    end
end
%concavity checking:
inflection_points=double(solve(f2==0,x,'real',true))
inflection_points_number=numel(inflection_points)
cu=solve(f2>0,'returnconditions',true,'real',true)
concave_up=cu.conditions
cd=solve(f2<0,'returnconditions',true,'real',true)
concave_down=cd.conditions
%Plotting
figure
fplot(f,'r','linewidth',2)
hold on
fplot(f1,'g','linewidth',2)
hold on
fplot(f2,'b','linewidth',2)
hold on
plot(critical_points(1),f(critical_points(1)),'o','markersize',8,'markerfacecolor','k')
plot(inflection_points(1),f(inflection_points(1)),'o','markersize',8,'markerfacecolor','b')
plot(inflection_points(2),f(inflection_points(2)),'o','markersize',8,'markerfacecolor','b')
grid on
axis([-2,2,-5,5])
title('graph of the f(x) function and its first and second derivatives ')
xlabel('time');
ylabel('population growth ');
l = legend('f(x)','df(x)/d(x)','d^2(f(x))/dx^2','critical points','inflection points');
title(l,'Brief description of graph')
%%
%2(b)
clear all; close all;clc
syms t c
T(t)= -2*t.^3+9*t.^2-12*t+25
T1(c)=diff(T(c),c,1)
a=0;
b=6;
avg_rate=(T(b)-T(a))/(b-a)
mvt=double(solve(T1(c)==avg_rate,c))
for i=1:length(mvt)
    if a<=mvt(i) && mvt(i)<=b
        fprintf('mvt satisfied at c=%.2f seconds\n\n',mvt(i))
        c1=mvt(i)
    end
end
fprintf('As T(t) a polynomial and has a continuous graph in [0,6],differentiable within (0,6) and there is a point c =%.2f where mean value theorem is satisfied within [0,6] ',c1)
sec=T(a)+avg_rate.*(t-a)
tan=T(c1)+T1(c1).*(t-c1)
figure
fplot(T,'r',[0,6],'linewidth',4)
hold on
fplot(sec,'g',[0 6],'linewidth',4)
hold on
fplot(tan,'k',[0 6],'linewidth',4)
hold on
plot(c1,T(c1),'o','markersize',10,'markerfacecolor','b')
hold on
plot(a,T(a),'o','markersize',10,'markerfacecolor','y')
hold on
plot(b,T(b),'o','markersize',10,'markerfacecolor','y')
title('Temperature modelling')
xlabel('Time in hours')
ylabel('Temperature')
l = legend('function','Secant line','Tangent line','mean value theorem point(tangent point)','secant line points');
title(l,'Tracking the temperature changes')
grid on
fprintf('Interpreting result: The time c=3.79 hours represents the moment\nwhen the instantaneous rate of change of temperature equals the average rate of \nchange over the 6-hour period.This point indicates when the temperature is changing at the same rate as the overall trend.Understanding this can help in predicting and controlling temperature fluctuations,\nensuring that storage conditions remain stable by adjusting cooling or heating systems at critical times.')

%%
%2(c)
clc;clear all; close all
syms t
f(t)= 50*exp(0.2*t)-10*t.^2
growth_rate(t)=diff(f,t,1)
acceleration_growth_or_decay(t)=diff(f,t,2)
ii=solve(growth_rate>0,'returnconditions',true,'real',true)
population_increasing_interval=ii.conditions
di=solve(growth_rate<0,'returnconditions',true,'real',true)
population_decreasing_interval=di.conditions
critical_points=double(solve(growth_rate==0,t,'real',true))
critical_points_number=numel(critical_points)
for i=1:length(critical_points)
    if acceleration_growth_or_decay(critical_points(i))>0
        fprintf('minima at (%.2f,%.2f)\n\n',critical_points(i),f(critical_points(i)))
    elseif acceleration_growth_or_decay(critical_points(i))<0
        fprintf('Population reaches its maximum size at (%.2f,%.2f) point\n\n',critical_points(i),f(critical_points(i)))
    end
end
cu=solve(acceleration_growth_or_decay>0,'returnconditions',true,'real',true)
growth_rate_increasing_interval=cu.conditions
cd=solve(acceleration_growth_or_decay<0,'returnconditions',true,'real',true)
growth_rate_decreasing_interval=cd.conditions
inflection_points=double(solve(acceleration_growth_or_decay==0,t,'real',true))
fprintf('Biological significance:\nSince t=11.51 is outside the interval [0,10], there are no points of inflection within this interval. However, if the interval were extended, the point of inflection would indicate a change in the concavity of P(t), signifying a shift in the growth trend from accelerating to decelerating or vice versa.')
fprintf('Discussing about how this information can be used to optimize the conditions for bacterial growth in the lab:\nMaximizing Population Size:\nBy identifying the time t max when the population reaches its maximum, lab conditions can be adjusted to sustain growth up to this point.\nGrowth Rate Management:\n Understanding when the growth rate is increasing or decreasing helps in optimizing nutrient supply and environmental conditions to maintain an optimal growth rate.\nInflection Points:\n Although not within the interval, knowing where growth trends change can help in long-term planning and resource allocation to prevent growth stagnation or decline.\nBy analyzing P(t), P(t),P1(t) and P2(t)the biotech company can make informed decisions to optimize bacterial growth conditions, ensuring efficient and sustainable colony expansion.\n')
figure
fplot(f,[0 10],'r','linewidth',2)
hold on
fplot(growth_rate,[0 10],'g','linewidth',2)
hold on
fplot(acceleration_growth_or_decay,[0 10],'b','linewidth',2)
hold on
plot(critical_points(1),f(critical_points(1)),'o','markersize',8,'markerfacecolor','k')
plot(inflection_points(1),f(inflection_points(1)),'o','markersize',8,'markerfacecolor','b')
grid on
%axis([-2,2,-5,10])

%display('Discuss how this information can be used to optimize the conditions for bacterial growth in the lab:\nMaximizing Population Size:\nBy identifying the time t max when the population reaches its maximum, lab conditions can be adjusted to sustain growth up to this point.\nGrowth Rate Management:\n Understanding when the growth rate is increasing or decreasing helps in optimizing nutrient supply and environmental conditions to maintain an optimal growth rate.\nInflection Points:\n Although not within the interval, knowing where growth trends change can help in long-term planning and resource allocation to prevent growth stagnation or decline.\nBy analyzing P(t), P(t),P1(t) and P2(t)the biotech company can make informed decisions to optimize bacterial growth conditions, ensuring efficient and sustainable colony expansion.\n')
title('The growth rate of a bacterial colony in a controlled field')
xlabel('time(in hours)');
ylabel('size of colony');
l = legend('function','growth rate','acceleration of growth or decay','maximum point','change of growth rate (growth trends)','Location','southwest');
title(l,'graph of modelling')

%%
%(3[i])
clc;clear all;close all;
syms x
y1=exp(x)
y2=x.^2
figure
fplot(y1,'r','linewidth',4)
hold on
fplot(y2,'b','linewidth',4)
grid on
intersection=double(solve(y1==y2,x))
area=double(int(y1-y2,x,intersection(1),intersection(2)))
title('Plot of e^x and x^2')
xlabel('x');
ylabel('y');
l = legend('e^x','x^2');
title(l,'plotting');
%%
% 3(ii)
clc;clear all;close all;
syms x
y3=cos(x)
y4=1-cos(x)
figure
fplot(y3,'r','linewidth',4)
hold on
fplot(y4,'b','linewidth',4)
axis([-1 4 -4 4])
grid on
intersection=solve(y3==y4,x)
area=int(y3-y4,x,0,pi/3)+int(y4-y3,x,pi/3,pi)
clear x
x=0:0.02:pi;
y3=cos(x);
y4=1-cos(x);
patch([x,flip(x)],[y3,flip(y4)],'y')
title('Plot of cos(x) and 1-cos(x)')
xlabel('x');
ylabel('y');
l = legend('cos(x)','1-cos(x)');
title(l,'plotting');
