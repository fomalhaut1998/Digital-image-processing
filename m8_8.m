%created by liang
%2019.12.1
%*********
%***

%*///*///
%��8.10 �߽�������ȡ
I = imread('H:/coin.jpg');              %��ȡͼ��
I = im2bw(I);                           %ͼ���ֵ��
figure,imshow(I);                       %��ʾԭͼ
se = strel('square',3);                 %ѡȡ3x3�����νṹԪ��
Ie = imerode(I,se);                     %��ͼ����и�ʴ
Iout1 = I-Ie;                           %ԭͼ���ȥ��ʴ���
figure,imshow(Iout1);                   %��ʾ�߽�����
Iout2 = bwperim(I,4);                   %��bwperim��ȡ�߽�
figure,imshow(Iout2);                   %��ʾ�߽���ȡ���