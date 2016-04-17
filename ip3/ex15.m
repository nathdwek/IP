close all;
UFILTER = 1/9*ones(3);

original = imadjust(im2double(imread('aerial.tif', 'TIFF')));
noised = imnoise(original, 'gaussian', 0, 0.001);

sfilter = fspecial('unsharp');
unsharped = conv2(original, sfilter, 'same');
nunsharped = conv2(noised, sfilter, 'same');
denoised = conv2(noised, UFILTER, 'same');
dnunsharped = conv2(denoised, sfilter, 'same');

figure;subplot(221);
imshow(original);title('Original');
subplot(222);
imshow(unsharped);title('Original unsharp masked');
subplot(223);
imshow(nunsharped);title('Noised unsharp masked');
subplot(224);
imshow(dnunsharped);title('Denoised unsharp masked');



