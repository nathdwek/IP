close all;
[aind,amap] = imread('trees.tif','TIF');
imshow(aind, amap);

rgb = ind2rgb(aind, amap);

fprintf('Checking index tr\n%f =? %f\n%f =? %f\n%f =? %f\n', rgb(1,1,1), amap(aind(1,1)+1,1), rgb(1,1,2), amap(aind(1,1)+1,2), rgb(1,1,3), amap(aind(1,1)+1,3));

gray = ind2gray(aind, amap);
figure;
imshow(rgb);
figure;
imshow(gray);

yuvmx = [.299 .587 .114; .596 -0.274 -0.322; .211 -0.523 .312];
yuv = yuvmx*[rgb(1,1,1);rgb(1,1,2);rgb(1,1,3)];
fprintf('Checking yuv\n%f =? %f\n', yuv(1)*255,gray(1,1));
