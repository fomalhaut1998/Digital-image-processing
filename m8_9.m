%created by liang
%2019.12.1
%*********
%***

%*///*///
%例8.11 形态学区域填充
i = imread('H:/coin.jpg');                  %读取原图像
BW1 = im2bw(I);                             %二值化
figure,imshow(BW1);                         %显示二值图像
BW2 = bwfill(BW1,'holes');                  %进行区域填充
figure,imshow(BW2);                         %显示填充后的结果
