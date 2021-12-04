clear
clc

t = 0;
x = 0;
h = 0.1;
x_analytic_arr = zeros(100);
dt = zeros(100);

for i = 1:100
    x_analytic_arr(i) = fun_analytic(t);
    dt(i) = t;
    
    t = t + h;

end

%plot(dt, x_analytic_arr);

