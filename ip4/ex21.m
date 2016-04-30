%Image Processing Lab4 -- Nathan Dwek
clear all; close all;

WAVELET = 'bior4.4';

lena = im2double(imread('lenagray.tif', 'TIFF'));

[C, S] = wavedec2(lena, 3, WAVELET);

A = appcoef2(C, S, WAVELET);
myshow(A,64);

HH = {};
HL={};
LH={};

for i=1:3
    [LH{i}, HL{i}, HH{i}] = detcoef2('all',C,S,i);
    %H      V      D
    %This is logical: if you filter highpass along on axis and lowpass
    %along the other, you see edges/details that are perpendicular to the highpass
    %axis
    %Uncomment to see the details.
    %myshow(LH{i},128);
    %myshow(HL{i},128);
    %myshow(HH{i},128);
end
figure;
lim = 0;
subplot(2,2,1);
imshow(lena);title('original')
for i=1:3
    lim = lim+3*prod(S(end-i,:),2);
    C(1,end:-1:end-lim) = 0;
    subplot(2,2,i+1)
    compressed = waverec2(C,S,WAVELET);
    imshow(compressed);
    title(sprintf('details ignored up to level %d\nPSNR = %g',i,psnr(compressed, lena)));
end
%The error appear on the edges where we can see the effects of the
%successive low pass filters. Quite literally, the details are not as sharp
%as in the original.





