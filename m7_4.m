%created by liang
%2019.11.30
%*********
%***

%*///*///
%�γ̱������

function[zipped,info] = RLEencode(vector);
[M,N] = size(vector);           %��ȡ�߶ȺͿ��
vector = uint8(vector(:));      %ת��������
L = length(vector);             %�õ�Ԫ�ظ���
c = vector(1);                  %��ȡ��һ������ֵ
e(1,1) = c;                     %�γ̾����һ��Ϊֵ
e(1,2) = 0;                     %�γ̾���ڶ���Ϊ�γ̳���
t1 = 1;                         %�γ̾����±����
for j=1:L%��ͼ������Ԫ��ѭ������
    if (vector(j)==c)%���ֵ����
        e(t1,2) = double(e(t1,2))+1;    %���γ̳��ȼ�1
    else%������ȸı�
        c = vector(j);          %��¼�µ�ֵ
        t1 = t1 + 1;            %�γ̾����±��1
        e(t1,1) = c;            %�γ̾�����һ�е�һ�е�ֵ
        e(ti,2) = 1;            %�γ̾�����һ�е�2�е�ֵ���γ̳��ȣ�
    end
end
zipped = e;                     %�γ̾���
info.rows = m;                  %��¼ԭͼ��ĸ߶�
info.cols = n;                  %��¼ԭͼ��ؿ��
[m.n] = size(e);                %��ȡ�γ̾���ĸ߶ȺͿ��
info.ratio = (info.rows^info.cols)/m*n; %��ʾѹ����