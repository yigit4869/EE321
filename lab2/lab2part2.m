x = [0 0 1 1 1 0 0 0 1 1 1 ];
h = [0 0 1 1 1 0 0 0 1 1 1 ];
y = conv(x, h);
z = 3 : 5;

t = ConvFUNC(x,h);
subplot(2,2,1)
stem(x)
xlabel("n")
ylabel("ξ[n]")
title("ξ[n]")

subplot(2,2,2)
stem(h)
xlabel("n")
ylabel("ξ[n]")
title("ξ[n]")

subplot(2,2,3)
stem(y)
xlabel("n")
ylabel("Ψ[n]")
title("Ψ[n] (product of convolution)")


