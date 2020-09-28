%10 驗證threshold 跟 malware free point
iter_time = 50;
x = [0:1:iter_time-1];

f1 = fopen('Result data\\exp10\\SimRes_NEWexp10_1.csv');
f2 = fopen('Result data\\exp10\\AnaRes_NEWexp10_1.csv');
f3 = fopen('Result data\\exp10\\SimRes_exp10_2.csv');
f4 = fopen('Result data\\exp10\\AnaRes_exp10_2.csv');
%N always 0, SEIRD
y1 = textscan(f1, '%f,%f,%f,%f,%f,%f,');
y2 = textscan(f2, '%f,%f,%f,%f,%f,%f,');
y3 = textscan(f3, '%f,%f,%f,%f,%f,%f,');
y4 = textscan(f4, '%f,%f,%f,%f,%f,%f,');

fclose('all');

[y1_S,y1_E,y1_N,y1_I,y1_R,y1_D] = deal(y1{:});
[y2_S,y2_E,y2_N,y2_I,y2_R,y2_D] = deal(y2{:});
[y3_S,y3_E,y3_N,y3_I,y3_R,y3_D] = deal(y3{:});
[y4_S,y4_E,y4_N,y4_I,y4_R,y4_D] = deal(y4{:});
%simulation
y1_S = smooth(y1_S);
y1_E = smooth(y1_E);
y1_I = smooth(y1_I);
y1_R = smooth(y1_R);
y1_D = smooth(y1_D);

y3_S = smooth(y3_S);
y3_E = smooth(y3_E);
y3_I = smooth(y3_I);
y3_R = smooth(y3_R);
y3_D = smooth(y3_D);
%Analytical
y2_S = smooth(y2_S);
y2_E = smooth(y2_E);
y2_I = smooth(y2_I);
y2_R = smooth(y2_R);
y2_D = smooth(y2_D);

y4_S = smooth(y4_S);
y4_E = smooth(y4_E);
y4_I = smooth(y4_I);
y4_R = smooth(y4_R);
y4_D = smooth(y4_D);
%Modified simation 
figure(1)
p = plot(x,y1_S,'k', x,y1_E,'r', x,y1_I,'b',x,y1_R,'g',x,y1_D,'m',...
     x,y2_S,'kx', x,y2_E,'rx', x,y2_I,'bx',x,y2_R,'gx',x,y2_D,'mx');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of state'); % y軸註解
title('SEIRD model with threshold < 1'); % 圖形標題
legend(p(1:5),'Sim S','Sim E','Sim I','Sim R','Sim D'); % 圖形註解
ah=axes('position',get(gca,'position'),'visible','off');
legend(ah,p(6:10),'Ana S','Ana E','Ana I','Ana R','Ana D','location','west'); % 圖形註解

figure(2)
p = plot(x,y3_S,'k', x,y3_E,'r', x,y3_I,'b',x,y3_R,'g',x,y3_D,'m',...
     x,y4_S,'kx', x,y4_E,'rx', x,y4_I,'bx',x,y4_R,'gx',x,y4_D,'mx');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of state'); % y軸註解
title('SEIRD model with threshold > 1'); % 圖形標題
legend(p(1:5),'Sim S','Sim E','Sim I','Sim R','Sim D'); % 圖形註解
ah=axes('position',get(gca,'position'),'visible','off');
legend(ah,p(6:10),'Ana S','Ana E','Ana I','Ana R','Ana D','location','west'); % 圖形註解