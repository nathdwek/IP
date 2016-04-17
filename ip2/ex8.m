close all;

x = linspace(0.1,.4,100);
ylin = (x-.1)./(.3);
yh = ((x-.1)./(.3)).^2;
yl = ((x-.1)./(.3)).^.5;
figure; hold all;
plot(x,ylin, x, yh, x, yl);
legend('gamma = 1', 'gamma = 2', 'gamma = .5');
%We see that gamma provides additional shifting towards one end or the
%other of the spectrum

lenagray = im2double(imread('lenagray.tif', 'TIF'));
lenadjustedl = imadjust(lenagray,[min(min(lenagray)); max(max(lenagray))],[0; 1],.33);
lenadjustedd = imadjust(lenagray,[min(min(lenagray)); max(max(lenagray))],[0; 1],3);

figure;imshow(lenadjustedd);
figure;imhist(lenadjustedd,64);%Darker
figure;imshow(lenadjustedl);
figure;imhist(lenadjustedl,64);%Lighter

%Works as expected.
