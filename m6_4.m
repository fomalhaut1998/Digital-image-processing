%created by liang
%2019.11.29
%*********
%***

%*///*///
%例6.5利用带阻滤波器消除周期性噪声
I = imread('H:/coin.jpg');          %读取图像
I = rgb2gray(I);                    %转化成灰度图像
[M,N] = size(I);                    %得到图像的高度和宽度
P = I;
for i=1:M
    for j=1:N
        P(i,j) = P(i,j)+20*sin(20*I)+20*sin(20*j);%添加周期噪声
    end
end
figure;imshow(I);                  %显示原始图像
figure;imshow(P);                  %显示加噪声的图像
IF = fftshift(fft2(I));            %对图像作傅里叶变换，并将原点移动至中心
IFV = log(1+abs(IF));              %原图像的频谱
PF = fftshift(fft2(P));            %对加噪声图像作傅里叶变换，并将原点移动至中心
PFV = log(1+abs(PF));              %加噪声图像的频谱
figure;imshow(IFV,[]);             %显示原图像的频谱
figure;imshow(PFV,[]);             %显示加噪图像的频谱
freq = 50;                         %设置带阻滤波器的中心频率
width = 5;                         %设置带阻滤波器的频带宽度
ff = ones(M,N);                    
for i=1:M
    for j=1:N
        ff(i,j) = 1-exp(-0.5*((((i-M/2)^2+(j-N/2)^2)-freq^2)/(sqrt(i.^2+j.^2)*width))^2);
                                                                    %高通带阻滤波器
    end
end
figure;imshow(ff,[]);                   %显示搞高斯带阻滤波器
out = PF.*ff;                           %矩阵点乘实现频域滤波
out = ifftshift(out);                   %原点移回左上角
out = ifft2(out);                       %傅里叶逆变换
out = abs(out);                         %取绝对值
out = out/max(out(:));                  %归一化
figure;imshow(out,[]);                  %显示滤波结果