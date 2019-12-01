%created by liang
%2019.11.29
%*********
%***

%*///*///
%例6.1噪声图像和他们的直方图
A = imread('H:/coin.jpg');          %读取图像
figure,imshow(A);                   %显示图像
figure,hist(double(A),10);          %求出A的直方图并显示
B = imnoise(A,'gaussian',0.05);     %对A附加高斯噪声
figure,imshow(B);                   %显示附加高斯噪声后的图像B
figure,hist(double(B),10);          %求出B的直方图并显示
C = imnoise(A,'speckle',0.05);      %对A附加均匀分布噪声
figure,imshow(C);                   %显示附加分布均匀噪声后的图像C
figure,hist(double(C),10);          %求出C的直方图并显示
D = imnoise(A,'salt & pepper',0.05);%对A附加椒盐噪声
figure,imshow(D);                   %显示附加检验噪声后的图像D
figure,hist(double(D),10);          %求出D的直方图并显示
