%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.1 ��ͼ��ֿ飬�������ϽǵĻҶȾ�ֵ������������ͼƬ�ĻҶ����ֵ����Сֵ
I = imread('H:/coin.jpg');                  %��ȡͼ��
I = double(I);                              %ת����double����
[m,n] = size(I);                            %��ȡͼ��Ŀ�͸�
mw = round(m/2);                            %�õ��߶ȵ�һ��mw
mh = round(n/2);                            %�õ���ȵ�һ��mh
sumg = 0;                                   %������ʼ��
for i=1:mw
    for j=1:mh
        sumg = sumg+I(i,j);
    end
end
avg = sumg/(mw*mh);                         %����ͼ�����ϽǻҶ�ֵ�ľ�ֵ
maxg = max(max(I));                         %����õ�ͼ��Ҷ�ֵ�����ֵ
ming = min(min(I));                         %����õ�ͼ��Ҷ�ֵ����Сֵ

avg,maxg,ming