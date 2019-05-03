function F = PSO(f,num,draw)
if (num == 1)
stop = 20;                    % number of iterations
d = 400;                      % population size is 400
k = 1:20;
end
if (num == 2)
stop = 60;                    % number of iterations
d = 625;                      % population size is 625
k = 1:25;
end
if (num == 3 || num == 4)
stop = 25;                    % number of iterations
d = 64;                       % population size is 64
k = 1:8;
end

w = 1;                        % internal constant
c = 2;                        % The best value for cognitive c1 and social c2 components is 2 => c1 = c2 = c = 2

[X,Y] = meshgrid(k,k);                 % we create two 8x8 matrices
m = cat(2,X',Y');                      % we concatenate transpose matrices of two numeric matrices into a single matrix
M = reshape(m,[],2);                   % M is 64 -by- 2 matrix whose elements are taken column-wise from m 
p(1:d,1,1:2) = M;                      % we generate random positions for the particles
p(:,2,:) = 0;                          % we generate random velocities for the particles
                   
x = p(:, 1, 1);          % x coordinates of particles             
y = p(:, 1, 2);          % y coordinates of particles                             
fval = f([x y]);         % calculates the value of f at each point (x,y)
gbest = min (fval);      % we choose minimum value of our function
p(:,4,1) = gbest;        % we set general best value to minimum of f



  for i = 1:stop
    p(:, 1, 1) = p(:, 1, 1) + p(:, 2, 1);    
    p(:, 1, 2) = p(:, 1, 2) + p(:, 2, 2);       
    x = p(:, 1, 1);                        
    y = p(:, 1, 2);                                         
    fval = f([x y]);                                      
    
    for j = 1:d
        if fval(j,1) < p(j,4,1)
            p(j, 3, 1) = p(j, 1, 1);                 
            p(j, 3, 2) = p(j, 1, 2);                 
            p(j, 4, 1) = fval(j,1);                  
        end
    end    
    [~, gbest] = min(p(:, 4, 1)) ;                        
    p(:, 2, 1) = w*p(:, 2, 1) + c*(rand(d,1).*(p(:, 3, 1) - p(:, 1, 1))) + c*(rand(d,1).*(p(gbest, 3, 1) - p(:, 1, 1)));  
    p(:, 2, 2) = w*p(:, 2, 2) + c*(rand(d,1).*(p(:, 3, 2) - p(:, 1, 2))) + c*(rand(d,1).*(p(gbest, 3, 2) - p(:, 1, 2)));   
    
    % Plot
    if draw
    clf;
    scatter(p(:, 1, 1), p(:, 1, 2),'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);            
    grid
    axis([-100 100 -100 100]);
    pause(.1); 
    end
  end

% GRAPH
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
    x=(-10:1:10);
    y= (-10:1:10);
    [X, Y] = meshgrid(x,y);
    Z = cos(X) + sin(Y);
end
figure
surf(X,Y,Z)
shading interp
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
plot3(p(1,3,1),p(1,3,2),p(1,4,1),'x', 'Color', 'r','linewidth',9,'Markersize',5)
end
F = min(p(:, 4, 1));
end

