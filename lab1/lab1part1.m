f0 = 440;
t = 0:0.0001:3;
x1 = sin(2*pi*f0*t);

figure(1)

plot(t,x1);
ylabel('x1');
xlabel('t')
xlim([0 0.01]);
title('x1 vs t')

s = sin(2*pi*440*t) + sin(2*pi*554*t) + sin(2*pi*659*t);
figure(2)
plot(t,s);
ylabel('s');
xlabel('t')
title('s vs t')