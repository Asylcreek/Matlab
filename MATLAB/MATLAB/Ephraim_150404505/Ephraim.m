%a = k1, b = k2, c = k3, d = k4
%defining functions
fn_1 = @(x, y1,y2,y3)y2;
fn_2 = @(x, y1,y2,y3)y3;
fn_3 = @(x, y1,y2,y3)-0.5*y1*y3;

%all the boundary conditions
x = 0;
y1 = 0;
y2 = 0;
y3 = 0.33206;

%the number of iterations and the step size
h = 0.2;
n = 50;

% creating the txt file
filename = fopen('output.txt','w');

% write file heading
fprintf(filename,'%-6s %-6s %-6s %-6s\n', 'N', 'F', 'F`', 'F``');

for i = 1:(n-1)
    %getting the k's
    a1 = h * fn_1(x, y1, y2, y3);
    a2 = h * fn_2(x, y1, y2, y3);
    a3 = h * fn_3(x, y1, y2, y3);
    
    b1 = h * fn_1(x+h/2, y1+a1/2, y2+a2/2, y3+a3/2);
    b2 = h * fn_2(x+h/2, y1+a1/2, y2+a2/2, y3+a3/2);
    b3 = h * fn_3(x+h/2, y1+a1/2, y2+a2/2, y3+a3/2);
    
    c1 = h * fn_1(x+h/2, y1+b1/2, y2+b2/2, y3+b3/2);
    c2 = h * fn_2(x+h/2, y1+b1/2, y2+b2/2, y3+b3/2);
    c3 = h * fn_3(x+h/2, y1+b1/2, y2+b2/2, y3+b3/2);
    
    d1 = h * fn_1(x+h, y1+c1, y2+c2, y3+c3);
    d2 = h * fn_2(x+h, y1+c1, y2+c2, y3+c3);
    d3 = h * fn_3(x+h, y1+c1, y2+c2, y3+c3);
    
    %get the solution 
    y1 = y1 + 1/6 * (a1 + 2*b1 + 2*c1 + d1);
    y2 = y2 + 1/6 * (a2 + 2*b2 + 2*c2 + d2);
    y3 = y3 + 1/6 * (a3 + 2*b3 + 2*c3 + d3);
    
    %increase in x
    x = x + h;
    
    %save to file
    fprintf(filename,'%.4f %.4f %.4f %.4f\n', x, y1, y2, y3);
end

fclose(filename);