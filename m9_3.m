%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9.3 �Ҷ�ͼ��ǿ�ȷֲ�

I = imread('H:/coin.jpg');              
GS8 = grayslice(I,8);
GS64 = grayslice(I,64);
subplot(131),imshow(I),title('ԭʼ�ĻҶ�ͼ');
subplot(132),subimage(GS8,hot(8)),title('�ֳ�8��α��ɫ');
subplot(133),subimage(GS64,hot(64)),title('�ֳ�64��α��ɫ');
