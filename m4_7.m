%created by liang
%2019.11.29
%*********
%***

%*///*///
%求幅值和相位谱，交换并进行图像重构

load lena.mat;load boy.mat;         %读取图片，分别在变量I1和J1中
% 求傅里叶变换
If = fft2(I1);Jf = fft(J1);
% 分别求幅度谱和相位谱
FAi = abs(If); FPi = angle(If);
FAj = abs(Jf); FPj = angle(Jf);
% 交换相位谱并重建复数矩阵
IR = FAi.*cos(FPj)+FAi.*sin(FPj).*i;
JR = FAj.*cos(FPi)+FAj.*sin(FPi).*i;
% 傅里叶反变换
IR1 = abs(ifft2(IR));JR1 = abs(ifft2(JR));
% 显示图像
subplot(221);imshow(I1);
title('男孩的图像');
subplot(222);
imshow(J1);title('美女原图像');
subplot(223);imshow(IR1,[]);
title('男孩的频谱和美女的频谱相结合');
subplot(224);imshow(JR1,[]);
title('美女的幅值和男孩的相位谱组合');
