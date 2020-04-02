k = 1;
kp = 1.25;
kds = 4;
G1 = tf(k, [1 1]) * tf(1,1);
G2 = kp;
g = G1*G2;
h = kds;
H = feedback(g,h);