close all;

mandrill = imread('mandrill.tif', 'TIF');
zebra = imread('zebra.tif', 'TIF');

mfreq = fft2(mandrill);
zfreq = fft2(zebra);

figure;
imshow(log10(1+abs(mfreq)),[]);
figure;
imshow(log10(1+abs(zfreq)), []);

figure;
imshow(log10(1+abs(fftshift(mfreq))),[]);
figure;
imshow(log10(1+abs(fftshift(zfreq))), []);

zmfreq = abs(zfreq).*exp(1i*angle(mfreq));
mzfreq = abs(mfreq).*exp(1i*angle(zfreq));

figure; subplot(2,2,1)
imshow(mandrill);
subplot(2,2,2);
imshow(zebra);
subplot(2,2,3);
imshow(round(ifft2(zmfreq)), []);
subplot(2,2,4);
imshow(round(ifft2(mzfreq)), []);

%I'm surprised by how well you can still recognize the image after altering
%the phase. I don't really know why, but it seems like the edges are all
%really well preserved.
