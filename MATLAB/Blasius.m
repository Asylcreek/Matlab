%Define functions
function_1 = @(y1,y2,y3,x)y2;
function_2 = @(y1,y2,y3,x)y3;
function_3 = @(y1,y2,y3,x)-0.5*y1*y3;

%Step Size and Number of Iterations
h = 0.2;
n = 30;
%Boundary Conditions
y3(1) = 1;
y2(1) = 0;
y1(1) = 0;
x(1) = 0;
%4th Order Runge-Kutta Method
for i = 1:(n-1)
    k1 = h.*[function_1(y1(i), y2(i), y3(i), x(i)), function_2(y1(i), y2(i), y3(i), x(i)), function_3(y1(i), y2(i), y3(i), x(i))];
    k2 = h.*[function_1(y1(i)+(0.5*k1(1)), y2(i)+(0.5*k1(2)), y3(i)+(0.5*k1(3)), x(i)+(0.5*h)), function_2(y1(i)+(0.5*k1(1)), y2(i)+(0.5*k1(2)), y3(i)+(0.5*k1(3)), x(i)+(0.5*h)), function_3(y1(i)+(0.5*k1(1)), y2(i)+(0.5*k1(2)), y3(i)+(0.5*k1(3)), x(i)+(0.5*h))];
    k3 = h.*[function_1(y1(i)+(0.5*k2(1)), y2(i)+(0.5*k2(2)), y3(i)+(0.5*k2(3)), x(i)+(0.5*h)), function_2(y1(i)+(0.5*k2(1)), y2(i)+(0.5*k2(2)), y3(i)+(0.5*k2(3)), x(i)+(0.5*h)), function_3(y1(i)+(0.5*k2(1)), y2(i)+(0.5*k2(2)), y3(i)+(0.5*k2(3)), x(i)+(0.5*h))];
    k4 = h.*[function_1(y1(i)+k3(1), y2(i)+k3(2), y3(i)+k3(3), x(i)+h), function_2(y1(i)+k3(1), y2(i)+k3(2), y3(i)+k3(3), x(i)+h), function_3(y1(i)+k3(1), y2(i)+k3(2), y3(i)+k3(3), x(i)+h)];
    y1(i+1) = y1(i) + 1/6*(k1(1) + 2*k2(1) + 2*k3(1) + k4(1));
    y2(i+1) = y1(i) + 1/6*(k1(2) + 2*k2(2) + 2*k3(2) + k4(2));
    y3(i+1) = y1(i) + 1/6*(k1(3) + 2*k2(3) + 2*k3(3) + k4(3));
    x(i+1) = x(i) + h;
end
