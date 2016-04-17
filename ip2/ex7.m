close all;

baboon = im2double(imread('baboon.tif', 'TIF'));

imshow(baboon);
figure;
imhist(baboon, 64);

baboon_adjusted = imadjust(baboon,[min(min(baboon)); max(max(baboon))],[0; 1],1);
figure;imshow(baboon_adjusted);
figure;imhist(baboon_adjusted, 64);
%Image looks good, and histogram is indeed stretched. Yay!
