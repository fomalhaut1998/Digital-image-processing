%created by liang
%2019.11.28
%*********
%***
%���Ե�����
I = imread('H:/coin.jpg');      %��ȡһ��ͼ��
I = im2double(I);                %ת��Ϊdouble����
figure(1);subplot(1, 5, 1);
imshow(I);title('ԭͼ��','fontsize',7);    %��ʾԭͼ��
a = 2;b = -50;          %���ӶԱȶ�
O = a.*I + b/255;
figure(1);subplot(1, 5, 2);
imshow(O);title('a=2,���ӶԱȶ�','fontsize',7);
a = 0.5;b = -50;        %���ٶԱȶ�
O = a.*I + b/255;
figure(1);subplot(1, 5, 3);imshow(O);
title('a=0.5, b=-50�����ٶԱȶ�','fontsize', 7);
a = 1;b = 50;       %������������
O = a.*I+b/255;
figure(1);subplot(1, 5, 4);imshow(O);
title('a=0.5, b=50������ƽ����������','fontsize', 7);
a = -1;b = 255;       %ͼ��ɫ
O = a.*I+b/255;
figure(1);subplot(1, 5, 5);imshow(O);
title('a= -1, b=255��ͼ��ɫ','fontsize', 7);