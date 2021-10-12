clear
clc

x_l = input('lower bound = ?');
x_u = input('upper bound = ?');
tol_x = input('x tolerance = ?');
tol_y = input('y tolerance = ?');

y_l = fun(x_l);
y_u = fun(x_u);

if (y_l*y_u > 0)
    fprintf('again\n');
end

iter = 0;
x_r = 0;

while(1)
    iter = iter + 1;
    x_r = (x_l*y_u - x_u*y_l)/(y_u - y_l);
    y_r = fun(x_r);
    
    if (y_l*y_r < 0)
        if(abs(x_r - x_u) < tol_x || abs(y_r) <tol_y)
            fprintf(1,'Approximate solution x_r= %.7f \n', x_r);
            break
       
        else
            x_u = x_r;
            y_u = y_r;
        end
        
    else
        if(abs(x_l - x_r) < tol_x || abs(y_r) <tol_y)
            fprintf(1,'Approximate solution x_r= %.7f \n', x_r);
            break
            
        else
            x_l = x_r;
            y_l = y_r;
        end
    end
end
