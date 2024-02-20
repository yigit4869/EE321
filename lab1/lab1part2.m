f0 = 587;
t = 0:0.0001:3;
phi = pi;
x2 = sin(2*pi*f0*t+phi);
plot(t,x2);
ylabel('x2');
xlabel('t')
xlim([0 0.01]);
title('x2 vs t')
