%Image Processing session3 2016 -- Nathan Dwek
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
%Visually, The prefiltered one looks better. However, I'm not convinced
%denoising in such a way is a really smart thing to do, especially at low
%levels of noise. This is because a uniform filter is a lowpass filter and
%will thus smoothen the edges of the figure. The information lost cannot be
%recovered afterwards, as is shown in those figures (Despite the noise, the
%edges in figure 4 "Denoised unsharp masked" are less pronounced than in
%fig 3 "Noised unsharp masked".). Intuitively, it is easy to see
%that effect of the uniform filter is a blurring of the image, which is
%counterproductive if you want to highlight the edges eventually.

%This shows that the denoising technique should be adapted to the treatment
%that is going to be applied to the image afterwards.

%3.4.4: Page not available. I read this though:
%http://nl.mathworks.com/help/images/examples/deblurring-images-using-a-wiener-filter.html



