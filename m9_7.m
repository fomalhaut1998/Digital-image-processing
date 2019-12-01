%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9.8 用空间滤波法-邻域平均进行彩色图像平滑滤波

rgb = imread('H:/coin.jpg');                %读取图像
fR = rgb(:,:,1);                            %图像的红色分量
fG = rgb(:,:,2);                            %图像的绿色分量
fB = rgb(:,:,3);                            %图像的蓝色分量
w = fspecial('average');                    %均值滤波模板
fR_filtered = imfilter(fR,w);               %对图像红色分量进行滤波
fG_filtered = imfilter(fG,w);               %对图像绿色分量进行滤波
fB_filtered = imfilter(fB,w);               %对图像蓝色分量进行滤波
rgb_filtered = cat(3,fR_filtered,fG_filtered,fB_filtered);
                                            %将滤波后的三个分量组合得到新的彩色图像
subplot(221),imshow(fR);
subplot(222),imshow(fG);
subplot(223),imshow(fB);
subplot(224),imshow(rgb_filtered);          %对图像进行显示