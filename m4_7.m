%created by liang
%2019.11.29
%*********
%***

%*///*///
%���ֵ����λ�ף�����������ͼ���ع�

load lena.mat;load boy.mat;         %��ȡͼƬ���ֱ��ڱ���I1��J1��
% ����Ҷ�任
If = fft2(I1);Jf = fft(J1);
% �ֱ�������׺���λ��
FAi = abs(If); FPi = angle(If);
FAj = abs(Jf); FPj = angle(Jf);
% ������λ�ײ��ؽ���������
IR = FAi.*cos(FPj)+FAi.*sin(FPj).*i;
JR = FAj.*cos(FPi)+FAj.*sin(FPi).*i;
% ����Ҷ���任
IR1 = abs(ifft2(IR));JR1 = abs(ifft2(JR));
% ��ʾͼ��
subplot(221);imshow(I1);
title('�к���ͼ��');
subplot(222);
imshow(J1);title('��Ůԭͼ��');
subplot(223);imshow(IR1,[]);
title('�к���Ƶ�׺���Ů��Ƶ������');
subplot(224);imshow(JR1,[]);
title('��Ů�ķ�ֵ���к�����λ�����');
