%created by liang
%2019.11.29
%*********
%***

%*///*///
%例5-3  对灰度图像进行均衡化，灰度等级8级
I = imread('H:/coin.jpg');
I = rgb2gray(I);
K = 16;H = histeq(I,K);
figure;subplot(221);imshow(I,[]);
subplot(222);imshow(H,[]),hold on;
subplot(223),hist(double(I),16),subplot(224),hist(double(H),16);
