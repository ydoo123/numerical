clear
clc

tspan = [0 10];
x_0 = 0;

[t,x] = ode45(@fun, tspan, x_0);

plot(t,x);

title('ODE45');
legend('ODE45');
xlabel('t (sec)');
ylabel('x(t)');
grid on