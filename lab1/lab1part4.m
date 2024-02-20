t = 0:0.0001:3;
f1 = 5;
f2 = 1000;
x4 = cos(2*pi*f1*t).*cos(2*pi*f2*t);
figure(5)

plot(t,x4);
ylabel('x4');
xlabel('t')
title('x4 vs t')
x4_tri = 1/2*(cos(2*pi*f1*t+2*pi*f2*t)+cos(2*pi*f1*t-2*pi*f2*t));
figure(6)

plot(t,x4_tri);
ylabel('x4');
xlabel('t')
title('x4 vs t')