%created by liang
%2019.11.28
%*********
%***
%图像的非线性点运算

I = imread('H:/coin.jpg');
subplot(1,4,1);
imshow(I);title('原图像','fontsize', 9);
subplot(1,4,2);
imshow(imadjust(I,[],[],0.5));title('Gamma=0.5');
subplot(1,4,3);
imshow(imadjust(I,[],[],1));title('Gamma=1');
subplot(1,4,4);
imshow(imadjust(I,[],[],1.5));title('Gamma=1.5');