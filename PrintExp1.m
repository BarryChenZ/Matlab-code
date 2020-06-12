%1. Contact rate, Successful prob 不同的影響 → 改變
iter_time = 50;
x = [0:1:iter_time-1];

f1 = fopen('Result data\\exp1\\SimRes_exp1_1.txt');
f2 = fopen('Result data\\exp1\\SimRes_exp1_2.txt');
f3 = fopen('Result data\\exp1\\SimRes_exp1_3.txt');
f4 = fopen('Result data\\exp1\\AnaRes_exp1_1.txt');
f5 = fopen('Result data\\exp1\\AnaRes_exp1_2.txt');
f6 = fopen('Result data\\exp1\\AnaRes_exp1_3.txt');

%N always 0, SEIRD
y1 = textscan(f1, '%f%f%f%f%f%f');
y2 = textscan(f2, '%f%f%f%f%f%f');
y3 = textscan(f3, '%f%f%f%f%f%f');
y4 = textscan(f4, '%f%f%f%f%f%f');
y5 = textscan(f5, '%f%f%f%f%f%f');
y6 = textscan(f6, '%f%f%f%f%f%f');

fclose('all');

[y1_S,y1_E,y1_N,y1_I,y1_R,y1_D] = deal(y1{:});
[y2_S,y2_E,y2_N,y2_I,y2_R,y2_D] = deal(y2{:});
[y3_S,y3_E,y3_N,y3_I,y3_R,y3_D] = deal(y3{:});
[y4_S,y4_E,y4_N,y4_I,y4_R,y4_D] = deal(y4{:});
[y5_S,y5_E,y5_N,y5_I,y5_R,y5_D] = deal(y5{:});
[y6_S,y6_E,y6_N,y6_I,y6_R,y6_D] = deal(y6{:});
y1_E = smooth(y1_E);
y2_E = smooth(y2_E);
y3_E = smooth(y3_E);
y4_E = smooth(y4_E);
y5_E = smooth(y5_E);
y6_E = smooth(y6_E);
%Modified simation 
figure(1)
plot(x,y1_E,'k', x,y2_E,'r', x,y3_E,'b',...
     x,y4_E,'k+', x,y5_E,'r+', x,y6_E,'b+');
axis([0, 50, 0.0, 0.1]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of E'); % y軸註解
title('Different contact rate of SEIRD model'); % 圖形標題
legend('0.3','0.6','0.9'); % 圖形註解   