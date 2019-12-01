%created by liang
%2019.11.29
%*********
%***

%*///*///
%例6.2采用各种均值滤波器对附加高斯噪声的图像进行滤波
img = imread('H:/coin.jpg');imshow(img);        %显示图像
img_noise = double(imnoise(img,'gaussian',0.06));    %对图像附加高斯噪声
figure,imshow(img_noise,[]);                    %显示附加了噪声的图像
img_mean = imfilter(img_noise,fspecial('average',3));
                                                %对附加了高斯噪声的图像实行算术均值滤波
figure,imshow(img_mean,[]);                     %显示算术均值滤波后的图像
img_mean = exp(imfilter(log(img_noise),fspecial('average',3)));
                                                %对附加有高斯噪声的图像实行几何均值滤波
figure;imshow(img_mean,[]);                     %显示几何均值滤波之后的图像
Q = 1.5;                                        %对高斯噪声图像实行Q取负数的你谐波滤波
img_mean = imfilter(img_noise.^(Q+1),fspecial('average',3))./imfilter(img_noise.^Q,fspecial('average',3));
figure;imshow(img_mean,[]);                     %显示你谐波滤波后的图像
Q = 1.5;                                        %对高斯噪声图像实行Q取正数的逆谐波滤波
img_mean = imfilter(img_noise.^(Q+1),fspecial('average',3))./imfilter(img_noise.^Q,fspecial('average',3));
figure;imshow(img_mean,[]);                     %显示逆谐波滤波后的图像