%%
%problem image
A = imread('D:\bro code\Mathgramming\Programming with MATLAB\Screenshot 2026-01-15 182455.png');
image(A)

%%
%Solution
clc;close all;clear all
f=[1 1.5]
A=[-1 -2;-2 -3]
b=[-12;-20]
Aeq=[]
beq=[]
lb=[0;0]
ub=[]
[x,fval]  = linprog(f,A,b,Aeq,beq,lb,ub)





