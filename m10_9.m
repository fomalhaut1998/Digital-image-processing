%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.11 计算图形区域的与区域有着相同面积的圆的直径
I = imread('H:/coin.jpg');              %读取图像
BW = im2bw(I);                          %图像二值化
BL = bwlabel(BW);                       %对图像的各个区域给出不同的标记
F = regionprops(BL,'EquivDiameter');     %对图像的各个区域的EquivDiameter值
for i=1:10
    F(i);                               %显示10个区域的EquivDiameter值
end
