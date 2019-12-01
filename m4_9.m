%created by liang
%2019.11.29
%*********
%***

%*///*///
%用DCT变换进行图像压缩
I = imread('H:/coin.jpg');
[M,N] = size(I);        %M=512，N=512
figure(1);subplot(121);
imshow(I);title('原始图像');
I = im2double(I);

%生成标准DCT变化中的矩阵(8x8)
n = 8;
[cc,rr] = meshgrid(0:n-1);
C = sqrt(2/n)*cos(pi*(2*cc+1).*rr/(2*n));
C(1,:) = C(1,:)/sqrt(2);
%光亮度量化表
a = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

%分块做DCT变换(8x8),DCT变换公式：正变换：Y = CTC';

for i=1:8:M
    for j=1:8:M
        P = I(i:i+7,j:j+7);
        K = C*P*C';
        I1(i:i+7,j:j+7) = K;
        K = K./a;%量化
        K(abs(K)<0.03) = 0;
        I2(i:i+7,j:j+7) = K;
    end
end
figure(1);subplot(122);imshow(I1);title('DCT变换后的频域图像');
figure(2);subplot(121);imshow(I2);title('量化后的频域图像');

%分块做DCT反变换(8x8),逆变换：P = C'YC;
for i = 1:8:M
    for j = i:8:N
        P = I2(i:i+7,j:j+7).*a;     %反量化
        K = C'*P*C;
        I3(i:i+7,j:j+7) = K;
    end
end
figure(2);subplot(122);imshow(I3);title('复原图像');

