%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.15计算雪花图像中雪花大小分布情况

%读取图像并增强
I = imread('H:/snow.jpg');               %读取图像
I = rgb2gray(I);
figure,imshow(I);                           %显示原图像
claheI = adapthisteq(I,'NumTiles',[10 10]); %自适应调整对比度
claheI = imadjust(claheI);                  %亮度调整
figure,imshow(claheI);                      %显示增强后的图像

%计算颗粒度大小的总体的分布
for counter = 0:22
    remain = imopen(claheI,strel('disk',counter));%开运算
    intensity_area(counter + 1) = sum(remain(:));   %剩余像素值
end
figure;
plot(intensity_area,'m - *');               %显示不同半径开运算后剩余的像素和
grid on;

%计算不同半径下的颗粒度分布
intensity_area_prime = diff(intensity_area);%差分
figure;
plot(intensity_area_prime,'m - *');         %显示每个半径下的颗粒度多少
grid on;
title('Granulometry (Size Distribution) of Snowflakes');
set(gca,'xtick',[0 2 4 6 8 10 12 14 16 18 20 22]);
xlabel('radius of snowflakes (pixels)');
ylabel('Sum of pixel values in snowflakes as function of radius');
open5 = imopen(claheI,strel('disk',5));         %半径为5的形态学开运算
open6 = imopen(claheI,strel('disk',6));         %半径为6的形态学开运算
rad5 = imsubtract(open5,open6);                 %半径为5的颗粒度
figure;imshow(rad5,[]);                         %显示半径为5下的图像中颗粒度的分布情况
