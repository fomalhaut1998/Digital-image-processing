%created by liang
%2019.11.28
%*********
%***
%ͼ��ķ����Ե�����

I = imread('H:/coin.jpg');
subplot(1,4,1);
imshow(I);title('ԭͼ��','fontsize', 9);
subplot(1,4,2);
imshow(imadjust(I,[],[],0.5));title('Gamma=0.5');
subplot(1,4,3);
imshow(imadjust(I,[],[],1));title('Gamma=1');
subplot(1,4,4);
imshow(imadjust(I,[],[],1.5));title('Gamma=1.5');