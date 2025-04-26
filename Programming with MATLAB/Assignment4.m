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
%5(i)
%Linear Transformation
x=@(u,v) 4*u-3*v;
y=@(u,v) 2*u+5*v;
T=@(u,v) [x(u,v),y(u,v)];
p=T(4,-1);
disp('T(4,-1):')
disp(p)
