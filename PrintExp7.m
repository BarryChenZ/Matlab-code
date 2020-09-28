%7. 不同速度的影響
iter_time = 50;
x = [0:1:iter_time-1];

f1 = fopen('Result data\\exp7\\SimRes_NEWexp7_1.csv');
f2 = fopen('Result data\\exp7\\SimRes_NEWexp7_2.csv');
f3 = fopen('Result data\\exp7\\SimRes_NEWexp7_3.csv');
f4 = fopen('Result data\\exp7\\AnaRes_NEWexp7_1.csv');
f5 = fopen('Result data\\exp7\\AnaRes_NEWexp7_2.csv');
f6 = fopen('Result data\\exp7\\AnaRes_NEWexp7_3.csv');

%N always 0, SEIRD
y1 = textscan(f1, '%f,%f,%f,%f,%f,%f,');
y2 = textscan(f2, '%f,%f,%f,%f,%f,%f,');
y3 = textscan(f3, '%f,%f,%f,%f,%f,%f,');
y4 = textscan(f4, '%f,%f,%f,%f,%f,%f,');
y5 = textscan(f5, '%f,%f,%f,%f,%f,%f,');
y6 = textscan(f6, '%f,%f,%f,%f,%f,%f,');

fclose('all');

[y1_S,y1_E,y1_N,y1_I,y1_R,y1_D] = deal(y1{:});
[y2_S,y2_E,y2_N,y2_I,y2_R,y2_D] = deal(y2{:});
[y3_S,y3_E,y3_N,y3_I,y3_R,y3_D] = deal(y3{:});
[y4_S,y4_E,y4_N,y4_I,y4_R,y4_D] = deal(y4{:});
[y5_S,y5_E,y5_N,y5_I,y5_R,y5_D] = deal(y5{:});
[y6_S,y6_E,y6_N,y6_I,y6_R,y6_D] = deal(y6{:});
%Simulation
y1_S = smooth(y1_S);
y1_E = smooth(y1_E);
y1_I = smooth(y1_I);
y1_R = smooth(y1_R);
y1_D = smooth(y1_D);

y2_S = smooth(y2_S);
y2_E = smooth(y2_E);
y2_I = smooth(y2_I);
y2_R = smooth(y2_R);
y2_D = smooth(y2_D);

y3_S = smooth(y3_S);
y3_E = smooth(y3_E);
y3_I = smooth(y3_I);
y3_R = smooth(y3_R);
y3_D = smooth(y3_D);
%Ana
y4_S = smooth(y4_S);
y4_E = smooth(y4_E);
y4_I = smooth(y4_I);
y4_R = smooth(y4_R);
y4_D = smooth(y4_D);

y5_S = smooth(y5_S);
y5_E = smooth(y5_E);
y5_I = smooth(y5_I);
y5_R = smooth(y5_R);
y5_D = smooth(y5_D);

y6_S = smooth(y6_S);
y6_E = smooth(y6_E);
y6_I = smooth(y6_I);
y6_R = smooth(y6_R);
y6_D = smooth(y6_D);
%Modified simation
figure(1)
plot(...
     x,y1_S,'k',x,y1_E,'r', x,y1_I,'b', x,y1_R,'g', x,y1_D,'c',...
     x,y4_S,'k+',x,y4_E,'r+', x,y4_I,'b+', x,y4_R,'g+', x,y4_D,'c+');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of I'); % y軸註解
title('Different speed of SEIRD model'); % 圖形標題

figure(2)
plot(x,y1_E,'k', x,y2_E,'r', x,y3_E,'b',...
     x,y4_E,'k+', x,y5_E,'rs', x,y6_E,'bd');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of E'); % y軸註解
title('Different speed of SEIRD model'); % 圖形標題
legend('Sim E state, v = 10.0','Sim E state, v = 100.0','Sim E state, v = 500.0',...
       'Ana E state, v = 10.0','Ana E state, v = 100.0','Ana E state, v = 500.0',...
       'Sim I state, v = 10.0','Sim I state, v = 100.0','Sim I state, v = 500.0',...
       'Ana I state, v = 10.0','Ana I state, v = 100.0','Ana I state, v = 500.0'); % 圖形註解
   
figure(3)
plot(...
     x,y1_I,'k--', x,y2_I,'r--', x,y3_I,'b--',...
     x,y4_I,'ko', x,y5_I,'rx', x,y6_I,'b*');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of I'); % y軸註解
title('Different speed of SEIRD model'); % 圖形標題
legend(...
       'Sim I state, v = 10.0','Sim I state, v = 100.0','Sim I state, v = 500.0',...
       'Ana I state, v = 10.0','Ana I state, v = 100.0','Ana I state, v = 500.0'); % 圖形註解