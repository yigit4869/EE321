f0 = 440;
t = 0:0.0001:3;
a = 3;
x3 = exp(-(a^2+2)*t).*cos(2*pi*f0*t);
plot(t,x3);
ylabel('x3');
xlabel('t')
title('x3 vs t')
