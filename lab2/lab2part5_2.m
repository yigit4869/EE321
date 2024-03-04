audioFilePath = 'TotalNumber.flac';                   
[originalAudioData, originalSampleRate] = audioread(audioFilePath);
targetSampleRate = 8192;
audio_array = resample(originalAudioData, targetSampleRate, originalSampleRate);
audio_len = length(audio_array);

audioFilePath = 'n1.flac';
[originalAudioData, originalSampleRate] = audioread(audioFilePath);
targetSampleRate = 8192;
filter = resample(originalAudioData, targetSampleRate, originalSampleRate);

for snr = 0.01:-0.001:0.001
    p_signal = sum(audio_array .* audio_array) / audio_len;
    p_noise = p_signal / snr;  
    rng (5)
    awgn = sqrt ( p_noise ).* randn ([ audio_len , 1]);
    noisy_audio = awgn + audio_array;
    filter_flip = flipud(filter);
    output = ConvFUNC(noisy_audio, filter_flip);  
    i = 11 - snr * 1000;
    subplot(5,2,i) 
    plot(output)
    xlabel("time")
    ylabel("output")
    title(['SNR = ', num2str(snr), ' - Output vs. Time']);
end

