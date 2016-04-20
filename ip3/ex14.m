%Image Processing session3 2016 -- Nathan Dwek
close all;

SFILTER = 1/9*[-1 -1 -1; -1 8 -1; -1 -1 -1];

original = imadjust(im2double(imread('aerial.tif', 'TIFF')));
filtered = imadjust(conv2(original, SFILTER, 'same'));
builtinFiltered = conv2(aerial,fspecial('unsharp'), 'same');
figure;subplot(121);
imshow(builtinFiltered);title('Builtin unsharp masked');
subplot(122);
imshow(filtered);title('Hand unsharp masked');
%On 2012b: That's quite strong edge detection! (Uniform surfaces are
%nearly blacked out.
%If I recall correctly, on 2015b (at VUB), both results were quite similar.
%I think this is due to a change in default behaviour of imadjust.
%But with no imadjust, everything is <0.1 in both cases.
