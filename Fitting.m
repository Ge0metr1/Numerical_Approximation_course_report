clear;clc;
t=[1 2 3 4 6 8 10 12 14 16]'; % 原始数据点
y=[4.00 6.41 8.01 8.79 9.53 9.86 10.33 10.42 10.53 10.61]'; % 原始数据点
A0=0;A1=0;A2=0;A3=0;A4=0;
b1=0;b2=0;b3=0;
n=length(t);
for i=1:n 
    A0=A0+t(i)^0;
    A1=A1+t(i)^1;
    A2=A2+t(i)^2;
    A3=A3+t(i)^3;
    A4=A4+t(i)^4;
    b1=b1+t(i)^0*y(i);
    b2=b2+t(i)^1*y(i);
    b3=b3+t(i)^2*y(i);
end
A=[A0 A1 A2;
   A1 A2 A3;
   A2 A3 A4]; % 法方程组
b=[b1 b2 b3]'; % 右端向量
M=A\b; %最优参数
p=flip(M) % 反转
P=poly2sym(p) % 二次函数


figure; hold on; grid on;
plot(t,y,'ro','MarkerSize',8,'MarkerFaceColor',[0.85 0.33 0.10]); % 原始数据点
tt=linspace(min(t), max(t), 300);
yy=polyval(p,tt); % 拟合曲线
plot(tt,yy,'b-','LineWidth',2,'Color',[0.00 0.45 0.74]);

xlabel('时间 t');
ylabel('生成物浓度 y');
title('二次多项式最小二乘拟合');
legend('原始数据点','二次拟合曲线','Location','best');
hold off;


figure;hold on; grid on;
y_fit=polyval(p,t); % 在数据点处的拟合值
res=y-y_fit; % 残差

stem(t,res,'filled','LineWidth',1.5,'Color',[0.00 0.45 0.74]);
yline(0, 'k--');
xlabel('时间 t');
ylabel('残差');
title('残差图');
hold off;