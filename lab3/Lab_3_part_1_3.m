Ts = 0.01;
a = 0.5;
rexp = @(t) exp(-a*t) * (t >= 0);
u = @(t) (t >= 0);
impulse = @(t) (abs(t) <= 0.01 / 2) * (1 / 0.01);
t = -10: 1: 10;
start = -20;

unit_response = DiscreteIntegrator(u,t,Ts,start);
impulse_response = DiscreteIntegrator(impulse,t,Ts,start);
s = DiscreteIntegrator(rexp,t,Ts,start);
h = exp(-a*t) .* (t >= 0);

subplot(2,2,1);
stem(t,unit_response);
title("Unit Step Response");
xlabel("t");
ylabel("Amplitude");
ylim([-4.0,14.0]);

subplot(2,2,2);
stem(t,impulse_response);
title("Impulse Response");
xlabel("t");
ylabel("Amplitude");
ylim([-2.0,3.0]);

subplot(2,2,3);
stem(t,h);
title("Impulse reponse of second system: h(t)");
xlabel("t");
ylabel("Amplitude");
ylim([-2.0,3.0]);

subplot(2,2,4);
stem(t,s);
title("Unit step reponse of second system: s(t)");
xlabel("t");
ylabel("Amplitude");
ylim([-2.0,4]);




