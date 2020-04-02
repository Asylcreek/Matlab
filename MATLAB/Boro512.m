G1 = 5;
G2 = tf(1, [1 -1]);
g = G1*G2;
h = tf([1 2], [1 2 2]);
H = feedback(g, h);
pole = pole(H)
[Gm] = margin(H);