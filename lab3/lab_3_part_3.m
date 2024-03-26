t = 1: 1: 20;

ha05 =  exp(-0.5*t) .* (t >= 0);

ha025 = exp(-0.25*t) .* (t >= 0);

ha01 =  exp(-0.1*t) .* (t >= 0);

ha005 = exp(-0.05*t) .* (t >= 0);

ha0 =  exp(-0.0*t) .* (t >= 0);

x1_seq = (8*((t>=0)-((t-4)>=0))-4*(((t-4)>=0)-((t-13)>=0)));
x2_seq = 0.3.^t .* (t>=0);

y1ideal = conv(ha0,x1_seq);
y2ideal = conv(ha0,x2_seq);

y1005 = conv(ha005,x1_seq);
y2005 = conv(ha005,x2_seq);

y105 = conv(ha05,x1_seq);
y205 = conv(ha05,x2_seq);

y1025 = conv(ha025,x1_seq);
y2025 = conv(ha025,x2_seq);

y101 = conv(ha01,x1_seq);
y201 = conv(ha01,x2_seq);

subplot(5,2,1);
stem(y1ideal);
title("Y1 ideal");
xlabel("n")
ylabel("Amplitude")
subplot(5,2,2);
stem(y2ideal);
title("Y2 ideal");
xlabel("n")
ylabel("Amplitude")


subplot(5,2,3);
stem(y105);
title("Y1, a = 0.5");
xlabel("n")
ylabel("Amplitude")
subplot(5,2,4);
stem(y205);
title("Y2, a = 0.5");
xlabel("n")
ylabel("Amplitude")


subplot(5,2,5);
stem(y1025);
title("Y1, a = 0.25");
xlabel("n")
ylabel("Amplitude")
subplot(5,2,6);
stem(y2025);
title("Y2, a = 0.25");
xlabel("n")
ylabel("Amplitude")


subplot(5,2,7);
stem(y101);
title("Y1, a = 0.1");
xlabel("n")
ylabel("Amplitude")
subplot(5,2,8);
stem(y201);
title("Y2, a = 0.1");
xlabel("n")
ylabel("Amplitude")


subplot(5,2,9);
stem(y1005);
title("Y1, a = 0.05");
xlabel("n")
ylabel("Amplitude")
subplot(5,2,10);
stem(y2005);
title("Y2, a = 0.05");
xlabel("n")
ylabel("Amplitude")

aLabels = ["a = 0.5", "a = 0.25", "a = 0.1", "a = 0.05"];
errorsY1 = {abs(y1ideal-y105),abs(y1ideal-y1025),abs(y1ideal-y101),abs(y1ideal-y1005)};
errorsY2 = {abs(y2ideal-y205),abs(y2ideal-y2025),abs(y2ideal-y201),abs(y2ideal-y2005)};

figure;
for i = 1:length(errorsY1)
    subplot(2, 2, i); 
    stem(errorsY1{i}); 
    title("Y1 " + aLabels{i});
    xlabel("n"); 
    ylabel("Amplitude"); 
end


figure; 
for i = 1:length(errorsY2)
    subplot(2, 2, i); 
    stem(errorsY2{i});
    title("Y2 " + aLabels{i}); 
    xlabel("n"); 
    ylabel("Amplitude"); 
end


