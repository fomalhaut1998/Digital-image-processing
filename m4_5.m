%created by liang
%2019.11.29
%*********
%***

%*///*///
%�����˹��������һ����������ͼ���������Ƶ�������Ƶ��ͼ
I = imread('H:coin.jpg');
I = imnoise(I, 'gaussian',0,0.01);
figure;imshow(I);
P = fftshift(fft2(2));
figure;imshow(log(abs(P)),[0,80]);
