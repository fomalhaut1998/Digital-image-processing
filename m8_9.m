%created by liang
%2019.12.1
%*********
%***

%*///*///
%��8.11 ��̬ѧ�������
i = imread('H:/coin.jpg');                  %��ȡԭͼ��
BW1 = im2bw(I);                             %��ֵ��
figure,imshow(BW1);                         %��ʾ��ֵͼ��
BW2 = bwfill(BW1,'holes');                  %�����������
figure,imshow(BW2);                         %��ʾ����Ľ��
