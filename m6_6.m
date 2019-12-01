%created by liang
%2019.11.30
%*********
%***

%*///*///
%例6.8 对运动模糊退化且加噪声的图像进行逆滤波和维纳滤波复原

I = imread('H:/coin.jpg');          %读取图像
figure;imshow(I,[]);                %显示原图像
PSF = fspecial('motion',25,11);         %运动模糊函数，运动位移是25像素，角度是11
Blurred = imfilter(I,PSF,'conv','circular');        %对图像运动模糊处理
Noise = 0.1*randn(size(I));                 %正态分布的随机噪声
BlurredNoise = imadd(Blurred,im2uint8(Noise));%对退化后的图像进行附加噪声
figure(2);imshow(BlurredNoise,[]);          %显示运动模糊且加噪声后的图像
WI1 = deconvwnr(BlurredNoise,PSF);          %不带参数的维纳滤波复原
figure(3);imshow(WI1,[]);                   %显示逆滤波的结果
NSR = sum(Noise(:).^2/sum(im2double(I(:)).^2));%计算信噪比
WI2 = deconvwnr(BlurredNoise,PSF,NSR);      %带信噪比参数的维纳滤波
figure(4);imshow(WI2,[]);                   %显示带信噪比参数维纳滤波的结果
NP = abs(ifftn(Noise)).^2;                      
NCORR = real(ifftn(NP));                    %计算噪声的自相关函数
IP = abs(fftn(im2double(I))).^2;
ICORR = real(ifftn(IP));                      %计算信号的自相关函数
WI3 = deconvwnr(BlurredNoise,PSF,NCORR,ICORR);
                                                %带自相关函数的维纳滤波复原
figure(5);imshow(WI3,[]);                                                       