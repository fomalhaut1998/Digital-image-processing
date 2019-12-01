%created by liang
%2019.11.29
%*********
%***

%*///*///
%例5.9采用同态滤波方法，对图像进行滤波处理
[image_0,map] = imread('H:/coin.jpg');
image_1 = log(double(image_0)+1);
image_2= fft2(image_1);
n = 2;c = 2;D0 = 50;rh = 2;rl = 0.5;
[row,col] = size(image_2);
for k=1:1:row
    for l1 = 1:1:col
        D1(k,l1) = sqrt(k^2+l1^2);
        H(k,l1) = rl+(rh-rl)*(1/(1+(D0/(c*D1(k,l1)))^(2*n)));
        image_2(k,l1) = image_2(k,l1)*H(k,l1);
    end
end
image_4 = ifft2(image_2);
iamge_5 = (exp(image_4)-1);
figure,imshow(image_0,map);
figure,imshow(real(iamge_5),map);

