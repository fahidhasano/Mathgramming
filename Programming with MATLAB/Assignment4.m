%%
clc;clear all;close all
%1(a)
u=[-1 2 0 1 ];
v=[-2 1 2 5];
w=[ -1 -3 1 6];
if dot(u+v,w)==dot(u,w)+dot(v,w)
        display('satisfied')
end
%(b)
dot((2*u)-v,u+(2*v))
%(c)
u=[ 1 0 0 ; 0 1 0 ;0 0 1]

dotp=zeros(length(u),length(u));
nor=zeros(1,length(u));
for i=1:length(u)
    nor(i)=norm(u(i,:));
    for j=1:length(u)
        if i~=j
            dotp(i,j)=dot(u(i,:),u(j,:));
        end            
    end
end
p=all(abs(dotp(:))==0);
q=all(abs(nor(length(u)))==1);
if p==1 && q==1
    disp('They form orthonormal basis')
else
    disp('They do not form orthonormal basis')
end
%%
clc;clear all;close all
%2
u=[1/2 1/2 1/2 1/2;1/2 1/2 -1/2 -1/2;1/2 -1/2 -1/2 1/2;1/2 -1/2 1/2 -1/2];
v=[ 1 1 1 1];
s=zeros(1,length(u));
for i=1:length(u)
    s=s+dot(v,u(i,:)).*u(i,:);
    
end
proj_w_v=s
component_v=v-proj_w_v

%%
%3
%using for loop
clc;clear all
A=[-2 3 1; 0 -4 5];
B=[1 2 3 ;4 5 6];
s=0;
for i=1:2
    for j=1:3
       s=s+A(i,j).*B(i,j);        
    end
end
disp('dot product:')
disp(s)
if s==sum(dot(A,B))
    display('verified')
end

sn_A=0;
sn_B=0;
for i=1:2
    for j=1:3
        sn_A=sn_A+A(i,j).*A(i,j);        
                
    end
        
end
for i=1:2
    for j=1:3
        sn_B=sn_B+B(i,j).*B(i,j);        
                
    end
        
end
norm_A=sqrt(sn_A);
disp('||A||')
disp(norm(A))
disp('||B||')
norm_B=sqrt(sn_B);
disp(norm(B))
%%
%using while loop
clc;clear all;close all
A=[-2 3 1; 0 -4 5];
B=[1 2 3 ;4 5 6];
s=0;
i=1;
while i<=2
    j=1   ; 
    while j<=3
       s=s+A(i,j).*B(i,j);
       j=j+1;
    end
    i=i+1 ;   
end
disp('dot product:')
disp(s)
if s==sum(dot(A,B))
    display('verified')
end

sn_A=0;
sn_B=0;
i=1;
while i<=2
    j=1;
    while j<=3
        sn_A=sn_A+A(i,j).*A(i,j);
        j=j+1;                
    end
    i=i+1;     
end
i=1;
while i<=2
    j=1;
    while j<=3
        sn_B=sn_B+B(i,j).*B(i,j);        
         j=j+1;     
    end
   i=i+1;   
end
norm_A=sqrt(sn_A);
disp('||A||')
disp(norm(A))
disp('||B||')
norm_B=sqrt(sn_B);
disp(norm(B))

%%
%4
clc;clear all
v=[0 2 1 0; 1 -1 0 0; 1,2,0,1;1 0 0 1];
u=zeros(length(v));
u(1,:)=v(1,:)./norm(v(1,:));
for i=2:length(v)
    u(i,:)=v(i,:);
    for j=1:i-1
        
        u(i,:)=u(i,:)-(dot(u(i,:),u(j,:))).*u(j,:);
    end
    u(i,:)=u(i,:)./norm(u(i,:));
end
sym(u)
%%
%5(i)
clc;clear all
syms u v
x(u,v)= 4.*u-3.*v;
y(u,v)= 2.*u+5.*v;
T(u,v)=[ x(u,v),y(u,v)];
disp('T(4,-1):')
disp(T(4,-1))
%5(ii)
for u=-3:3
    for v=-2:2        
       fprintf('T(%d,%d)=(%d,%d)\n',u,v,x(u,v),y(u,v))
    end
end
%%
%6
clc;clear all
u=[1 1 1; -2/3 1/3 1/3; 0 -1/2 1/2];
v=[1 2 3];
s=zeros(1,3);
for i=1:3
    s=s+((dot(v,u(i,:))/dot(u(i,:),u(i,:)))*u(i,:));
    
end
s

%%
%7
clc;clear all;close all
u1=[1 -2 3 -4];
u2=[2 1 -4 -3];
u3=[-3 4 1 -2];
u4=[4 3 2 1];
v=[-1 2 3 7];
s=[u1;u2;u3;u4];

for i =1:4
    a(i)=dot(v,s(i,:));
    
end
v1=mat2str(v);
v2=mat2str(u1);
v3=mat2str(u2);
v4=mat2str(u3);
v5=mat2str(u4);
fprintf('%s=%d%s+%d%s+%d%s+%d%s\n',v1,a(1),v2,a(2),v3,a(3),v4,a(4),v5)
fprintf('%s(s)=(%d,%d,%d,%d)\n',v1,a(1),a(2),a(3),a(4))

%%
%8
clc;clear all
syms x y z
f(x,y,z)= -5*x^2+2*y^2+4*x*y-5*y*z-4*x*z+z^2;
X=[x;y;z];
A=[-5 2 -2;2 2 -5/2;-2 -5/2 1 ];
Q(x,y,z)=simplify(transpose(X)*A*X);

if f==Q
    display('verified')
else
    display('not identical')
end
Q(0,-2,2)



