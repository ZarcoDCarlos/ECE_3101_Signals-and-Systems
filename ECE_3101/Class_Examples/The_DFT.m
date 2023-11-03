%calculating the DFT of a 256x256 matrix and displaying the real component
%in an image

clear all, close all, clc
n = 256;
w = exp(-i*2*pi/n);

% Slow Method of calculating the DFT of 256x256 matrix
% for i=1:n
%     for j=1:n
%         DFT(i,j) = w^((i-1)*(j-1));
%     end
% end

% Fast
[I,J] = meshgrid(1:n,1:n); % Creates two matrices I and J of size 256x256, where each element in I corresponds 
                           % to its row index and each element in J corresponds to its column index
DFT = w.^((I-1).*(J-1));
imagesc(real(DFT)) %real part of DFT is displayed as an image
%positive = yellow
%negative = blue
%x and y axis represnt 256x256 matrix
% image is visualization of the real part of the DFT