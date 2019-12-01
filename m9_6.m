%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9.7 在HSI彩色空间的直方图均匀化

rgb = imread('H:/coin.jpg');rgb1 = im2double(rgb );
r = rgb1(:,:,1);g = rgb1(:,:,2);b = rgb1(:,:,3);
                                        %分别得到RGB三个分量
I1 = (r+g+b)/3;                         %计算HSI模型的I分量
tmp1 = min(min(r,g),b);                 %计算R、G、B中的最小值
tmp2 = r+g+b;
tmp2(tmp2==0) = eps;                        %避免除数为0
S = 1-3.*tmp1./tmp2;                      %计算HSI模型中S分量
tmp1 = 0.5*((r-g)+(r-b));
tmp2 = sqrt((r-g).^2+(r-b).*(g-b));
theta = acos(tmp1./(tmp2+eps));             %计算θ
H1 = theta;
H1(b>g) = 2*pi-H1(b>g);
H1 = H1/(2*pi);                         %计算HSI模型中的H分量
H1(S==0) = 0;
I = histeq(I1);                         %对HSI模型的I分布进行均衡化
hsi = cat(3,H1,S,I);                    %得到I均衡后的HSI图像
H = hsi(:,:,1)*2*pi;                    %得到处理后HSI图像的H分量
S = hsi(:,:,2);                         %得到处理后HSI图像的S分量
I = hsi(:,:,3);                         %得到处理后HSI图像的I分量
R = zeros(size(hsi,1),size(hsi,2));     %HSI转换到RGB的R分量初值
G = zeros(size(hsi,1),size(hsi,2));     %HSI转换到RGB的G分量初值
B = zeros(size(hsi,1),size(hsi,2));     %HSI转换到RGB的B分量初值
ind = find((H>0) & (H<2*pi/3));         %当H在[0,2π/3]之间
B(ind) = I(ind).*(1.0-S(ind));          %计算B分量
R(ind) = I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind))); %计算R分量
G(ind) = 3.0-(R(ind)+B(ind));           %计算G分量
ind = find((H>2*pi/3) & (H<4*pi/3));    %当h在[2π/3,4π/3]之间
H(ind) = H(ind)-pi*2/3;
R(ind) = I(ind).*(1.0-S(ind));           %计算R分量
G(ind) = I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind))); %计算G分量
B(ind) = 3.0-(R(ind)+G(ind));           %计算B分量
ind = find((H>=4*pi/3) & (H<2*pi));    %当h在[4π/3,2π]之间
H(ind) = H(ind)-pi*4/3;
G(ind) = I(ind).*(1.0-S(ind));           %计算G分量
B(ind) = I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind))); %计算B分量
R(ind) = 3.0-(G(ind)+B(ind));           %计算R分量
RGB = cat(3,R,G,B);                     %得到用于显示的RGB图像
figure,imshow(H1);                      %显示H分量图像
figure,imshow(I1);                      %显示I分量图像
figure,imshow(I);                      %显示Ii分量均衡化后的图像
figure,imshow(S);                      %显示S分量图像
figure,imshow(rgb);                      %显示RGB图像
figure,imshow(RGB);                      %显示均衡化后的RGB图像
