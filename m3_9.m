%created by liang
%2019.11.28
%*********
%***

%*///*///
%ˮƽ����

I = imread('H:/coin.jpg');
I = rgb2gray(I);            %ת��Ϊ�Ҷ�ͼ
subplot(121);
imshow(I);
title('ԭʼͼ��');
[M,N] = size(I);
g = zeros(M,N);
for i=i:M
    for j=i:N
        g(i,j) = I(i,N-j+1);
    end
end
subplot(122);
imshow(uint8(g));
title('ˮƽ����');

