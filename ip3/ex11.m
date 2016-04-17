close all;

SIGMA = 0.1;
ANISOITERATIONS = 70;
ANISOK = .1;

GSIZE = 7;
GSIGMA = sqrt(2*GSIZE);

lenagray = im2double(imread('lenagray.tif', 'TIFF'));
lenoised = imnoise(lenagray, 'gaussian', 0, SIGMA^2);

anisodiffed = anisodiff(lenoised, ANISOITERATIONS, ANISOK);
gblurred = conv2(lenoised, fspecial('gaussian',[GSIZE GSIZE],GSIGMA),'same');

figure;subplot(221);
imshow(lenagray);
title('Original')
subplot(222);
imshow(lenoised);
title('Noised');
subplot(223);
imshow(anisodiffed);
title('Filtered using anistropic diffusion');
subplot(224);
imshow(gblurred);
title('Filtered using Gaussian blurring');
%The edges are indeed clearer with anisotropic diffusion.
