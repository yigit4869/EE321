t = 1: 1: 20;

impulse = [0,0,0,0,0,1,0,0,0,0,0];
x1_seq = (8*((t>=0)-((t-4)>=0))-4*(((t-4)>=0)-((t-13)>=0)));
x2_seq = 0.3.^t .* (t>=0);

impulse_second_order_diff = second_order_diff(impulse,0,0);
impulse_inv_second_order_diff = inv_second_order_diff(impulse);

a = conv(impulse_inv_second_order_diff,impulse_second_order_diff);

y1 = conv(x1_seq,impulse_inv_second_order_diff);
y2 = conv(x2_seq,impulse_inv_second_order_diff);

stem(a(length(impulse) * 0.5 + 0.5:length(impulse)*1.5 - 0.5))
title("Convolution of impulse responses")
xlabel("n")
ylabel("Amplitude")

figure;
subplot(2,1,1);
stem(y1);
title("Y1")
xlabel("n")
ylabel("Amplitude")
subplot(2,1,2);
stem(y2);
title("Y2")
xlabel("n")
ylabel("Amplitude")


function output = second_order_diff(sequence, seq_0, seq_n1)
    output = zeros(1, length(sequence));
    output(1) = sequence(1) - 2 * seq_0 + seq_n1;
    output(2) = sequence(2) - 2 * sequence(1) + seq_0;   
    output(3:end) = sequence(3:end) - 2 * sequence(2:end-1) + sequence(1:end-2);
end

function output = inv_second_order_diff(sequence)   
    firstPass = cumsum(sequence);       
    output = cumsum(firstPass);
end


