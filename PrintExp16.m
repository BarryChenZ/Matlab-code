%16 FB dataset
iter_time = 50;
x = [0:1:iter_time-1];

f1 = fopen('Result data\\exp16\\SimRes_NEWexp16_1.csv');
y1 = textscan(f1, '%f,%f,%f,%f,%f,%f,');
[y1_S,y1_E,y1_N,y1_I,y1_R,y1_D] = deal(y1{:});
y1_S = smooth(y1_S);
y1_E = smooth(y1_E);
y1_I = smooth(y1_I);
y1_R = smooth(y1_R);
y1_D = smooth(y1_D);
%our model
f2 = fopen('Result data\\exp16\\AnaRes_NEWexp16_1.csv');
y2 = textscan(f2, '%f,%f,%f,%f,%f,%f,');
[y2_S,y2_E,y2_N,y2_I,y2_R,y2_D] = deal(y2{:});
y2_S = smooth(y2_S);
y2_E = smooth(y2_E);
y2_I = smooth(y2_I);
y2_R = smooth(y2_R);
y2_D = smooth(y2_D);
fclose('all');
%Modified simation 
figure(1)
%1 simulaton
%2 our model
%4 BOT-SIS
p =plot(x,y1_S,'k', x,y1_E,'r', x,y1_I,'b',x,y1_R,'g',x,y1_D,'m',...
     x,y2_S,'kx', x,y2_E,'rx', x,y2_I,'bx',x,y2_R,'gx',x,y2_D,'mx');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of state on SEIRD model'); % y軸註解
title('SEIRD model under FB dataset'); % 圖形標題
legend(p(1:5),'Sim S','Sim E','Sim I','Sim R','Sim D'); % 圖形註解
ah=axes('position',get(gca,'position'),'visible','off');
legend(ah,p(6:10),'Ana S','Ana E','Ana I','Ana R','Ana D','location','west'); % 圖形註解