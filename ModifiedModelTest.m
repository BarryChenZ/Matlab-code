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

%N移除 x2->x4 constant D不可回溯

syms x1 x2 x4 x5 x6;%S E I R D
syms Rc Ro Rs Op Area_k Density Coll P_su P_ni delta delta_ex r lambda omega omega_r;
syms C1 C2 C3 C4 alpha
%C1 = INF_SE + D2D_SE
%C3 = INF_EI + D2D_EI
eq1 = 0 == alpha +lambda*x5-C1*(x4+x2)*x1-delta*x1-r*x1;%S
eq2 = 0 == C1*(x4+x2)*x1-C3*x4*x2-delta*x2-r*x2;%E
eq4 = 0 == C3*x4*x2 -delta*x4-delta_ex*x4-r*x4;%I
eq5 = 0 == r*x4-delta*x5-lambda*x5+r*x1+r*x2;%R
eq6 = 0 == (delta+delta_ex)*x4+delta*(x1+x2+x5)-alpha;%D
%eq6 = 0 == (delta+delta_ex)*x4+delta*(x1+x2)+delta_eff*x4-alpha;%D
%4解 or 2解
[x1,x2,x4,x5] = solve(eq1,eq2,eq4,eq5);
simplify(x1)
simplify(x2)
simplify(x4)
simplify(x5)
%x6 = 1-x1-x2-x4-x5
%simplify(x6)
%threshold

%{
syms R_c P_suc Op_k %INF_SE
syms R_s Area_k Area N %D2D_SE
syms R_o %INF_EI
syms R_d P_EI %D2D_EI, R_d = c
A = [(R_c*P_suc*Op_k + (R_s*Area_k*N)/ Area)*(x2+x4)*x1;
     0];
B = [P_EI*x2 + (Op_k*R_o-R_d*P_EI)*x4*x2 + r*x2 + delta*x2;
     -P_EI*x2 - (Op_k*R_o-R_d*P_EI)*x4*x2 + r*x4 + (delta + delta_ex)*x4];
 A-B
dA=[diff(A, x2), diff(A, x4)]
dB=[diff(B, x2), diff(B, x4)]
dA = [x1*C1, x1*C1;
        0  ,   0]
dB = [P_EI + delta + r + x4*C2, C2*x2;
      - P_EI - x4*C2, delta + delta_ex + r - C2*x2]
dB_inv = inv(dB)
AB_inv = dA*dB_inv
Ans = eig(AB_inv)
S = subs(Ans, [x2,x4], [0,0])%很亂，尚未簡化
simplify(S)
%}

%{
A = [C1*(x2+x4)*x1;
     0];
B = [C3*x4*x2+delta*x2+r*x2;
     -C3*x4*x2 + delta*x4+delta_ex*x4+r*x4];
dA=[diff(A, x2), diff(A, x4)]
dB=[diff(B, x2), diff(B, x4)]
dB_inv = inv(dB)
AB_inv = dA*dB_inv
%simplify(AB_inv)
simplify(eig(AB_inv))
%}

%{
A = [C1*(x2+x4)*x1;
     0];
B = [C3*x2+delta*x2+r*x2;
     -C3*x2+delta*x4+delta_ex*x4+r*x4];
dA=[diff(A, x2), diff(A, x4)]
dB=[diff(B, x2), diff(B, x4)]
dB_inv = inv(dB)
AB_inv = dA*dB_inv
simplify(eig(AB_inv))
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
