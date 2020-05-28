%Symbolic
%syms x y %未代值的x,y
%diff(f)
%int(f)
%limit(f,x,0) lim_{x->0}
%symsum(f,0,k) % k can be constant value or inf
%expand(f) % 展開多項式
%simple(f) % 簡化
%solve(f,f,f,...)  % 解聯立
%quad(f, a, b) %數值積分 a to b
clear

%有free　有threshold 只是有點醜
syms x1 x2 x3 x4 x5 x6 x7 x8;%S E N I R D E(t) I(t)
syms Rc Ro Rs Op Area_k Density Coll P_su P_ni delta delta_ex r lambda omega omega_r;
syms C1 C2 C3 C4
eq1 = 0 == lambda*x5+omega*x6-C1*(x2+x4)*x1-C2*(x3+x4)*x1-delta*x1;%S
eq2 = 0 == C1*(x4)*x1-C3*x4*x2-delta*x2;%E
eq3 = 0 == C2*(x4)*x1-(1-C4*x4)*P_ni*x3-delta*x3;%N
eq4 = 0 == C3*x4*x2+(1-C4*x4)*P_ni*x3-delta*x4-delta_ex*x4-r*x4;%I
eq5 = 0 == r*x4-delta*x5-lambda*x5;%R
eq6 = 0 == (delta+delta_ex)*x4+delta*(x1+x2+x3+x5)-omega*x6;%D
eq7 = x6 == 1-x2-x3-x4-x5;
%stationary point not free
%[x1,x2,x3,x4,x5,x6] = solve(eq1,eq2,eq3,eq4,eq5,eq6)
%x6 = 1-x1-x2-x3-x4-x5
%(x2+x4) = D1, (x3+x4) = D2, (x4) = D3
%Threshold
%{
A=[C1*(x2+x4)*x1;
   C2*(x3+x4)*x1;
   0
   ];
B=[C3*x4*x2+delta*x2;
   C4*x4*P_ni*x3+delta*x3;
   -C3*x4*x2-C4*x4*P_ni*x3+delta*x4+r*x4
  ];

dA=[diff(A, x2), diff(A, x3), diff(A, x4)];

dB=[diff(B, x2), diff(B, x3), diff(B, x4)]
dB_inv = inv(dB)

B_tmp = subs(dB, [x2,x3,x4], [0,0,0]);
B_tmp_inv = inv(B_tmp);

C = subs(inv(dB), [x2,x3,x4], [0,0,0])

AB_inv = dA*dB_inv
AB_tmp = dA*B_tmp_inv;
AC = dA*C

eig(AB_inv);
D = subs(eig(AB_inv), [x2,x3,x4], [0,0,0])
eig(AC)
%}
%free solve1

eq1 = 0 == omega*(1-x1-x5) + lambda*x5 - delta*x1;
eq5 = 0 == -delta*x5 - lambda*x5;
eq6 = 0 ==  delta * (x1 +x5) - omega *(1-x1-x5);
eq7 = 1 == x1 + x5 + x6;
[x1,x5] = solve(eq1,eq5);
simplify(x1)
simplify(x5)
x6 = simplify(1 - x1 -x5)

%其中一篇 都ok
%syms x1 x2 x3 x4 x5 %s c i Q(A) r
%syms a v epsilon delta b_c b_I r beta N
%eq1 = 0 == -a*x1*(x3 + x2)-v*x1+epsilon*(1-x1-x2-x3-x4); 
%eq2 = 0 == a*(1-delta)*x1*(x3+x2)-b_c*x2;
%eq3 = 0 == a*delta*x1*(x3+x2)-b_I*x3-r*x3;
%eq4 = 0 == r*x3-beta*x4;
%eq5 = 0 == b_c*x2+b_I*x3+beta*x4+v*x1-epsilon*x5;
%[x1,x2,x3,x4] = solve(eq1,eq2,eq3,eq4)
%A = [a*(1-delta)*x1*(x3+x2);
    %a*delta*x1*(x3+x2);
    %0];
%B = [b_c*x2;
    %b_I*x3+r*x3;
    %-r*x3+beta*x4];
