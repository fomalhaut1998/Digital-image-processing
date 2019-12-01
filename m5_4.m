%created by liang
%2019.11.29
%*********
%***

%*///*///
%例5.5 对加入椒盐噪声，采用局部5x5的模板进行平滑处理

img = rgb2gray(imread('H:/coin.jpg'));
figure;imshow(img);
img_noise = double(imnoise(img,'salt & pepper',0.06));
figure;imshow(img_noise,[]);
img_smoothed = imfilter(img_noise,fspecial('average',5));
figure;imshow(img_smoothed,[]);
