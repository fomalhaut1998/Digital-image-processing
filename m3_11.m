%created by liang
%2019.11.29
%*********
%***

%*///*///
%采用三种不同的插值法进行图像的比较放大
I = imread('H:/coin.jpg');
J1 = imresize(I,10,'nearest');      %采用最近邻插值法进行放大10倍
J2 = imresize(I,10,'bilinear');     %采用双线性插值法进行放大10倍
J3 = imresize(I,10,'bicubic');      %采用三次内插值法进行放大10倍
figure;
imshow(I);
title('原始图像');
figure;
imshow(J1);
title('最近邻法');
figure;
imshow(J2);
title('双线性插值法');
figure;
imshow(J3);
title('三次内插值法');