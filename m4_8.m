%created by liang
%2019.11.29
%*********
%***

%*///*///
%��ά�����������任��Matlab��ʵ��
I = imread('H:/coin.jpg');
figure(1),subplot(131);imshow(I);
J = dct2(I);
figure(1);subplot(132);imshow(log(abs(J)),[]);      %���ұ任
K = idct(J)/255;        %���ҷ��任
figure(1),subplot(133);imshow(K);

