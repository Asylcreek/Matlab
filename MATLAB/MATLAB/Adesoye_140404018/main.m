%% Numerical Solution of Blasius Equation Using Runge-Kutta
% step size
h = 0.2;

% number of iteration
n = 10/h;

% initial condition
eta = 0;
f = 0;
fp = 0;
fpp = 0.33206;

% open file object
fileID = fopen('velOut.txt','w');

% write file heading
fprintf(fileID,'%-6s %-6s %-6s %-6s\n', 'N', 'F', 'F`', 'F``');

%save to file
fprintf(fileID,'%.4f %.4f %.4f %.4f\n', eta, f, fp, fpp);

for i = 1:(n)
    %get the ks
    k11 = h * func(f, fp, fpp, 1);
    k12 = h * func(f, fp, fpp, 2);
    k13 = h * func(f, fp, fpp, 3);
    
    k21 = h * func(f+k11/2, fp+k12/2, fpp+k13/2, 1);
    k22 = h * func(f+k11/2, fp+k12/2, fpp+k13/2, 2);
    k23 = h * func(f+k11/2, fp+k12/2, fpp+k13/2, 3);
    
    k31 = h * func(f+k21/2, fp+k22/2, fpp+k23/2, 1);
    k32 = h * func(f+k21/2, fp+k22/2, fpp+k23/2, 2);
    k33 = h * func(f+k21/2, fp+k22/2, fpp+k23/2, 3);
    
    k41 = h * func(f+k31, fp+k32, fpp+k33, 1);
    k42 = h * func(f+k31, fp+k32, fpp+k33, 2);
    k43 = h * func(f+k31, fp+k32, fpp+k33, 3);
    
    %get the solution 
    fpp = fpp + 1/6 * (k13 + 2*k23 + 2*k33 + k43);
    fp = fp + 1/6 * (k12 + 2*k22 + 2*k32 + k42);
    f = f + 1/6 * (k11 + 2*k21 + 2*k31 + k41);
    
    %increment step
    eta = eta + h;
    
    %display solution
    disp([eta, f, fp, fpp]);
    
    %save to file
    fprintf(fileID,'%.4f %.4f %.4f %.4f\n', eta, f, fp, fpp);
end

% close the file objectt
fclose(fileID);