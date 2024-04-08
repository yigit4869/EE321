T = 4;
Ts = 0.001;
k = 30;
t = 0:Ts:T;

u_t_3 = (t-3 >= 0);
r_t = (t >= 0) .* t;
r_t_3 = (t-3 >= 0) .* (t-3);

x3 = r_t - r_t_3 - 3*u_t_3;
x3_fourier = FSA(x3,k);

figure(1)
subplot(1,2,1)
stem(real(x3_fourier))
title("fourier coefficient of x3 real")
ylabel("Amplitude")
xlabel("k index")

subplot(1,2,2)
stem(imag(x3_fourier))
ylabel("Amplitude")
title("fourier coefficient of x3 imaginary")
xlabel("k index")

z1 = fliplr(x3);
z2 = (t >= 0) - (t-3 >= 0) -3*(t-3==0)/Ts;
z3 = (t-1 >= 0) - (t+2>= 0).* (t+2) - 3*(t+2 >= 0) .* (t+2);
z4 = (x3 + z1) / 2;
z5 = x3.^2;

N3= length(z3);
z3 = [x3(N3*0.5:N3),x3(1:N3*0.5)];

z1_fourier = FSA(z1,k);
z2_fourier = FSA(z2,k);
z3_fourier = FSA(z3,k);
z4_fourier = FSA(z4,k);
z5_fourier = FSA(z5,k);

figure(2)
subplot(5,2,1)
stem(real(z1_fourier))
title("fourier coefficient of z1 real")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,2)
stem(imag(z1_fourier))
title("fourier coefficient of z1 imaginary")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,3)
stem(real(z2_fourier))
title("fourier coefficient of z2 real")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,4)
stem(imag(z2_fourier))
title("fourier coefficient of z2 imaginary")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,5)
stem(real(z3_fourier))
title("fourier coefficient of z3 real")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,6)
stem(imag(z3_fourier))
title("fourier coefficient of z3 imaginary")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,7)
stem(real(z4_fourier))
title("fourier coefficient of z4 real")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,8)
stem(imag(z4_fourier))
title("fourier coefficient of z4 imaginary")
ylabel("Amplitude")
xlabel("k index")

ylim([-1.5, 2.5])

subplot(5,2,9)
stem(real(z5_fourier))
title("fourier coefficient of z5 real")
ylabel("Amplitude")
xlabel("k index")


subplot(5,2,10)
stem(imag(z5_fourier))
title("fourier coefficient of z5 imaginary")
ylabel("Amplitude")
xlabel("k index")




