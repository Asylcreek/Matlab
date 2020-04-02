%creating the functions
fn1 = @(y1,y2,y3,x)y2;
fn2 = @(y1,y2,y3,x)y3;
fn3 = @(y1,y2,y3,x)-(y1*y3)/2;

%step size
%no. of iterations
h = 0.2;
n = 1:h:50;

%the boundary conditions
y3(1) = 0.33206;
y2(1) = 0;
y1(1) = 0;
x(1) = 0;

%creating the txt file
name_of_file = fopen('velocity.txt','w');

%creating the table header
fprintf(name_of_file,'%-6s  %-6s  %-6s  %-6s\n', 'Eta' , 'F', 'F_Prime', 'F_Prime_Prime');

%the 4th order Runge-Kutta method
for i = 1:range(n)
    %for the k's
    k1 = h.*[fn1(y1(i), y2(i), y3(i), x(i)), fn2(y1(i), y2(i), y3(i), x(i)), fn3(y1(i), y2(i), y3(i), x(i))];
    k2 = h.*[fn1(y1(i)+(k1(1)/2), y2(i)+(k1(2)/2), y3(i)+(k1(3)/2), x(i)+(h/2)), fn2(y1(i)+(k1(1)/2), y2(i)+(k1(2)/2), y3(i)+(k1(3)/2), x(i)+(h/2)), fn3(y1(i)+(k1(1)/2), y2(i)+(k1(2)/2), y3(i)+(k1(3)/2), x(i)+(h/2))];
    k3 = h.*[fn1(y1(i)+(k2(1)/2), y2(i)+(k2(2)/2), y3(i)+(k2(3)/2), x(i)+(h/2)), fn2(y1(i)+(k2(1)/2), y2(i)+(k2(2)/2), y3(i)+(k2(3)/2), x(i)+(h/2)), fn3(y1(i)+(k2(1)/2), y2(i)+(k2(2)/2), y3(i)+(k2(3)/2), x(i)+(h/2))];
    k4 = h.*[fn1(y1(i)+k3(1), y2(i)+k3(2), y3(i)+k3(3), x(i)+h), fn2(y1(i)+k3(1), y2(i)+k3(2), y3(i)+k3(3), x(i)+h), fn3(y1(i)+k3(1), y2(i)+k3(2), y3(i)+k3(3), x(i)+h)];
    
    %for the new y values
    y1(i+1) = y1(i) + 1/6*(k1(1) + 2*k2(1) + 2*k3(1) + k4(1));
    y2(i+1) = y2(i) + 1/6*(k1(2) + 2*k2(2) + 2*k3(2) + k4(2));
    y3(i+1) = y3(i) + 1/6*(k1(3) + 2*k2(3) + 2*k3(3) + k4(3));
    x(i+1) = x(i) + h;
    
    %saving the results
    fprintf(name_of_file,'%.4f  %.4f  %.4f  %.4f\n', x(i), y1(i), y2(i), y3(i));
end

fclose(name_of_file);
