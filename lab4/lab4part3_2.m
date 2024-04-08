
T = 4;
Ts = 0.001;
k = 30;
t = 0:Ts:T;
m = 100;
c = 0.1;
small_k = 0.1;
u_t_3 = (t-3 >= 0);
r_t = (t >= 0) .* t;
r_t_3 = (t-3 >= 0) .* (t-3);

x3 = r_t - r_t_3 - 3*u_t_3;

y = zeros(1,length(x3));
y(1) = 0;
y(2) = x3(2)/100.2;
for n = 3:length(x3)
    y(n) = (x3(n) + (2*m+c)*y(n-1) + (-m)*y(n-2)) / (m+c+small_k) ;

end

y_fo = FSA(y,k);

dy_fo = zeros(1,length(y_fo));
dy2_fo = zeros(1,length(y_fo));
for n = 1:length(y_fo)
    k = ((n-(length(y_fo)+1)/2));
    dy_fo(n) = y_fo(n) * (1i*k*2*pi)/T; 
end

for n = 1:length(y_fo)
    k = ((n-(length(y_fo)+1)/2));
    dy2_fo(n) = y_fo(n) * (-1)*(k^2)*4*(pi^2)/(T^2); 
end
x3_fo = m * dy2_fo + c*dy_fo + small_k * y_fo;
x3_foo = FSA(x3,k);

figure(1)
subplot(2,1,1)
plot(t,y);
xlabel("t")
ylabel("Amplitude")
title("y (output signal) vs t")

subplot(2,1,2)
plot(t,x3)
xlabel("t")
ylabel("Amplitude")
title("x3 (input signal) vs t")

figure(2)
subplot(2,2,1)
stem(real(y_fo))
ylabel("Amplitude")
title("fourier coefficient of y (output signal) real")
xlabel("k index")

subplot(2,2,2)
stem(imag(y_fo))
ylabel("Amplitude")
title("fourier coefficient of y (output signal) imaginary")
xlabel("k index")

subplot(2,2,3)
stem(real(x3_foo))
ylabel("Amplitude")
title("fourier coefficient of x3 (input signal) real")
xlabel("k index")

subplot(2,2,4)
stem(imag(x3_foo))
ylabel("Amplitude")
title("fourier coefficient of x3 (input signal) imaginary")
xlabel("k index")

