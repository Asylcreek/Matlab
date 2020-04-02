A = [-3 1; 0 -2];
B = [1;2];
C = [1 1];
D = 0;
[num, denom] = ss2tf(A, B, C, D);
H = tf(num, denom);
poles = pole(H);
% h=s2c(H,1);