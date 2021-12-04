clear
clc

anal_t = 0;
h = 0.1;
x_analytic_arr = zeros(101);
dt = zeros(101);

for i = 1:101
    x_analytic_arr(i) = fun_analytic(anal_t);
    dt(i) = anal_t;
    
    anal_t = anal_t + h;

end

tspan = [0 10];
x_0 = 0;

[t,x] = ode45(@fun, tspan, x_0);

plot(t,x);

hold on

plot(dt, x_analytic_arr);

hold off

title('ODE45 overwrite the graph of the analytical solution');
legend('ODE45','$(e^{t^2}-1)/2$','Interpreter','latex');
xlabel('t (sec)');
ylabel('x(t)');
grid on