%22102518
y = 0:1:9;
p = [2 1];
lambda = [3 4 6 7 9];
delta = mod(22102518,7);
deltap = mod(delta, length(p)) + 1;
deltalambda = mod(delta, length(lambda)) + 1;
n1 = p(deltap);
n2 = lambda(deltalambda);

%recObj = audiorecorder(8192,16,1);
%recDuration = 10;
%disp("Begin speaking.")
%recordblocking(recObj,recDuration);
%disp("End of recording.")

data = audioread('my_digit_sound_b.flac');
t = 0 + 1/8192 :1/8192:10;
t_mu = 0 + 1/8192 :1/8192:30;

plot(t, data)
n1data = data([9338:15074]);
n1datacross = flipud(n1data);

mu = abs(ConvFUNC(n1datacross, data));

figure(1)
subplot(1,2,1)
plot(t,data)
title("id_me vs t")
xlabel("t")
ylabel("id_me")

subplot(1,2,2)
plot(t([9338:15074]),n1data)
xlabel("t")
ylabel("n1_me")
title("n1_me vs t")

figure(2)
plot(t_mu([1:length(mu)]),mu)
xlabel("t")
ylabel("Ψ[n]_me")
title("Ψ[n]_me vs t")

figure(3)
mu_sq = mu .* mu;
plot(t_mu([1:length(mu)]),mu_sq)
xlabel("t")
ylabel("Ψ[n]_me^2")
title("Ψ[n]_me^2 vs t")


figure(4)
mu_quad = mu_sq .* mu_sq;
plot(t_mu([1:length(mu)]),mu_quad)
xlabel("t")
ylabel("Ψ[n]_me^4")
title("Ψ[n]_me^4 vs t")

audioFilePath = 'TotalNumber.flac';
[originalAudioData, originalSampleRate] = audioread(audioFilePath);
targetSampleRate = 8192;
dataTotal = resample(originalAudioData, targetSampleRate, originalSampleRate);

audioFilePath = 'n1.flac';
[originalAudioData, originalSampleRate] = audioread(audioFilePath);
targetSampleRate = 8192;
datan1py = resample(originalAudioData, targetSampleRate, originalSampleRate);


datan1_flip = flipud(datan1py);
%datan1_flip = datan1py;
mu_total = abs(ConvFUNC(datan1_flip, dataTotal));


figure(5)
subplot(1,2,1)
plot(t_mu([1:58606]),dataTotal)
xlabel("t")
ylabel("Total")
title("Total_data vs t")

subplot(1,2,2)
plot(t([1:length(datan1py)]),datan1py)
xlabel("t")
ylabel("n1")
title("n1_total vs t")

figure(6)
plot(t_mu([1:length(mu_total)]),mu_total)
xlabel("t")
ylabel("Ψ[n]")
title("Ψ[n] vs t")

figure(7)
mu_sqtotal = mu_total .* mu_total;
plot(t_mu([1:length(mu_total)]),mu_sqtotal)
xlabel("t")
ylabel("Ψ[n]^2")
title("Ψ[n]^2 vs t")


figure(8)
mu_quadtotal = mu_sqtotal .* mu_sqtotal;
plot(t_mu([1:length(mu_total)]),mu_quadtotal)
xlabel("t")
ylabel("Ψ[n]^4")
title("Ψ[n]^4 vs t")









