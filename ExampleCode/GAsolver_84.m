% This code sovles the problem using GA
clear;clc;
% linear constraints
A=[ ]; B=[ ]; Aeq=[]; Beq=[];
% lower and upper constraints
LB=[-100 -100 -100];
UB=[100 100 100];
% Number of design variables
nvars = 3;
% to count the number of function evaluations
global k
k = 1;
% Optimization function ga
[xopt,fopt] = ga(@objfun,nvars,A,B,Aeq,Beq,LB,UB,@confun);
display(xopt);
display(fopt);


% objective function
function [f]=objfun(x)
global k
k = k+1
x1=x(1);
x2=x(2);
x3=x(3);
f = 5*x1^2 - 23*x1* x2 - 9*x2^2 + 9*x3^2 + 15;
end

function [C Ceq]=confun(x)
x1=x(1);
x2=x(2);
x3=x(3);
% inequality constraints
C = x1* x3 - 100;
% equality constraints
Ceq(1) = x1^2 + x2^2 - 10;
Ceq(2) = 3* x1 + 4* x3 - 100;
end