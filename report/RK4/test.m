clear
clc

t = 0;
x = 0;
h = 0.1;
x_arr = zeros(101);
x_analytic_arr = zeros(101);
dt = zeros(101);

for i = 1:101
    x_arr(i) = x;
    x_analytic_arr(i) = fun_analytic(t);
    dt(i) = t;
    
    k_1 = fun(t,x);
    k_2 = fun(t + 0.5*h, x + 0.5 * k_1 * h);
    k_3 = fun(t + 0.5*h, x + 0.5 * k_2 * h);
    k_4 = fun(t + h, x + k_3 * h);
    
    x = x + (k_1 + 2*k_2 + 2*k_3 + k_4)*h/6;
    t = t + h;
    
    %fprintf(1, '%.7f | %.7f | %.7f \n', x_arr(i), x_analytic_arr(i), x_analytic_arr(i) - x_arr(i));
    
    
end

plot(dt, x_arr);

hold on

plot(dt, x_analytic_arr);

hold off

title('RK4 overwrite the graph of the analytical solution');
legend('RK4','$(e^{t^2}-1)/2$','Interpreter','latex');
xlabel('t (sec)');
ylabel('x(t)');
grid on

