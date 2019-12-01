%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9-10 彩色图像锐化
%使用经典的Laplacian滤波模板分别对每个分量图像进行锐化

rgb = imread('H:/coin.jpg');            %读取图像
fR = rgb(:,:,1);                            %图像的红色分量
fG = rgb(:,:,2);                            %图像的绿色分量
fB = rgb(:,:,3);                            %图像的蓝色分量
lapMatrix = [1 1 1;1 -8 1;1 1 1];           %Laplacian滤波模板
fR_tmp = imfilter(fR,lapMatrix,'replicate');%对图像红色分量锐化滤波
fG_tmp = imfilter(fG,lapMatrix,'replicate');%对图像绿色分量锐化滤波
fB_tmp = imfilter(fB,lapMatrix,'replicate');%对图像蓝色分量锐化滤波
rgb_tmp = cat(3,fR_tmp,fG_tmp,fB_tmp);      %滤波后三分量组合
rgb_sharped = imsubtract(rgb,rgb_tmp);      %原图像与锐化图像的差
figure(1),imshow(rgb_tmp),title('滤波后图像');
figure(2),imshow(rgb_sharped),title('滤波图像与原图像之差');
