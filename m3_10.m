%created by liang
%2019.11.29
%*********
%***

%*///*///
%��һ��ͼ����ת60��

I = imread('H:/coin.jpg');
J = imrotate(I,60,'bilinear');
K = imrotate(I,60,'bilinear','crop');
subplot(131);imshow(I);subplot(132);imshow(J);
subplot(133),imshow(K);