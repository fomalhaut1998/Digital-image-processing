%created by liang
%2019.11.29
%*********
%***

%*///*///
%��5-3  �ԻҶ�ͼ����о��⻯���Ҷȵȼ�8��
I = imread('H:/coin.jpg');
I = rgb2gray(I);
K = 16;H = histeq(I,K);
figure;subplot(221);imshow(I,[]);
subplot(222);imshow(H,[]),hold on;
subplot(223),hist(double(I),16),subplot(224),hist(double(H),16);
