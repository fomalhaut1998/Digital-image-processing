%created by liang
%2019.11.30
%*********
%***

%*///*///
%��7.2 ѹ���ȵļ���
fi = imread('H:/tes.bmp');             %��ȡԭͼ����ѹ��BMPͼ��
imwrite(fi,'H:/tes.jpg');               %��jpeg��ʽѹ��
infol = dir('H:/tes.bmp');              
b1 = infol.bytes;                       %�õ�ԭͼ����ֽ���
info2 = dir('H:/tes.jpg');              
b2 = info2.bytes;                       %�õ�ѹ��ͼ����ֽ���
ratio = b1/b2;                              %����ѹ����
figure;imshow('H:/tes.bmp');            %��ʾԭͼ��
figure;imshow('H:/tes.jpg');                %��ʾѹ��ͼ��
