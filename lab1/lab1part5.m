ts = 0:0.0001:2;
f0i = 500 ;
u = 500;
fi = 2*u*ts + f0i;
phi = 0;
x5 = cos(2*pi*u*ts.^2 + 2*pi*f0i*ts + phi);
figure(6)
plot(ts,x5);
ylabel('x5');
xlabel('t');
title('x5 vs t')
xlim([0 0.3]);

ts1 = 0:0.0001:3;
f0i = 3000;
u = -2500/3;
fi2 = 2*u*ts1 + f0i;
x5_2 = cos(2*pi*u*ts1.^2 + 2*pi*f0i*ts1 + phi);
figure(7)
plot(ts1,x5_2);
ylabel('x5');
xlabel('t')
title('x5 vs t (A Chirp Puzzle)')
