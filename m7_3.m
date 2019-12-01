%created by liang
%2019.11.30
%*********
%***

%*///*///
%例7.4 用游程编码对二值化图像进行编码

I = imread('H:/coin.jpg');          %读取图像
if ndims(I)>2                   %对非单通道的图像转换成灰度图像
    I = rgb2gray(I);
end
BW = im2bw(I,0.4);                  %对图像进行二值化
[zipped,info] = RLEencode(BW);      %调用RLEencode函数对BW进行游程编码
unzipped = RLEdecode(zipped,info);      %调用RLEdecode函数对zipped进行游程编码
subplot(131);imshow(I);                 %显示原图像
subplot(132);imshow(BW);                %显示二值化图像
subplot(133);imshow(uint8(unzipped)*255);   %显示二值化编码后的图像
cr = info.ratio;                            %显示压缩比
whos BW unzipped zipped;                    %显示二值化图像、压缩解压图像、压缩图像的信息