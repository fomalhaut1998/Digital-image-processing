%created by liang
%2019.11.29
%*********
%***

%*///*///
%加入高斯噪声，等一个有噪声的图像，求中心移到到零点的频谱图
I = imread('H:coin.jpg');
I = imnoise(I, 'gaussian',0,0.01);
figure;imshow(I);
P = fftshift(fft2(2));
figure;imshow(log(abs(P)),[0,80]);
