%created by liang
%2019.11.30
%*********
%***

%*///*///
%例6.7运动模糊退化
I = imread('H:/coin.jpg');          %读取图像
I = rgb2gray(I);                    %转换为灰度图
figure;imshow(I);                   %显示图像
LEN = 25;                           %设置线性运动位移
THETA = 11;                         %设置旋转角度
PSF = fspecial('motion',LEN,THETA); %图像线性运动
Blurred = imfilter(I,PSF,'circular','conv');%图像被线性运动模糊
figure;imshow(Blurred);             %显示运动模糊后的图像