%Image Processing -- Nathan DWEK (ULB)
close all;

X=[1 2 3;3 1 2;2 3 1];
X_map=[1 0 0;0 1 0;0 0 1];
imshow(X,X_map,'InitialMagnification', 'fit');
X_map=[1 1 0;0 1 1;1 0 1];
figure;
imshow(X,X_map,'InitialMagnification', 'fit');
figure;
X_map=[0 0 0;0.5 .5 0.5;1 1 1];
imshow(X,X_map,'InitialMagnification', 'fit');
