%created by liang
%2019.11.29
%*********
%***

%*///*///
%��5.5 �Լ��뽷�����������þֲ�5x5��ģ�����ƽ������

img = rgb2gray(imread('H:/coin.jpg'));
figure;imshow(img);
img_noise = double(imnoise(img,'salt & pepper',0.06));
figure;imshow(img_noise,[]);
img_smoothed = imfilter(img_noise,fspecial('average',5));
figure;imshow(img_smoothed,[]);
