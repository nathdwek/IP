%Image Processing -- Nathan DWEK (ULB)
close all;

RSIZE = 4;
SIZE = 2^(4+RSIZE);

img = zeros(SIZE);
img(SIZE/2-SIZE/16:SIZE/2+SIZE/16, SIZE/2-SIZE/4:SIZE/2+SIZE/4) = 1;
imshow(img);

figure;
subplot(211);
imagesc(10*log10(abs(fftshift(fft2(img))).^2));
subplot(212);
surfc(10*log10(abs(fftshift(fft2(img))).^2));
%The image can be seen as a horizontal pulse multiplied by a vertical
%pulse.
%It is thus logical that its fft is the convolution of an x sinc and a y
%sinc.
%The periods are different because the relative length are different in the
%two dimensions.
%The energy is more concentrated at higher frequencies in the y dimension
%since the pulse is shorter in that dimension.

figure;
subplot(211);
imagesc(10*log10(abs(fftshift(fft2(img))).^2));
subplot(212);
imagesc(10*log10(abs(fftshift(fft2(imrotate(img,45)))).^2));
%The spectrum of the rotated image is also rotated. This demonstrated the
%linearity of the dft.

