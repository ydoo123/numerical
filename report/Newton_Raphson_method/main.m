clear
clc

tol_x = 0.001;
tol_y = 0.00001;

iter_max = 100;
iter = 0;

x_i = 1.5;
gittest = 0;


for i = 1:iter_max
    y_i = fun(x_i);
    a_i = fun_diff(x_i);
    x_r = (-y_i/a_i) + x_i;

    if (abs(x_r - x_i) < tol_x || abs(fun(x_r)) < tol_y)
        root = x_r;
        break
    end

    x_i = x_r;
    
end

fprintf(1,'iter= %d \n', i);
fprintf(1,'Approximate solution root= %.7f \n', root);