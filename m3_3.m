%created by liang
%2019.11.28
%*********
%***
%ͼ����ϸ�˹����֮��ȥ��

I = imread('H:/coin.jpg')       %��ȡһ��ͼ��
J = imnoise(I,'gaussian',0,0.02);       %�����˹����
subplot(1,2,1),imshow(I);       %��ʾͼ��
subplot(1,2,2),imshow(J); 

K = zeros(518,700);
    for i = 1:100
        J = imnoise(I,'gaussian',0,0.02);
        J1 = im2double(J);
        K = K+J1;
    end
K = K/100;
figure;imshow(K);