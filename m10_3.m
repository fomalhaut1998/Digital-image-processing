%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.3 ����غ�����MATLABʵ��
%��ԭͼ��ΪI,ƫ����Ϊshiftx��shifty
I = 'H:/coin.jpg'
function autocorcoeficient(I,shiftx,shifty)
A = imread(I);                      %��ȡͼ��
[M,N] = size(A);                            %��ȡͼ��Ŀ�͸�
B = zeros(M+abs(shiftx),N+abs(shifty));     %����һ��ƫ�ƾ������ڼ���
A = double(A);                              %ת����double��
B = double(B);                              %ת����double��
if((shiftx>0) & (shifty>0))
    B(1:M,1:N) = A;
end
if((shiftx>0) & (shifty<0))                      %ƫ�ƴ���������Χ����Ϊ0
    B(1:M,abs(shifty)+1:abs(shifty)+N) = A;
end
if((shiftx<0) & (shifty>0))                      %ƫ�ƴ���������Χ����Ϊ0
    B(abs(shiftx)+1:abs(shiftx)+M,1:N) = A;
end
if((shiftx<0) & (shifty<0))                      %ƫ�ƴ���������Χ����Ϊ0
    B(abs(shiftx)+1:abs(shiftx)+M,abs(shifty)+1:abs(shifty)+N) = A;
end
sum1 = 0;                                       %���÷��ӱ�����ֵ
sum2 = 0;                                       %���÷�ĸ������ֵ
for i=1:M
    for j=1:N
        sum1 = sum1+A(i,j)*B(i,j);              %����ѭ���ۼӵõ�����
        sum2 = sum2+A(i,j)*A(i,j);              %����ѭ���ۼӵõ���ĸ
    end
end
c = sum1/sum2;                                  %�õ�����غ���
end

