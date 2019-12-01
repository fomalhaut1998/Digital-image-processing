%created by liang
%2019.11.28
%*********
%***
%截取图像的一部分
clear
x = imread('H:/coins.jpg');
imshow(x);
y = x(128:138, 128:138);
figure,imshow(y);
y