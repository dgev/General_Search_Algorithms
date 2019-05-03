syms x y
f = x.^2 + y.^2;
g = exp(x.^2+y.^2);
h = (100*(y - x.^2).^2 + (1 - x).^2);
l = sin(x) + cos(y);
x0 = [1, 2];

draw = 0;

SA = SimulatedAnnealing(f, x0, 0.5, 100, 1, 2, [x, y],1,draw);
pause(0.1)
NA = Naive(f, x0, 0.5, 100, 2, [x, y],1,draw);
pause(0.5)
f =  @(x)(x(:,1)).^2 + (x(:,2)).^2;
PS = PSO(f,1,draw);
T = table(SA,NA,PS);
pause(0.5)

%draw = 0;


SA = SimulatedAnnealing(g, x0, 0.5, 100, 1, 2, [x, y],2,draw);
pause(0.1)
NA = Naive(g, x0, 0.5, 100, 2, [x, y],2,draw);
pause(0.5)
g =  @(x)exp((x(:,1)).^2 +(x(:,2)).^2);
PS = PSO(g,2,draw);
CurrentT = table(SA,NA,PS);
T = [T;CurrentT];
pause(0.5)

%draw = 0;
SA = SimulatedAnnealing(h, x0, 0.5, 100, 1, 2, [x, y],3,draw);
pause(0.1)
NA = Naive(h, x0, 0.5, 100, 2, [x, y],3,draw);
pause(0.5)
h = @(x)(100*(x(:,2) - (x(:,1)).^2).^2 + (1 - (x(:,1))).^2);
PS = PSO(h,3,draw);
CurrentT = table(SA,NA,PS);
T = [T;CurrentT];
pause(0.5)

%draw = 0;
SA = SimulatedAnnealing(l, x0, 0.5, 100, 1, 2, [x, y],4,draw);
pause(0.1)
NA = Naive(l, x0, 0.5, 100, 2, [x, y],4,draw);
pause(0.5)
l = @(x)sin(x(:,1)) + cos(x(:,2));
PS = PSO(l,4,draw);
CurrentT = table(SA,NA,PS);
T = [T;CurrentT];
T


