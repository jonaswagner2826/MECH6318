clc
clear
close all
% Define Linear constraints
A=[ ];
B=[ ];
Aeq=[];
Beq=[];
% Define bounds constraints
% x1 x2 x3
LB=[-5 -5 -5];
UB=[5 5 5];
% Define an initial guess
x0=[0 0 0];
% Define optimization options
options=optimset("largescale","off","MaxFunEvals",600000,"display", ...
"off","MaxIter",1e6);
% Pareto Frontier with 1000 evenly spaced weights between zero and one
j=1;
for i=0:0.001:1
w1=i;
w2=1-i;
parameters=[w1 w2];
% Optimization function fmincon
[xopt,fopt]=fmincon(@(x)Q213_Func(x,parameters), x0, A, B, Aeq, Beq, LB, UB, ...
@(x)Q213_cons(x,parameters), options);
x=xopt;
f1plot(j)= -10*(exp(0.2* sqrt(x(1)^2+x(2)^2))+exp(0.2* sqrt(x(2)^2+x(3)^2)));
f2plot(j)= (abs(x(1))^0.8+5*(sin(x(1)))^3) + (abs(x(2))^0.8+5*(sin(x(2)))^3) ...
+(abs(x(3))^0.8+5*(sin(x(3)))^3);
j=j+1
end

f(2)= (abs(x(1))^0.8+5*(sin(x(1)))^3) + (abs(x(2))^0.8+5*(sin(x(2)))^3) ...
+(abs(x(3))^0.8+5*(sin(x(3)))^3);

plot (f1plot, f2plot, "*");
xlabel("objective 1");
ylabel("objective 2");


%% Objective function
function [f]=Q213_Func(x, parameters)
% Break out design variables
% Break out the constants
w1=parameters(1);
w2=parameters(2);
% Objective function
f1= -10*(exp(0.2* sqrt(x(1)^2+x(2)^2))+exp(0.2* sqrt(x(2)^2+x(3)^2)));
f2= (abs(x(1))^0.8+5*(sin(x(1)))^3) + (abs(x(2))^0.8+5*(sin(x(2)))^3) ...
+(abs(x(3))^0.8+5*(sin(x(3)))^3);
f=w1*f1+w2*f2;
end

%% Constraints
function [C Ceq]=Q213_cons(x,parameters)
% Break out design variables
% Define inequality constraints
C = [];
% Define equality constraints
Ceq=[];
end