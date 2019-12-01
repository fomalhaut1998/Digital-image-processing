%created by liang
%2019.11.29
%*********
%***

%*///*///
%对幅值和相位分别进行图像重构

I = imread('H:/coin.jpg');
figure(1);imshow(real(I));
I = I(:,:,3);fftI = fft2(I);
sfftI = fftshift(fftI);
RRfdp1 = real(sfftI);
IIfdp1 = imag(sfftI);
a = sqrt(RRfdp1.^2+IIfdp1.^2);
a = (a-min(min(a)))/max(max(a))-min(min(a))*255;
figure(2);imshow(real(a));
b = angle(fftI);figure(3);imshow(real(b));
theta = 30;RR1 = a*cos(theta);II1 = a*sin(theta);
fftI1 = RR1+i.*II1;C = ifft2(fft1)*255;
figure(4);imshow(real(C));
MM = 150;RR2 = MM*cos(angle(fftI));
II2 = MM*sin(angle(fft1));
fftI2 = RR2+i.*II2;
D = ifft2(fftI2);
figure(5);
imshow(real(D));


