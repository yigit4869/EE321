
t = 1: 1: 20;
impulse = [0,0,0,0,0,1,0,0,0,0,0];
n_range = 0:5;

x1_seq = (8*((t>=0)-((t-4)>=0))-4*(((t-4)>=0)-((t-13)>=0)));
x2_seq = 0.3.^t .* (t>=0);

impulse_second_order_diff = second_order_diff(impulse,0,0);
y1 = conv(x1_seq,impulse_second_order_diff);
y2 = conv(x2_seq,impulse_second_order_diff);

stem(y1);
title("Y1")
xlabel("n")
ylabel("Amplitude")

figure;
stem(y2);
title("Y2")
xlabel("n")
ylabel("Amplitude")

figure;
stem(impulse_second_order_diff);
title("Impulse response")
xlabel("n")
ylabel("Amplitude")

figure;
sum_elements = sumElements(impulse_second_order_diff,n_range);
stem(sum_elements);
title("Sum elements")
xlabel("n")
ylabel("Amplitude")



function output = second_order_diff(sequence, seq_0, seq_n1)
    output = zeros(1, length(sequence));
    output(1) = sequence(1) - 2 * seq_0 + seq_n1;
    output(2) = sequence(2) - 2 * sequence(1) + seq_0;   
    output(3:end) = sequence(3:end) - 2 * sequence(2:end-1) + sequence(1:end-2);
end


function sum_array = sumElements(h, N_range)  
    sum_array = zeros(1, length(N_range));        
    for n = 1:length(N_range)
        rangeIndices = (6 - N_range(n)):(6 + N_range(n)); 
        sum_array(n) = sum(abs(h(rangeIndices))); 
    end
end
