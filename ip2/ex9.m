close all;

baboon = im2double(imread('baboon.tif', 'TIF'));

equalized = histeq(baboon, ones(64,1));

figure;imshow(equalized);
figure;imhist(equalized, 64);
%The equalized histogram can never be perfectly uniform because the
%original one is not uniform. The equalized one is just stretched and
%recentered.

