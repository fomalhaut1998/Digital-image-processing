%created by liang
%2019.11.28
%*********
%***
%��ȡ��������

I = imread('H:/coin.jpg');
J = imread('H:/coin.jpg');
K = imsubtract(I, J);           %ʵ������ͼ�����
K1 = 255-K;                       %��ͼƬ����ʾ
figure;imshow(I);title('��������ͼ');
figure;imshow(J);title('ԭʼͼ��');
figure;imshow(K);title('��ȡ������');
