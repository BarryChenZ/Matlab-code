%15 與其他論文的model比較
iter_time = 50;
x = [0:1:iter_time-1];

f1 = fopen('Result data\\exp15\\SimRes_NEWexp15_1.csv');
y1 = textscan(f1, '%f,%f,%f,%f,%f,%f,');
[y1_S,y1_E,y1_N,y1_I,y1_R,y1_D] = deal(y1{:});
y1_S = smooth(y1_S);
y1_I = smooth(y1_I);
%our model
f2 = fopen('Result data\\exp15\\AnaRes_NEWexp15_1.csv');
y2 = textscan(f2, '%f,%f,%f,%f,%f,%f,');
[y2_S,y2_E,y2_N,y2_I,y2_R,y2_D] = deal(y2{:});
y2_S = smooth(y2_S);
y2_I = smooth(y2_I);
%lie2017web  //test ok
f3 = fopen('Result data\\exp15\\AnaRes_NEWexp15_3.csv');
y3 = textscan(f3, '%f,%f,%f,%f,');
[y3_S,y3_D,y3_I,y3_R] = deal(y3{:});
y3_S = smooth(y3_S);
y3_I = smooth(y3_I);

f4 = fopen('Result data\\exp15\\AnaRes_NEWexp15_4.csv');
y4 = textscan(f4, '%f,%f,');
[y4_S,y4_I] = deal(y4{:});
y4_S = smooth(y4_S);
y4_I = smooth(y4_I);
fclose('all');
%Modified simation 
figure(1)
%1 simulaton
%2 our model
%4 BOT-SIS
plot(x,y1_S,'k', x,y1_I,'r',...
     x,y2_S,'kx', x,y2_I,'rx',...
     x,y3_S,'k*', x, y3_I,'r*',...
     x,y4_S,'k+',x,y4_I,'r+');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of state S and I'); % y軸註解
title('Different model comparing'); % 圖形標題
legend('Sim S','Sim I','S[Our]','I[Our]','S[31]','I[31]','S[40]','I[40]'); % 圖形註解