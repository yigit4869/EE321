audioFilePath = 'TotalNumber.flac';
[originalAudioData, originalSampleRate] = audioread(audioFilePath);
targetSampleRate = 8192;
audio_array = resample(originalAudioData, targetSampleRate, originalSampleRate);

audio_len = length(audio_array);
snr = 0.001;
p_signal = sum(audio_array .* audio_array) / audio_len;
p_noise = p_signal / snr;

rng (5)
awgn = sqrt ( p_noise ).* randn ([ audio_len , 1]);

noisy_audio = awgn + audio_array;

