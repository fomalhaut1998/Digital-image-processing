%created by liang
%2019.11.29
%*********
%***

%*///*///
%��ά��ɢ����Ҷ�任����ת��

%����ԭʼͼ��
I = zeros(256,256);
I(28:228,108:148) = 1;
subplot(141);imshow(I);
%��ԭʼͼ��ĸ���ҶƵ��
J = fft2(I);F = abs(J);
J1 = fftshift(F);
subplot(142);imshow(J1,[5 50]);
%��ԭʼͼ�������ת
J = imrotate(I,315,'bilinear','crop');
subplot(143);imshow(J);
%����ת���ͼ��ĸ���ҶƵ��
J1 = fft2(J);F = abs(J1);J2 = fftshift(F);
subplot(144);imshow(J2,[5 50]);