%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.11 ����ͼ�������������������ͬ�����Բ��ֱ��
I = imread('H:/coin.jpg');              %��ȡͼ��
BW = im2bw(I);                          %ͼ���ֵ��
BL = bwlabel(BW);                       %��ͼ��ĸ������������ͬ�ı��
F = regionprops(BL,'EquivDiameter');     %��ͼ��ĸ��������EquivDiameterֵ
for i=1:10
    F(i);                               %��ʾ10�������EquivDiameterֵ
end
