%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9.2 将一幅彩色图像从RGB空间转换成HSI空间
rgb = imread('H:/coin.jpg');        %读入RGB彩色图像
rgb = im2double(rgb);                %为了方便计算，将其转换为double类型
r = rgb(:,:,1);                     %得到图像的R分量
g = rgb(:,:,2);                     %得到图像的G分量
b = rgb(:,:,3);                     %得到图像的B分量
I = (r+g+b)/3;                      %计算得到I的分量
tmp1 = min(min(r,g),b);             %计算R、G、B的最小值
tmp2 = r+g+b;
tmp2(tmp2==0) = eps;             %避免除数为0
S = 1-3.*tmp1./tmp2;                %计算得到S分量
tmp1 = 0.5*((r-g)+(r-b));
tmp2 = sqrt((r-g).^2+(r-b).*(g-b));
theta = acos(tmp1./(tmp2+eps));     %计算得到θ
H = theta;
H(b>g) = 2*pi - H(b>g);             %计算得到H分量
H = H/(2*pi);                       
H(S==0) = 0;                        %当S为0时H也取0
hsi = cat(3,H,S,I);                 %将三个分量混合得到HSI图像
figure,imshow(rgb);                 %显示rgb
figure,imshow(H);                   %显示H
figure,imshow(S);                   %显示S
figure,imshow(I);                   %显示I