%created by liang
%2019.11.30
%*********
%***

%*///*///
%��7.1��ͼ�����
I = imread('H:/coin.jpg');              %��ȡͼ��
x = double(I);                          %ת��Ϊdouble��
n = 256;                            %�Ҷȼ�����
xh = hist(x(:),n);                  %�����ͼ���ֱ��ͼ
xh = xh/sum(xh(:));                     %���ÿ���Ҷȼ����ֵ�Ƶ��
i= find(xh);                            %ֱ��ͼ��Ӧ�ĻҶȼ�
h = -sum(xh(i).*log2(xh(i)))            %���ͼ�����
