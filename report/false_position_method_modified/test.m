clc
clear
format longG
fun = @(x)  x.^3 + 2*x.^2 + 10*x - 20;
low = [0,0,0,0,0,0];

high = [2.0,2.0,2.0,10.0,10.0,10.0];

tolerance = [1e-6,1e-8,1e-10,1e-6,1e-8,1e-10];

plot_it = 1;

figure(1)
fplot(fun)
hAxis = gca;
hAxis.XAxisLocation = 'origin';
hAxis.YAxisLocation = 'origin';

for n= 1:3
    ModRegulaFalsi(fun,low(n),high(n),tolerance(n),plot_it); 
    plot_it = plot_it + 2;
end

function ModRegulaFalsi(fun,x_l,x_u,tol,plot_it)
disp('Modified Regula Falsi')
title('Function')
x_0_vec = [];
errV = [];
errV(end+1) = 1;
maxIter = 50;
i = 2;
disp('Iter              low                     high                    x0                      fun(x0)');
while i<= maxIter
    y_l = fun(x_l);
    y_u = fun(x_u);
    
    x_r = (x_l*y_u - x_u * y_l)/(y_u-y_l);
    y_r = fun(x_r)
    
    if (y_l * y_r < 0)
        k = abs((2*y_r)/(x_u-x_r));
        d = ((1+k)*x_l*y_u-(x_u*y_l)) / ((1+k)*y_u - y_l);
        if fun(d)*y_l<0
            x_u=d;
        else
            x_u=x_r;
            x_l=d;
        end
        fprintf('%2i \t %.16f \t %.16f \t %.16f \t %.16f \n', i-1, x_l, x_u, d,fun(d)) ;
        x_0_vec(end+1) = d;
    else if (y_l * y_r > 0)
        k = abs((0.5*y_r)/(x_u-x_r)); 
        d = ((1+k)*x_u*y_l-(x_l*y_u)) / ((1+k)*y_l - y_u);
        if fun(d)*y_l<0
            x_l=d;
        else
            x_l=x_r;
            x_u=d;
        end
        fprintf('%2i \t %.16f \t %.16f \t %.16f \t %.16f \n', i-1, x_l, x_u, d,fun(d))     ;
        x_0_vec(end+1) = d;
    end
         
   end
   if abs(fun(d))<tol
       Root = d;
       break
   else
       i = i+1;
   end
end

iter = i-1
iterations= 1:iter;
figure(1)
subplot(3,2,plot_it)
plot(iterations,fun(x_0_vec(1:iter)))
title('Iteration vs fun(x)')
xlabel('Iterations');
ylabel('fun(x)');
subplot(3,2,plot_it + 1)
plot(iterations,x_0_vec)
title('Iteration vs X0')
xlabel('Iterations')
ylabel('x0')
end