% Read the MP3 file into MATLAB
[y,Fs] = audioread('./纸杯1111_缩混.mp3');

% Separate the left and right channel of the audio
left = y(:,1);
right = y(:,2);

% Perform FFT on the left channel
X_left = fft(left);

% Keep only the positive frequencies
X_left = X_left(1:length(X_left)/2+1);

% Convert the FFT result to dB scale
db_left = 20 * log10(abs(X_left));

% Downsample the frequency axis for visualization purposes
db_left = db_left(1:50:end);
f_left = Fs*(0:(length(X_left)/2))/length(X_left);
f_left = f_left(1:25:end);

% Perform FFT on the left channel
X_right = fft(right);

% Keep only the positive frequencies
X_right = X_right(1:length(X_right)/2+1);

% Convert the FFT result to dB scale
db_right = 20 * log10(abs(X_right));

% Downsample the frequency axis for visualization purposes
db_right = db_right(1:50:end);
f_right = Fs*(0:(length(X_right)/2))/length(X_right);
f_right = f_right(1:25:end);

% Plot the FFT result
figure;
plot(f_left, db_left, 'b');
hold on;
plot(f_right, db_right, 'r');%you can use % to display left or right only
hold off;%


