%created by liang
%2019.11.28
%*********
%***

%*///*///
%水平镜像

I = imread('H:/coin.jpg');
I = rgb2gray(I);            %转换为灰度图
subplot(121);
imshow(I);
title('原始图像');
[M,N] = size(I);
g = zeros(M,N);
for i=i:M
    for j=i:N
        g(i,j) = I(i,N-j+1);
    end
end
subplot(122);
imshow(uint8(g));
title('水平镜像');

