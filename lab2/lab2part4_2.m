y = 0:1:9;
p = [2 1];
lambda = [3 4 6 7 9];
delta = mod(22102518,7);
deltap = mod(delta, length(p)) + 1;
deltalambda = mod(delta, length(lambda)) + 1;
n1 = p(deltap);
n2 = lambda(deltalambda);

data = audioread('my_digit_sound_b.flac');
t = 0 + 1/8192 :1/8192:10;
t_mu = 0 + 1/8192 :1/8192:30;


n1datacross = flipud(n1data);

mu = abs(ConvFUNC(datan1_flip, data));
mu_sq = mu .* mu;
figure(1)
subplot(1,2,1)
mu_quad = mu_sq .* mu_sq;
plot(t_mu([1:length(mu)]),mu_quad)
xlabel("t")
ylabel("Ψ[n]^4_me")
title("Ψ[n]^4_me vs t with python n1")

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
mu_total = abs(ConvFUNC(n1datacross, dataTotal));
mu_sqtotal = mu_total .* mu_total;

subplot(1,2,2)
mu_quadtotal = mu_sqtotal .* mu_sqtotal;
plot(t_mu([1:length(mu_total)]),mu_quadtotal)
xlabel("t")
ylabel("Ψ[n]^4")
title("Ψ[n]^4 vs t with mine n1")








