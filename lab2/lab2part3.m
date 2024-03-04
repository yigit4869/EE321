t = -10.25:0.25:10.25;
u = @(t) double(t>=0);
e = u(t+5)-u(t-5);
n = u(t+2.5)-u(t-2.5);
mu = ConvFUNC(e,n);
ts = -20.5:0.25:20.5;

flipped_sequence = fliplr(n);
new_flipped_sequence = zeros(1,83);
new_flipped_sequence(2:21) = flipped_sequence(33:52);
shifted_sequence = new_flipped_sequence;

for  i = 1:165
shift_length = min(i, length(n));
subplot(2,2,1)
plot(t,e)
xlabel("n")
ylabel("ξ[n]")
title("ξ[n]")

subplot(2,2,2)
plot(t,n)
xlabel("n")
ylabel("η[n]")
title("η[n]")

subplot(2,2,3)
plot(t,e)
xlabel("n")
title("shifted sequence η[n] and ξ[n]")
hold on

plot(t,shifted_sequence)
hold off
subplot(2,2,4)

plot(ts,mu)
xlabel("n")
ylabel("Ψ[n]")
title("Ψ[n]")
xlim([-10.25 -10.25 + shift_length*0.32])
ylim([0 20])

shifted_sequence = [zeros(1, shift_length), new_flipped_sequence(1:end-shift_length)];
drawnow
pause(0.1);
end


