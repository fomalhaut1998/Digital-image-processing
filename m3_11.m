%created by liang
%2019.11.29
%*********
%***

%*///*///
%�������ֲ�ͬ�Ĳ�ֵ������ͼ��ıȽϷŴ�
I = imread('H:/coin.jpg');
J1 = imresize(I,10,'nearest');      %��������ڲ�ֵ�����зŴ�10��
J2 = imresize(I,10,'bilinear');     %����˫���Բ�ֵ�����зŴ�10��
J3 = imresize(I,10,'bicubic');      %���������ڲ�ֵ�����зŴ�10��
figure;
imshow(I);
title('ԭʼͼ��');
figure;
imshow(J1);
title('����ڷ�');
figure;
imshow(J2);
title('˫���Բ�ֵ��');
figure;
imshow(J3);
title('�����ڲ�ֵ��');