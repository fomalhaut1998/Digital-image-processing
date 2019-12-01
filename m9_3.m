%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9.3 灰度图像强度分层

I = imread('H:/coin.jpg');              
GS8 = grayslice(I,8);
GS64 = grayslice(I,64);
subplot(131),imshow(I),title('原始的灰度图');
subplot(132),subimage(GS8,hot(8)),title('分成8层伪彩色');
subplot(133),subimage(GS64,hot(64)),title('分成64层伪彩色');
