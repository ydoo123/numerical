clear
clc

t = 0;
x = 0;
h = 0.1;


for i = 1:100
    fprintf(1,'root = %.7f \n', x);
    
    k_1 = fun(t,x);
    k_2 = fun(t + 0.5*h, x + 0.5 * k_1 * h);
    k_3 = fun(t + 0.5*h, x + 0.5 * k_2 * h);
    k_4 = fun(t + h, x + k_3 * h);
    
    x = x + (k_1 + 2*k_2 + 2*k_3 + k_4)*h/6;
    
    t = t + h;

end

plot(dt, x_arr);