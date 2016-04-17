%Image Processing -- Nathan DWEK (ULB)
close all;

medical = im2double(imread('medical.tif', 'TIF'));

air = zeros(size(medical));
blood = zeros(size(medical));
bone = zeros(size(medical));
for i = 1:numel(medical)
    if medical(i) > .5
        bone(i) = 1;
    end
    if medical(i) < .3
        air(i) = 1;
    end
    if medical(i) < .5 && medical(i) > .44
        blood(i) = 1;
    end
end

figure;
subplot(2,2,1);
imshow(medical);
title('overview');

subplot(2,2,2);
imshow(air);
title('air');

subplot(2,2,3);
imshow(blood);
title('blood');

subplot(2,2,4);
imshow(bone);
title('bone');
