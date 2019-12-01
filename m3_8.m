%created by liang
%2019.11.28
%*********
%***

%*///*///
%图像的平移

I = imread('H:/coin.jpg');
subplot(121);
imshow(I);
I = rgb2gray(I);
title('原始图像');
[M,N] = size(I);g = zeros(M,N);
a = 20;b = 20;              %a为水平右移距离，b为垂直下降距离
for i=1:M
    for j=1:N
        
        if((i-a>0)&(i-a<M)&(j-b>0)&(j-b<N))     %变换到新坐标的映射
            g(i,j) = I(i-a,j-b);
        else
            g(i,j) = 0;         %新图像外的坐标点置0
        end
    end
end
subplot(122);imshow(uint8(g));
title('平移后的图像');
