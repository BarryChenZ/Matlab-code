iter_time = 50;
x = [0:1:iter_time-1];

f1 = fopen('Result data\\SimRes_SEIRD_1.txt');
f2 = fopen('Result data\\SimRes_SEIRD_2.txt');
f3 = fopen('Result data\\AnaRes_SEIRD.txt');

%N always 0, SEIRD
y1 = textscan(f1, '%f%f%f%f%f%f');
y2 = textscan(f2, '%f%f%f%f%f%f');
y3 = textscan(f3, '%f%f%f%f%f%f');

fclose('all');

[y1_S,y1_E,y1_N,y1_I,y1_R,y1_D] = deal(y1{:});
[y2_S,y2_E,y2_N,y2_I,y2_R,y2_D] = deal(y2{:});
[y3_S,y3_E,y3_N,y3_I,y3_R,y3_D] = deal(y3{:});

%{
plot(x, y1_S, 'ko', x, y1_E,'ro', x, y1_N, 'bo',x, y1_I, 'go', x, y1_R, 'yo', x, y1_D, 'co',...
     x, y2_S, 'kx', x, y2_E,'rx', x, y2_N, 'bx',x, y2_I, 'gx', x, y2_R, 'yx', x, y2_D, 'cx',...
     x, y3_S, 'k+', x, y3_E,'r+', x, y3_N, 'b+',x, y3_I, 'g+', x, y3_R, 'y+', x, y3_D, 'c+');
 %}

%Modified simation 
figure(1)
plot(x, y1_S, 'ko', x, y1_E,'ro', x, y1_N, 'bo',x, y1_I, 'go', x, y1_R, 'yo', x, y1_D, 'co',...
     x, y3_S, 'k+', x, y3_E,'r+', x, y3_N, 'b+',x, y3_I, 'g+', x, y3_R, 'y+', x, y3_D, 'c+');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of x'); % y軸註解
title('SEIRD model'); % 圖形標題
legend('S','E','N','I','R','D'); % 圖形註解  
figure(2)
%Origin simulation
plot(x, y2_S, 'kx', x, y2_E,'rx', x, y2_N, 'bx',x, y2_I, 'gx', x, y2_R, 'yx', x, y2_D, 'cx',...
     x, y3_S, 'k+', x, y3_E,'r+', x, y3_N, 'b+',x, y3_I, 'g+', x, y3_R, 'y+', x, y3_D, 'c+');
axis([0, 50, 0.0, 1.0]);
xlabel('t(time)'); % x軸註解
ylabel('The fraction of x'); % y軸註解
title('SEIRD model'); % 圖形標題
legend('S','E','N','I','R','D'); % 圖形註解   
 
