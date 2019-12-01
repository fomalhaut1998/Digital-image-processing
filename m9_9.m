%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9-12 在RGB空间的彩色分割
rgb = imread('H:/coin.jpg');                %读取图像
rgb1 = im2double(rgb);                      %转换成double类型
r = rgb1(:,:,1);                            %图像的红色分量
g = rgb1(:,:,2);                            %图像的绿色分量
b = rgb1(:,:,3);                            %图像的蓝色分量
r1 = r(129:256,86:170);                     %在花的红分量中选择一块矩形区域
r1_u = mean(mean(r1(:)));                   %计算该矩形区域均值
[m,n] = size(r1);                           %得到该矩形区域高宽
sd1 = 0.0;                                  %该区域标准偏差变量
for i=1:m
    for j=1:n                               %二重循环对差值的平均进行累加
        sd1 = sd1+(r1(i,j)-r1_u)*(r1(i,j)-r1_u);
    end
end
r1_d = sqrt(sd1/(m*n));                     %计算得到该区域的标准偏差
r2 = zeros(size(rgb1,1),size(rgb1,2));
ind = find((r>r1_u-1.25*r1_d) & (r<r1_u+1.25*r1_d)); %找到符合条件的点
r2(ind) = 1;                                %将符合条件的点的灰度值赋为1
figure,imshow(r2);                          %显示结果·
