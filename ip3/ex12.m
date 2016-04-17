close all;

cman = im2double(imread('cameraman.tif', 'TIFF'));

cnoised = imnoise(cman, 'salt & pepper');

cfiltered = medianfilter(cnoised);

figure;subplot(221);
imshow(cman);title('Original');
subplot(222);
imshow(cnoised);title('With salt & pepper noise');
subplot(223);
imshow(cfiltered);title('Median filtered');
