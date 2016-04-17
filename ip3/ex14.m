close all;

SFILTER = 1/9*[-1 -1 -1; -1 8 -1; -1 -1 -1];

original = imadjust(im2double(imread('aerial.tif', 'TIFF')));
filtered = imadjust(conv2(original, SFILTER, 'same'));
figure;subplot(121);
imshow(original);title('Original')
subplot(122);
imshow(filtered);title('Hand unsharp masked')
