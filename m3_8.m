%created by liang
%2019.11.28
%*********
%***

%*///*///
%ͼ���ƽ��

I = imread('H:/coin.jpg');
subplot(121);
imshow(I);
I = rgb2gray(I);
title('ԭʼͼ��');
[M,N] = size(I);g = zeros(M,N);
a = 20;b = 20;              %aΪˮƽ���ƾ��룬bΪ��ֱ�½�����
for i=1:M
    for j=1:N
        
        if((i-a>0)&(i-a<M)&(j-b>0)&(j-b<N))     %�任���������ӳ��
            g(i,j) = I(i-a,j-b);
        else
            g(i,j) = 0;         %��ͼ������������0
        end
    end
end
subplot(122);imshow(uint8(g));
title('ƽ�ƺ��ͼ��');
