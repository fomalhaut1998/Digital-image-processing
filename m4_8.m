%created by liang
%2019.11.29
%*********
%***

%*///*///
%二维余弦在正反变换在Matlab中实现
I = imread('H:/coin.jpg');
figure(1),subplot(131);imshow(I);
J = dct2(I);
figure(1);subplot(132);imshow(log(abs(J)),[]);      %余弦变换
K = idct(J)/255;        %余弦反变换
figure(1),subplot(133);imshow(K);

