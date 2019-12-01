%created by liang
%2019.11.28
%*********
%***
%线性点运算
I = imread('H:/coin.jpg');      %读取一副图像
I = im2double(I);                %转换为double类型
figure(1);subplot(1, 5, 1);
imshow(I);title('原图像','fontsize',7);    %显示原图像
a = 2;b = -50;          %增加对比度
O = a.*I + b/255;
figure(1);subplot(1, 5, 2);
imshow(O);title('a=2,增加对比度','fontsize',7);
a = 0.5;b = -50;        %减少对比度
O = a.*I + b/255;
figure(1);subplot(1, 5, 3);imshow(O);
title('a=0.5, b=-50，减少对比度','fontsize', 7);
a = 1;b = 50;       %线性增加亮度
O = a.*I+b/255;
figure(1);subplot(1, 5, 4);imshow(O);
title('a=0.5, b=50，线性平移增加亮度','fontsize', 7);
a = -1;b = 255;       %图像反色
O = a.*I+b/255;
figure(1);subplot(1, 5, 5);imshow(O);
title('a= -1, b=255，图像反色','fontsize', 7);