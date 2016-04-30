%Image Processing lab4 -- Nathan Dwek
close all; clear all;

SIGMA = .05;
AVGSIZE = 5;

gertrude = im2double(imread('gertrude.tif', 'TIFF'));

gernoised = imnoise(gertrude, 'gaussian', 0, SIGMA^2);

vtSobel = -fspecial('sobel');
hzSobel = vtSobel';

hzed = conv2(gernoised, hzSobel, 'same');
vted = conv2(gernoised, vtSobel, 'same');
gradientAbs = sqrt(vted.^2 + hzed.^2);

avgH = ones(AVGSIZE)/AVGSIZE;
avgertrude = conv2(gernoised, avgH, 'same');
hzed = conv2(avgertrude, hzSobel, 'same');
vted = conv2(avgertrude, vtSobel, 'same');
avgradientAbs = sqrt(vted.^2 + hzed.^2);

figure;subplot(121);
imshow(gradientAbs);title('Edge no avg');
subplot(122);
imshow(avgradientAbs);title('Edge avg');
%Averaging doesn't sound like a good idea. Artifacts don't seem to
%disappear, but the edges are getting spread very rapidly.
%As we saw in the previous lab, edge detection needs the high frequency
%content of the image to be preserved, so averaging filters are not a good
%idea to denoise. Maybe anisodiff would be better?

%With all that being said, the edge detection after averaging is able to
%detect to edges that are not detected without averaging.

figure;subplot(221);
imshow(im2bw(gradientAbs, 0.3));title('Edge no avg, tresh = 0.3');
subplot(222);
imshow(im2bw(gradientAbs, 0.4));title('Edge no avg, tresh = 0.4');
subplot(223);
imshow(im2bw(avgradientAbs, 0.3));title('Edge avg, tresh = 0.3');
subplot(224);
imshow(im2bw(gradientAbs, 0.4));title('Edge avg, tresh = 0.4');
%A good choice of the treshold seems like the most important factor. With
%treshold >0.4 the edges are correctly selected, regardless of averaging.
%It seems like (bad/too large) averaging can only hinder the edge
%detection.
figure;
imshow(im2bw(gradientAbs, 0.45));title(sprintf('Final result\nEdge no avg, tresh = 0.45'));
