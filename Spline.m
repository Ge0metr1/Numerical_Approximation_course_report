clear;clc;
X=[1 2 4 5]'; % 原始数据X
Y=[1 3 4 2]'; % 原始数据Y
[D,h,A,g,M]=threespline(X,Y); % 求解三弯矩方程
syms x;
figure;hold on;grid on;
colors=lines(length(X)-1);% 不同颜色
for i=1:length(X)-1
    p1=(X(i+1)-x)^3*M(i)/(6*h(i));
    p2=(x-X(i))^3*M(i+1)/(6*h(i));
    p3=(Y(i)-M(i)*h(i)^2/6)*(X(i+1)-x)/h(i);
    p4=(Y(i+1)-M(i+1)*h(i)^2/6)*(x-X(i))/h(i);
    S=simplifyFraction(p1+p2+p3+p4) % 求出S(x)表达式
    f=matlabFunction(S);
    xx=linspace(X(i), X(i+1), 200);
    yy=f(xx);
    plot(xx,yy,'LineWidth',2,'Color',colors(i,:)); % 绘制插值函数
end
plot(X,Y,'ko','MarkerFaceColor','k','MarkerSize',8); % 绘制插值点
xlabel('x');
ylabel('S(x)');
title('三次样条插值（自然边界条件）');
legend({'第1段','第2段','第3段','插值点'},'Location','best');
hold off;


function [D,h,A,g,M]=threespline(X,Y) % 求解三弯矩方程
    n=length(X);
    A=zeros(n,n);
    A(:,1)=Y;
    D=zeros(n-2);
    g=zeros(n-2,1);
    h=zeros(n-2,0);
    for j=2:n
        for i=j:n
            A(i,j)=(A(i,j-1)-A(i-1,j-1))/(X(i)-X(i-j+1)); % 差商表A
        end
    end
    for i=1:n-2
        g(i,1)=6*A(i+2,3); % 右端向量g
    end
    for i=1:n-1
        h(i)=X(i+1)-X(i); % 间隔h
    end
    D=D+eye(n-2)*2; % 三弯矩矩阵D
    for i=2:n-2
        D(i-1,i)=h(i)/(h(i-1)+h(i)); % lamuda_i
        D(i,i-1)=h(i)/(h(i)+h(i+1)); % miu_i
    end
    M=D\g; % 二阶导数值M
    M=[0;M;0]; % 加入自然边界条件
end
