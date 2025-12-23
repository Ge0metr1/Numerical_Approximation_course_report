clear; clc;
f=@(x) exp(-x)-sin(pi*x/2);
a=0;b=1;
tol=1/2^5;
n=log2((b-a)/tol)-1
n=ceil(n);
Record=zeros(n+1,5); % 每一行：[k,a_k,b_k,c_k,f(c_k)]
for k=0:n
    c=(a+b)/2; % 二分
    Record(k+1,:)=[k,a,b,c,f(c)]; % 记录迭代过程
    if f(a)*f(c)<0 % 根在左半区间
        b=c;
    elseif f(c)*f(b)<0 % 根在右半区间
        a=c;
    else % 找到真实值
        break;
    end
end
disp('二分法迭代过程：');
disp(array2table(Record,'VariableNames',{'n','a','b','c','f(c)'})); % 输出迭代过程
disp(['根的近似值为: ', num2str(c)]); % 输出根近似值


figure; hold on; grid on; % 绘图
x=linspace(a-0.1,b+0.1,500);
y=f(x);
plot(x,y,'LineWidth',2); % 原函数

yline(0,'k--'); % y=0线

plot(c,0,'ro','MarkerSize',8,'MarkerFaceColor','r');% 零点标注
text(c,0,sprintf('  x=%.4f',c),'FontSize',11,'Color','r','VerticalAlignment','bottom');

x_patch=[c-tol,c+tol,c+tol,c-tol];
y_patch=[min(f(x))+0.1,min(f(x))+0.1,max(f(x))-0.1,max(f(x))-0.1];
patch(x_patch, y_patch,[1 0.8 0.8],'FaceAlpha',0.4,'EdgeColor','none'); % 绘制真实值所在区间

xlabel('x');
ylabel('f(x)');
title('函数f(x)=e^{-x}-sin(\pix/2)');
legend('f(x)','y=0','近似值点','真实值所在区间','Location','northeast');
hold off;