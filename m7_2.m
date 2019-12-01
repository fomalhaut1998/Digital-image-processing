%created by liang
%2019.11.30
%*********
%***

%*///*///
%例7.2 压缩比的计算
fi = imread('H:/tes.bmp');             %读取原图（非压缩BMP图）
imwrite(fi,'H:/tes.jpg');               %以jpeg格式压缩
infol = dir('H:/tes.bmp');              
b1 = infol.bytes;                       %得到原图像的字节数
info2 = dir('H:/tes.jpg');              
b2 = info2.bytes;                       %得到压缩图像的字节数
ratio = b1/b2;                              %计算压缩比
figure;imshow('H:/tes.bmp');            %显示原图像
figure;imshow('H:/tes.jpg');                %显示压缩图像
