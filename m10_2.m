%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.2 ����10.1ֱ��ͼ���������

I = imread('H:/coin.jpg');                  %��ȡͼ��
[m,n] = size(I);                            %��ȡͼ��Ŀ�͸�
h = imhist(I)/(m*n);                        %����ͼ���ֱ��ͼ
avh = 0;enh = 0;enth = 0;                   %������ʼ��
for k=1:256
    avh = avh+k*h(k);                       %�����ֵ
    enh = enh+h(k)*h(k);                    %��������
    if(h(k)~=0)
        enth = enth-h(k)*log2(h(k));        %������
    end
end
avh,enh,enth;                               %��ʾ��ֵ����������
vah = 0;
for k=1:256
    vah = vah+(k-avh)*(k-avh)*h(k);         %���㷽��
end
vah                                         %��ʾ����ֵ
