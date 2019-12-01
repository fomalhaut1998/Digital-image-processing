%created by liang
%2019.11.30
%*********
%***

%*///*///
%例7.1求图像的熵
I = imread('H:/coin.jpg');              %读取图像
x = double(I);                          %转换为double型
n = 256;                            %灰度级总数
xh = hist(x(:),n);                  %计算出图像的直方图
xh = xh/sum(xh(:));                     %求出每个灰度级出现的频率
i= find(xh);                            %直方图对应的灰度级
h = -sum(xh(i).*log2(xh(i)))            %求出图像的熵
