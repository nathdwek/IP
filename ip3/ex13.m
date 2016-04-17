close all;

aerial = imadjust(im2double(imread('aerial.tif', 'TIFF')));

figure;subplot(121);
imshow(aerial);title('Original');
subplot(122);
imshow(conv2(aerial,fspecial('unsharp'), 'same'));title('Unsharp masked')
