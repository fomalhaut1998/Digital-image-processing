%created by liang
%2019.11.29
%*********
%***

%*///*///
%6.4采用标准的均值、中值滤波器对附加脉冲噪声后的图像进行滤波
img = rgb2gray(imread('H:/coin.jpg'));      %读取图像并转换为灰度图像
figure;imshow(img);                         %显示图像
img_noise = double(imnoise(img,'salt & pepper',0.06));      %加上椒盐噪声
figure;imshow(img_noise,[]);                    %显示附加了椒盐噪声后的图像
img_mean = imfilter(img_noise,fspecial('average',5));   %对附加有椒盐噪声的图像实行算术均值滤波
figure;imshow(img_mean,[]);                    %显示算术均值滤波后的图像
img_median = medfilt2(img_noise);               %对附加有椒盐噪声的图像实行中值滤波
figure;imshow(img_median,[]);                   %显示中值滤波后的图像
img_median2 = medfilt2(img_median);             %对中值滤波后的图像再进行中值滤波
figure;imshow(img_median2,[]);                  %显示再次中值滤波后的图像
