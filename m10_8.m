%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.10 �������ַ�������ͼʾ���������
%����1���ݶ�ֵͼ���������������ĵĶ���ʽ
%����2������MATLAB���õ�regionprops����
I = imread('H:/coin.jpg');                      %��ȡͼ��
BW = im2bw(I);                                  %��ֵ��
[m,n] = size(BW);                               %�õ�ͼ��ĸ߶ȺͿ��
A1 = 0;                                         %���õ�1�ַ��������������ʼ��
for i=1:m*n
    if(BW(i)==1)
        A1 = A1+1;                              %��1�ַ����������
    end
end
A1                                              %��ʾ������
x1 = 0;y1 = 0;                                  %���õ�1�ַ��������������ʼ��
for i = 1:m
    for j=1:n
        if(BW(i,j)==1)
            x1=x1+i;
            y1=y1+j;                            %��1�ַ���������������
        end
    end
end
x1 = x1/A1;                                     %�õ���������
y1 = y1/A1;                                     
BL = bwlabel(BW,4);                             %��2�ַ������㣬�õ�4-������
A2 = regionprops(BL,'Area');                    %��MATLAB�����õ����
P2 = regionprops(BL,'Centroid');                %��MATLAB�����õ���������