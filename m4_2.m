%created by liang
%2019.11.29
%*********
%***

%*///*///
%�����ߴ�չ��

I = zeros(256,256);I(8:248,1110:136) = 255;
figure(1);imshow(I);
%ԭʼͼ��ĸ���ҶƵ��
J3 = fft2(I);F2 = abs(J3);J4 = fftshift(F2);
figure(2);imshow(J4,[5 30]);

%���Ա����߶�
a = 0.1;
for i=1:256
    for j=1:256
        I(i,j) = I(i,j)*a;
    end
end
%�����߶�չ���ĸ���ҶƵ��
J2 = fft2(I);F1 = abs(J2);J3 = fftshift(F1);
figure(3);imshow(J3,[5 30]);
