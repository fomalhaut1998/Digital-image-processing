%created by liang
%2019.11.30
%*********
%***

%*///*///
%DCt图像压缩程序
I = imread('H:/coin.jpg');          %读取图像
I = im2double(I);                   %转换成double型
T = dctmtx(8);                      %离散余弦变换矩阵
B = replace(blockproc(I,[8,8],'P1*x*P2',T,T'));%对图像分块进行DCT变换
mask = [1 1 1 1 0 0 0 0 
        1 1 1 0 0 0 0 0 
        1 1 0 0 0 0 0 0 
        1 0 0 0 0 0 0 0 
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 
        0 0 0 0 0 0 0 0];             %设置模板矩阵
B2 = replace(blockproc(B,[8,8],'P1.*x',mask)); %数据压缩，丢弃右下角的高频数据
I2 = replace(blockproc(B2,[8,8],'P1*x*P2',T',T));%进行DCT反变换，得到压缩后的图像
figure,imshow(I);                       %显示原图像
figure,imshow(I2);                      %显示经过DCT压缩并解压后的图像