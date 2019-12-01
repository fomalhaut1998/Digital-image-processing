%created by liang
%2019.12.1
%*********
%***

%*///*///
%例8.10 边界轮廓提取
I = imread('H:/coin.jpg');              %读取图像
I = im2bw(I);                           %图像二值化
figure,imshow(I);                       %显示原图
se = strel('square',3);                 %选取3x3正方形结构元素
Ie = imerode(I,se);                     %对图像进行腐蚀
Iout1 = I-Ie;                           %原图像减去腐蚀结果
figure,imshow(Iout1);                   %显示边界轮廓
Iout2 = bwperim(I,4);                   %用bwperim提取边界
figure,imshow(Iout2);                   %显示边界提取结果