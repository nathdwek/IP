close all;

lenad = im2double(imread('lenad.tif','TIF'));
lenal = im2double(imread('lenal.tif','TIF'));

figure;
imshow(lenad);
%No contrast because everything is dark.
figure;
imshow(lenal);
%No contrast because everything is light.
figure;
imhist(lenad,64);
%Indeed, most of the pixels are on the dark side
figure;
imhist(lenal,64);
%indeedm most of the pixels are on the light side.

lenagray = im2double(imread('lenagray.tif','TIF'));
lenalc = im2double(imread('lenalc.tif','TIF'));

figure;
imshow(lenagray);
%Constrast and tones are good
figure;
imshow(lenalc);
%Contrast feels too low, but the image doesn't feel shifted too one end of
%the spectrum
figure;
imhist(lenagray,64);
%Indeed, the histogram stretches across the gray scale and is auite uniform
figure;
imhist(lenalc,64);
%indeed, the histogram is concentrated towards the centrum of the spectrum
