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

for iter = 1:100
    %iter = iter + 1;

    fprintf(1,'%d %f %f %f %f %f %f \n', i, x_l, x_u, x_r, y_l, y_u, y_r);
    x_r = ((-y_u *(x_u - x_l))/(y_l - y_u)) + x_u
    y_r = fun(x_r);
    
    if (y_l*y_r < 0)
        if(abs(x_r - x_u) < tol_x || abs(y_r) <tol_y)
            root = x_r
            break
       
        else
            x_u = x_r;
            y_u = y_r;
        end
    end
        
    if (y_l * y_r > 0)
        if(abs(x_l - x_r) < tol_x || abs(y_r) <tol_y)
            root = x_r
            break
            
        else
            x_l = x_r;
            y_l = y_r;
        end
    end
end

fprintf(1,'iter= %d \n', iter);
fprintf(1,'root= %.7f \n', root);