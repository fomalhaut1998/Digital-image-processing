%created by liang
%2019.11.30
%*********
%***

%*///*///
%例8.3生成直方图
a = imread('H:/coin.jpg');                  %读取图像
imshow(a);                                  %显示图像
figure,imhist(a);                           %计算并显示图像的直方图
