%created by liang
%2019.11.29
%*********
%***

%*///*///
%*exp(-1),将图像整体变暗，并求其频谱图

I = imread('H:/coins.jpg');
figure(1);imshow(I);
P = I*exp(-1);
figure(2);imshow(P);
P1 = fftshift(fft2(P));
figure(3);
imshow(log(abs(P1)),[8,10]);

