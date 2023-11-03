clear all, close all, clc

% Read the image file 'dog.jpg' and store it in a variable 'A'
A = imread('dog.jpg');

% Convert the RGB image stored in 'A' to grayscale and store it in 'B'
B = rgb2gray(A);

%1-Dimensional: rows only
% Compute the FFT of each row of the grayscale image stored in 'B'
% Store the results in two arrays named 'Cshift' and 'C'
for j = 1:size(B,1)
    % Compute the FFT of the jth row of 'B', shift the zero-frequency component to the center of the array,
    % and store the result in the jth row of 'Cshift'
    Cshift(j,:) = fftshift(fft(B(j,:)));
    
    % Compute the FFT of the jth row of 'B' and store the result in the jth row of 'C'
    C(j,:) = fft(B(j,:));
end

% 2-Dimensional: rows and columns
% Compute the FFT of each column of 'C' and store the results in an array named 'D'
for j = 1:size(C,2)
    D(:,j) = fft(C(:,j));
end

% Display three images side by side using subplot
% The first image shows the original grayscale image stored in 'B'
% The second image shows how much each frequency component contributes to the image in terms of a one-dimensional frequency spectrum
% The third image shows how much each frequency component contributes to both horizontal and vertical directions in terms of a two-dimensional frequency spectrum
subplot(1,3,1)
imagesc(B);
subplot(1,3,2)
imagesc(log(abs(Cshift)))
subplot(1,3,3)
imagesc(fftshift(log(abs(D))))
colormap gray % Set color map of current figure to gray

% For analyzing graphs:
% White indicates more intense values

% The second image is one-dimensional: it shows the magnitude of the Fourier Transform of each row of the grayscale image stored in 'B'.
% It analyzes the frequency content of each row of the grayscale image.

% The third image is two-dimensional: it shows how much each frequency component contributes to both horizontal and vertical directions.
% The zero-frequency component (average value of the image) is shifted to the center.
