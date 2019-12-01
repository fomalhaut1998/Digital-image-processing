%created by liang
%2019.11.29
%*********
%***

%*///*///
%例5-1 对图像进行反转
Img1 = imread('H:/coin.jpg');
figure;imshow(Img1);title('original image');
img2 = imcomplement(Img1);
figure,imshow(img2);title('negative image');
