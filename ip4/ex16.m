%Image Processing lab4 -- Nathan Dwek
close all; clear all;

gertrude = im2double(imread('gertrude.tif', 'TIFF'));

vtSobel = -fspecial('sobel');
hzSobel = vtSobel';
%Both the Sobel and the Prewitt operator do a derivative operation along
%along one axis, and a smoothing operation along the other. The weight
%distribution is different between Sobel and Prewitt: Sobel gives more
%weight to the "middle" sample.

hzed = conv2(gertrude, hzSobel, 'same');
vted = conv2(gertrude, vtSobel, 'same');
gradientAbs = sqrt(vted.^2 + hzed.^2);

figure;subplot(221);
imshow(gertrude);title('original');
subplot(222);
imshow(hzed);title('Horizontal derivative');
subplot(223);
imshow(vted);title('Vertical derivative');
%You can clearly see which one is vertical and which one is horizontal.
subplot(224);
imshow(gradientAbs);title('Gradient amplitude');

%The edge on Gertrude's right cheek is less clearly defined then the one on
%her left cheek. This is probably due to the shadows of her hair on her
%right side, which make the transition to the dark hair to the pale skin
%less pronounced. Improfile indeed shows that the slope along the "normal"
%to her cheek it low and long on her right side, and sharp and short on her
%left side.

%Also, her left cheek simply appears lighter then her right cheek so the change
%can be more significant.

figure;
imshow(im2bw(gradientAbs, 0.3));title('tresholded gradient amplitude');
%Anything that involves tresholding can't be linear.

