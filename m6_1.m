%created by liang
%2019.11.29
%*********
%***

%*///*///
%��6.1����ͼ������ǵ�ֱ��ͼ
A = imread('H:/coin.jpg');          %��ȡͼ��
figure,imshow(A);                   %��ʾͼ��
figure,hist(double(A),10);          %���A��ֱ��ͼ����ʾ
B = imnoise(A,'gaussian',0.05);     %��A���Ӹ�˹����
figure,imshow(B);                   %��ʾ���Ӹ�˹�������ͼ��B
figure,hist(double(B),10);          %���B��ֱ��ͼ����ʾ
C = imnoise(A,'speckle',0.05);      %��A���Ӿ��ȷֲ�����
figure,imshow(C);                   %��ʾ���ӷֲ������������ͼ��C
figure,hist(double(C),10);          %���C��ֱ��ͼ����ʾ
D = imnoise(A,'salt & pepper',0.05);%��A���ӽ�������
figure,imshow(D);                   %��ʾ���Ӽ����������ͼ��D
figure,hist(double(D),10);          %���D��ֱ��ͼ����ʾ
