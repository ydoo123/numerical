clear
clc

x_l = 1;
x_u = 2;
tol_x = 0.001;
tol_y = 0.00001;

y_l = fun(x_l);
y_u = fun(x_u);

if (y_l*y_u < 0)
    fprintf('again\n');
    return
end

iter = 0;
x_r = 0;
fprintf(1,'iter  x_l  x_u  x_r  y_l  y_u  y_r \n');

while(1)
    iter = iter + 1;
    x_r = (x_l*y_u - x_u*y_l)/(y_u - y_l);
    y_r = fun(x_r);
    
    fprintf(1,'%d %f %f %f %f %f %f\n',iter, x_l, x_u,x_r, y_l,y_u,y_r);
    
    if (y_l*y_r < 0)
        x_r_1 = (((-y_r) * (x_r - x_l))/(0.5 * y_l - y_r)) + x_r;

        if fun(x_r_1)*y_l < 0
            x_u = x_r_1;
        else
            x_u = x_r;
            x_l = x_r_1;
        end

        if(abs(x_r - x_r_1) < tol_x || abs(fun(x_r_1)) < tol_y)
            fprintf(1,'Approximate solution x_r= %.7f \n', x_r_1);
            break
        end
        
    else
        x_r_1 = (((-y_r) * (x_u - x_r))/(0.5 * y_u - y_r)) + x_r;
        
        if fun(x_r_1) * y_l < 0
            x_l = x_r_1;
        else
            x_l = x_r;
            x_u = x_r_1;
        end

        if(abs(x_r - x_r_1) < tol_x || abs(fun(x_r_1)) < tol_y)
            fprintf(1,'Approximate solution x_r= %.7f \n', x_r_1);
            break
        end
    end
end