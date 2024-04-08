T1 = 1;
Ts = 0.001;
t1 = 0:Ts:T1;
k = 30;

x1 = 8*cos(10*pi*t1) + 20*sin(6*pi*t1) - 11*cos(30*pi*t1);
x1_fourier = FSA(x1,k);

T2 = 2;
t2 = -T2/2:Ts:T2/2-Ts;

x2 = exp(-t2);
N2 = length(x2);
x2 = [x2((N2)*0.5:N2),x2(1:(N2)*0.5)];
x2_fourier = FSA(x2,k);


subplot(2,2,1)
stem(real(x1_fourier))
title("fourier coefficient of x1 real")
ylabel("Amplitude")
xlabel("k index")


subplot(2,2,2)
stem(imag(x1_fourier))
title("fourier coefficient of x1 imaginary")
ylabel("Amplitude")
xlabel("k index")


subplot(2,2,3)
stem(real(x2_fourier))
title("fourier coefficient of x2 real")
ylabel("Amplitude")
xlabel("k index")


subplot(2,2,4)
stem(imag(x2_fourier))
title("fourier coefficient of x2 imaginary")
ylabel("Amplitude")
xlabel("k index")

sum_a = 0; 
new = abs(x1_fourier).^2;
for n = 1:length(new)
    sum_a = sum_a + new(n);
end


x1_integral = 0;

for currentStep = 0 : Ts : T1
        x1_index = int64(currentStep * (length(x1)-1)/1 + 1);             
        x1_integral = x1_integral +  (abs(x1(x1_index))^2) * Ts;
end
    
parseval = sum(abs(x1_fourier).^2);
