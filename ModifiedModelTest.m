%刪除EN
%{
syms x1 x4 x5 x6;%S I R D
syms Rc Ro Rs Op Area_k Density Coll P_su P_ni delta delta_ex r lambda omega omega_r;
syms C1 C2 C3 C4
eq1 = 0 == lambda*x5+omega*x6-C1*(x4)*x1-C2*(x4)*x1-delta*x1;%S
eq4 = 0 == C1*(x4)*x1+C2*(x4)*x1 -delta*x4-delta_ex*x4-r*x4;%I
eq5 = 0 == r*x4-delta*x5-lambda*x5;%R
eq6 = 0 == (delta+delta_ex)*x4+delta*(x1+x5)-omega*x6;%D
%測試結果兩解
[x1,x4,x5] = solve(eq1,eq4,eq5)
x6 = 1 - x1 - x4 -x5
%}

%D移除 並且x3->x4 參數便constant x2->x4參數變成constant
%{
syms x1 x2 x3 x4 x5;%S E N I R
syms Rc Ro Rs Op Area_k Density Coll P_su P_ni delta delta_ex r lambda omega omega_r;
syms C1 C2 C3 C4 alpha
eq1 = 0 == lambda*(1-x1-x2-x3-x4) -C1*(x2+x4)*x1-C2*x4*x1-r*x1;%S
eq2 = 0 == C1*(x2+x4)*x1- C3*x2 -r*x2;%E
eq3 = 0 == C2*x4*x1-P_ni*x3-r*x3;%N
eq4 = 0 == C3*x2 + P_ni*x3-r*x4;%I
eq5 = 0 == r*x1+r*x2+r*x3+r*x4-lambda*x5;%R

%3解
[x1,x2,x3,x4] = solve(eq1,eq2,eq3,eq4)
x5 = 1-x1-x2-x3-x4
%}

%N移除 x2->x4 constant
%{
syms x1 x2 x4 x5 x6;%S E I R D
syms Rc Ro Rs Op Area_k Density Coll P_su P_ni delta delta_ex r lambda omega omega_r;
syms C1 C2 C3 C4
eq1 = 0 == lambda*x5+omega*(1-x1-x2-x4-x5)-C1*(x2+x4)*x1-C2*x4*x1-delta*x1;%S
eq2 = 0 == C1*(x2+x4)*x1-C3*x4-delta*x2;%E
eq4 = 0 == C3*x4 + C2*x4*x1-delta*x4-delta_ex*x4-r*x4;%I
eq5 = 0 == r*x4-delta*x5-lambda*x5;%R
eq6 = 0 == (delta+delta_ex)*x4+delta*(x1+x2+x5)-omega*x6;%D
%3解
[x1,x2,x4,x5] = solve(eq1,eq2,eq4,eq5)
%x6 = 1-x1-x2-x3-x4-x5
%}

%{
%N移除(x3移除) x2->x4只剩openrate
clear();
syms x1 x2 x3 x4 x5 x6 x7 x8;%S E N I R D E(t) I(t)
syms Rc Ro Rs Op Area_k Density Coll P_su P_ni delta delta_ex r lambda omega omega_r;
syms C1 C2 C3 C4 alpha
eq1 = 0 == omega*(1-x1-x2-x4-x5) + lambda*x5 -C1*x4*x1-C2*x4*x1-delta*x1;%S
eq2 = 0 == C1*x4*x1-C3*x2-delta*x2;%E
%eq3 = 0 == C2*(x3+x4)*x1-P_ni*x3-delta*x3-r*x3;%N
eq4 = 0 == C2*x4*x1 + C3*x2 -delta*x4-delta_ex*x4-r*x4;%I
eq5 = 0 == r*x4-delta*x5-lambda*x5;%R
eq6 = 0 == (delta+delta_ex)*x4+delta*(x1+x2+x5)-omega*x6;%D
%2解
[x1,x2,x4,x5] = solve(eq1,eq2,eq4,eq5)
x6 = 1-x1-x2-x4-x5
%}
