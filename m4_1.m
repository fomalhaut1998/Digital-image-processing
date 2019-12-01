%created by liang
%2019.11.29
%*********
%***

%*///*///
%二维离散傅里叶变换的旋转性

%构造原始图像
I = zeros(256,256);
I(28:228,108:148) = 1;
subplot(141);imshow(I);
%求原始图像的傅里叶频谱
J = fft2(I);F = abs(J);
J1 = fftshift(F);
subplot(142);imshow(J1,[5 50]);
%对原始图像进行旋转
J = imrotate(I,315,'bilinear','crop');
subplot(143);imshow(J);
%求旋转后的图像的傅里叶频谱
J1 = fft2(J);F = abs(J1);J2 = fftshift(F);
subplot(144);imshow(J2,[5 50]);