%dA=[diff(A, x2), diff(A, x3), diff(A, x4)];
%dB=[diff(B, x2), diff(B, x3), diff(B, x4)];
%dB_inv = inv(dB);
%AB_inv = dA*dB_inv;
%subs(AB_inv, x1, (N*epsilon)/(v+epsilon));
%simplify(subs(eig(AB_inv), x1, (N*epsilon)/(v+epsilon)))%對的
%其中一篇 free check ok/ not free ok(24)
%syms x1 x2 x3 x4 x5 %V C Q P S
%syms phi_QV phi_QP phi_QS phi_PV phi_PS phi_VC phi_VP phi_VS phi_CQ phi_CP phi_CS
%syms X Varsigma Varphi alpha epsilon delta
%syms k l mu
%eq1= 0 == phi_QV*x3+phi_PV*x4-phi_VC*Varsigma*Varphi*delta*epsilon*x2*x1-phi_VP*x1-phi_VS*x1;
%eq2= 0 == phi_VC*Varsigma*Varphi*delta*epsilon*x2*x1-phi_CQ*x2-phi_CP*x2-phi_CS*x2;
%eq3= 0 == phi_CQ*x2-phi_QV*x3-phi_QP*x3-phi_QS*x3;
%eq4= 0 == alpha+phi_VP*x1+phi_CP*x2+phi_QP*x3-phi_PS*x4-phi_PV*x4;
%eq5= 0 == phi_VS*x1+phi_CS*x2+phi_QS*x3+phi_PS*x4-alpha;
%[x1,x2,x3,x4,x5]=solve(eq1,eq2,eq3,eq4,eq5)
%simplify(x1)%v 如果多乘C 會得到(23)結果
%simplify(x2)%C 這邊看的出來(25)是對的, 最大的問題是(24,26)怎來
%simplify(x2) 
%simplify(x4) %OK
%simplify((x4-alpha/phi_PS+((phi_CQ+phi_CP+phi_CS)*phi_VS)/(phi_PS*phi_VC*Varsigma*Varphi*delta*epsilon))/x2)
%simplify((x2*(phi_VC*Varsigma*Varphi*delta*epsilon*((phi_QV+phi_QP+phi_QS)*phi_CS*phi_PV+phi_QS*phi_CS*phi_PV+(phi_CQ+phi_CP+phi_CS)*(phi_QV+phi_QP+phi_QS)*phi_PS-phi_QV*phi_CQ*phi_PS)))/(phi_QV+phi_QP+phi_QS)-alpha*phi_PV*phi_VC*Varsigma*Varphi*(phi_VC*Varsigma*Varphi*delta*epsilon))
%其中一篇 free ok/ not free ok / threshold ok
%syms x1 x2 x3 x4 x5%S N I R D
%syms phi_RS phi_RD phi_SN phi_SR phi_SD phi_NI phi_NR phi_ND phi_IR phi_ID
%syms omega mu alpha delta m k
%eq1= 0 == phi_RS*x4-phi_SN*alpha*delta*k*x3*x1-phi_SR*x1-phi_SD*x1;
%eq2= 0 == phi_SN*alpha*delta*k*x3*x1-phi_NR*x2-phi_NI*x2-phi_ND*x2;
%eq3= 0 == phi_NI*x2-phi_IR*x3-phi_ID*x3;
%eq4= 0 == mu + phi_SR*x1+phi_NR*x2+phi_IR*x3-phi_RS*x4-phi_RD*x4;
%eq5= 0 == phi_SD*x1+phi_ND*x2+phi_ID*x3+phi_RD*x4-mu;
%[x1,x2,x3,x4]=solve(eq1,eq2,eq3,eq4,eq5);
%A= [phi_SN*alpha*delta*k*x3*x1;
    %0];
%B= [(phi_NR+phi_NI+phi_ND)*x2;
    %-phi_NI*x2+(phi_IR+phi_ID)*x3];
%dA=[diff(A, x2), diff(A, x3)]
%dB=[diff(B, x2), diff(B, x3)]
%dB_inv = inv(dB)
%AB_inv = dA*dB_inv
%eig(AB_inv)
%simplify(x1) %ok
%simplify(x2) %ok
%simplify(x3) %ok
%simplify((x4*(phi_RS*phi_SN*phi_NI*alpha*delta*k)/((phi_IR + phi_ID)*(phi_NR + phi_NI + phi_ND))-phi_SR-phi_SD)/x3)
%(23) ok


