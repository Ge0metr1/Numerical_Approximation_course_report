clear;clc;
f=@(x)(1./(1+25*x.^2)); % 原函数
N=[4 8 12]; % 插值多项式次数
X=linspace(-1,1,100+1);
plot(X,f(X),'k-','LineWidth',1.5); % 画原函数
hold on;
for i=1:3
    x=linspace(-1,1,N(i)+1);
    Ln=interp_L(x,f,X); % Lagrange插值
    if i==1
        plot(X,Ln,'r--','LineWidth',1); % 画插值函数
    elseif i==2
        plot(X,Ln,'b--','LineWidth',1); % 画插值函数
    else
        plot(X,Ln,'g--','LineWidth',1); % 画插值函数
    end
    hold on;
end
xlim([-1,1]);
xticks(-1:0.2:1);
ylim([-1.1,1.1]);
legend('f(x)','n=4','n=8','n=12','location','south')
title('f(x)=1/(1+25x^2)');



function Ln=interp_L(x,f,X) % 计算Lagrange插值
    n=length(x);
    nn=length(X);
    for k=1:nn
        L=0;
        for i=1:n
            l=1;
            for j=1:n
                if i~=j
                    l=l*(X(k)-x(j))/(x(i)-x(j)); %l_k(x)
                end
            end
            L=L+f(x(i))*l;
        end
        Ln(k)=L;
    end
end