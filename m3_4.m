%created by liang
%2019.11.28
%*********
%***
%提取椒盐噪声

I = imread('H:/coin.jpg');
J = imread('H:/coin.jpg');
K = imsubtract(I, J);           %实现两幅图像相减
K1 = 255-K;                       %将图片求反显示
figure;imshow(I);title('有噪声的图');
figure;imshow(J);title('原始图像');
figure;imshow(K);title('提取的噪声');
