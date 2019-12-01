%created by liang
%2019.11.28
%*********
%***
%图像加上高斯噪声之后去噪

I = imread('H:/coin.jpg')       %读取一副图像
J = imnoise(I,'gaussian',0,0.02);       %加入高斯噪声
subplot(1,2,1),imshow(I);       %显示图像
subplot(1,2,2),imshow(J); 

K = zeros(518,700);
    for i = 1:100
        J = imnoise(I,'gaussian',0,0.02);
        J1 = im2double(J);
        K = K+J1;
    end
K = K/100;
figure;imshow(K);