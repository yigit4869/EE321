n_range = 100:300:10000;
t = -10000: 1: 10000;

ha05 =  exp(-0.5*t) .* (t >= 0);

ha025 = exp(-0.25*t) .* (t >= 0);

ha01 =  exp(-0.1*t) .* (t >= 0);

ha005 = exp(-0.05*t) .* (t >= 0);

ha0 =  exp(-0.0*t) .* (t >= 0);

a_values = [0.5,0.25,0.1,0.05,0.0];
h_values = {ha05,ha025,ha01,ha005,ha0};

for i = 1:1:length(a_values)
    sum_array = sumElements(h_values{i},n_range);
    subplot(3,2,i);
    plot(n_range,sum_array);
    title("a = ",a_values(i));
    xlabel("N");
    ylabel("Sum")
end

function sum_array = sumElements(h, N_range)
    midIndex = 10001;  
    sum_array = arrayfun(@(N) sum(abs(h(midIndex - N : midIndex + N))), N_range);
end
