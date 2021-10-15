clear
clc

x_l = 1;
x_u = 2;
tol_x = 0.001;
tol_y = 0.00001;

y_l = fun(x_l);
y_u = fun(x_u);

x_r= x_l - (y_l * (x_u - x_l) / (y_u - y_l));
y_r=fun(x_r);

iter = 0;

while (1)
    if y_l * y_r < 0
        x_u = x_r;
        y_u = y_r;

        if y_u * y_l < 0
            y_l = y_l / 2;
        end
    else
        x_l = x_r;
        y_l = y_r;

        if y_l * y_u < 0
            y_u = y_u / 2;
        end
    end 

    x_r_prev = x_r;
    x_r = x_l - (y_l * (x_u - x_l) / (y_u - y_l));
    y_r = fun(x_r);

    if(abs(x_r - x_r_prev) < tol_x || abs(y_r) <tol_y)
        root = x_r;
        break
    end

    iter = iter + 1;
end

fprintf(1,'iter= %d \n', iter);
fprintf(1,'root= %.7f \n', root);
