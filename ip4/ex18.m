%Image Processing lab4 -- Nathan Dwek
close all; clear all;

LOGSIGMA = 0.7;
LOGSIZE  = 11;

gertrude = im2double(imread('gertrude.tif', 'TIFF'));

logH = fspecial('log', LOGSIZE, LOGSIGMA);

figure('name','Laplacian of Gaussian filter');subplot(131);
mesh(logH);
subplot(132);
surf(logH);
subplot(133);
imagesc(logH);

logertrude = conv2(gertrude, logH, 'same');
figure;
imagesc(gertrude);title('Laplacian of Gaussian applied to Gertrude');

figure('name','Edge detection using Laplacian of Gaussian');i = 1;
for logsigma = 0.7:.7:2.8
    logH = fspecial('log', LOGSIZE, logsigma);
    logertrude = conv2(gertrude, logH, 'same');
    subplot(2,2,i);imshow(zerocros(logertrude));
    title(sprintf('sigma = %g', logsigma));
    i = i+1;
end

%False edges can appear in quasi uniform areas because the first derivative
%is very small and nearly constant in those areas, which means the second
%derivative is very close to zero in the region.

%Sigma defines the width of the gaussian averaging filter. A larger sigma
%allows to reduce the number of false edges.

%This method doesn't rely on heuristic tresholding in order to obtain
%clearly defined edges, and is able to locate edges more precisely then
%methods relying on the first derivatives. However, sigma must be chosen
%correctly in order to avoid false edges.
