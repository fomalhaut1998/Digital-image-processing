%created by liang
%2019.11.30
%*********
%***

%*///*///
%��6.7�˶�ģ���˻�
I = imread('H:/coin.jpg');          %��ȡͼ��
I = rgb2gray(I);                    %ת��Ϊ�Ҷ�ͼ
figure;imshow(I);                   %��ʾͼ��
LEN = 25;                           %���������˶�λ��
THETA = 11;                         %������ת�Ƕ�
PSF = fspecial('motion',LEN,THETA); %ͼ�������˶�
Blurred = imfilter(I,PSF,'circular','conv');%ͼ�������˶�ģ��
figure;imshow(Blurred);             %��ʾ�˶�ģ�����ͼ��