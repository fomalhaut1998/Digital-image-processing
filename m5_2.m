%created by liang
%2019.11.29
%*********
%***

%*///*///
%ͼ���ֱ��ͼ
I = imread('H:/coin.jpg');
I = double(I);
for i=1:256
    h(i) = sum(sum(I==i-1));
end
subplot(121);imshow(I);title('ԭʼͼ��');
subplot(122);plot(h);title('ͼ���ֱ��ͼ');