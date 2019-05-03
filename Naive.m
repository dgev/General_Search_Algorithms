function F = Naive(f, xk, eps, numIt, n, variables,num,draw)
syms x y
for i=1:numIt
a= xk-eps;
b= xk+eps;
zk = (b-a).*rand(1,n) + a;
    if (subs(f, variables, zk) < subs(f, variables, xk))
        xk = zk;
    end
end
if draw
if (num == 1)
    x=(-50:1:50);
    y= (-50:1:30);
    [X, Y] = meshgrid(x,y);
    Z = X.^2 + Y.^2;
    %Z = X.^4 + Y.^4;
end
if (num == 2)
    x=(-0.3:0.1:1);
    y= (-0.3:0.1:1);
    [X, Y] = meshgrid(x,y);
    Z = exp(X.^2 + Y.^2);
end
if (num == 3)
    x=(-3:0.1:5);
    y= (-3:0.1:3);
    [X, Y] = meshgrid(x,y);
    Z = (100*(Y - X.^2).^2 + (1 - X).^2);
end
if (num == 4)
    x=(-4:0.1:4);
    y= (-4:0.1:4);
    [X, Y] = meshgrid(x,y);
    Z = cos(X) + sin(Y);
end

figure
a = Z;
surf(X,Y,Z,'AlphaData',a,...
    'FaceAlpha','flat',...
    'FaceColor','blue')
hold on
plot3(xk(1),xk(2),subs(f, variables, xk),'x', 'Color', 'r','linewidth',9,'Markersize',5)
figure
end
F=double(subs(f, variables, xk));
end