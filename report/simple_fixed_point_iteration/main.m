clear
clc

tol = 0.001;
iter_max = 100;

x_i = 0.5;
root = 0;

for i = 1:iter_max
    y_i = fun(x_i);
    slope = abs((fun(y_i) - y_i)/(x_i - y_i));
    
    if slope > 1
        fprintf(1,'Wrong point \n');
        break
    end

    if abs(y_i - x_i) < tol
        root = y_i;
        break
    end

    x_i = y_i;
end

fprintf(1, 'iter = %d \n', i);
fprintf(1, 'root = %.7f \n', root);
