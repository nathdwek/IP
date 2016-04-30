%Image Processing lab4 -- Nathan Dwek
clear all; close all;

METHODS = {'canny', 'prewitt', 'sobel', 'roberts', 'log', 'zerocross'};

gertrude = im2double(imread('gertrude.tif', 'TIFF'));

figure;
imshow(edge(gertrude,'canny'));

figure('name', 'Comparison of edge detection methods provided by matlab with default parameters');
for i = 1:length(METHODS);
    subplot(2, 3, i);
    imshow(edge(gertrude, METHODS{i}));
    title(METHODS{i})
end
%Canny works indeed best out of the box.
%By default, every gradient based method uses edge thinning which relies on
%a research of the local maximum. This is why sobel, prewitt and roberts
%detect edges that are a single pixel wide.
