% problem 19.3
clc
clear all
close all
global fcount % to count function evaluations
LB=[-5 -5 -5]; %Lower bound
UB=[5 5 5]; %Upper bound
A = []; %LHS matrix for linear inequalities
b = []; %RHS vector for linear inequalities
Aeq = []; %LHS matrix for linear equalities
beq = []; %RHS vector for linear equalities
fcount = 0; %Initialize function count
nvars = 3; % Number of design variables
options = gaoptimset("PopulationSize",600);
[X FVAL] = gamultiobj(@objfun,nvars,A,b,Aeq,beq,LB,UB,options)
plot(FVAL(:,1),FVAL(:,2),".b")

function f= objfun(x)
global fcount
fcount = fcount+1;
f(1)= -10*(exp(0.2* sqrt(x(1)^2+x(2)^2))+exp(0.2* sqrt(x(2)^2+x(3)^2)));
f(2)= (abs(x(1))^0.8+5*(sin(x(1)))^3) + (abs(x(2))^0.8+5*(sin(x(2)))^3) ...
    + (abs(x(3))^0.8+5*(sin(x(3)))^3);
end