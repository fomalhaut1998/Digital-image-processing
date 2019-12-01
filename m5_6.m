%created by liang
%2019.11.29
%*********
%***

%*///*///
%例5,7采用Butterworth低通滤波器对Lena图像进行滤波。

I = imread('H:/coin.jpg');
figure,imshow(I);
I1 = fftshift(fft2(I));
[M,N] = size(I1);
n = 2;d0 = 30;
n1 = floor(M/2);n2 = floor(N/2);
for i=1:M
    for j=1:N
        d = sqrt((i-n1)^2+(j-n2)^2);
        H = 1/(1+(d/d0)^(2*n));
        I2(i,j) = H*I1(i,j);
    end
end
I2 = ifftshift(I2);
I3 = real(ifft2(I2));
figure;imshow(I3,[]);
