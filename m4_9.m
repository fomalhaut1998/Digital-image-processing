%created by liang
%2019.11.29
%*********
%***

%*///*///
%��DCT�任����ͼ��ѹ��
I = imread('H:/coin.jpg');
[M,N] = size(I);        %M=512��N=512
figure(1);subplot(121);
imshow(I);title('ԭʼͼ��');
I = im2double(I);

%���ɱ�׼DCT�仯�еľ���(8x8)
n = 8;
[cc,rr] = meshgrid(0:n-1);
C = sqrt(2/n)*cos(pi*(2*cc+1).*rr/(2*n));
C(1,:) = C(1,:)/sqrt(2);
%������������
a = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

%�ֿ���DCT�任(8x8),DCT�任��ʽ�����任��Y = CTC';

for i=1:8:M
    for j=1:8:M
        P = I(i:i+7,j:j+7);
        K = C*P*C';
        I1(i:i+7,j:j+7) = K;
        K = K./a;%����
        K(abs(K)<0.03) = 0;
        I2(i:i+7,j:j+7) = K;
    end
end
figure(1);subplot(122);imshow(I1);title('DCT�任���Ƶ��ͼ��');
figure(2);subplot(121);imshow(I2);title('�������Ƶ��ͼ��');

%�ֿ���DCT���任(8x8),��任��P = C'YC;
for i = 1:8:M
    for j = i:8:N
        P = I2(i:i+7,j:j+7).*a;     %������
        K = C'*P*C;
        I3(i:i+7,j:j+7) = K;
    end
end
figure(2);subplot(122);imshow(I3);title('��ԭͼ��');

