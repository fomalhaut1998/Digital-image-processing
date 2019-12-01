%created by liang
%2019.11.29
%*********
%***

%*///*///
%图像的直方图
I = imread('H:/coin.jpg');
I = double(I);
for i=1:256
    h(i) = sum(sum(I==i-1));
end
subplot(121);imshow(I);title('原始图像');
subplot(122);plot(h);title('图像的直方图');