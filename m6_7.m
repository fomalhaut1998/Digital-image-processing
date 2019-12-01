%created by liang
%2019.11.30
%*********
%***

%*///*///
%例6.9 图像的仿射变换

f = imread('H:/coin.jpg');              %读取图像
figure(1);imshow(f);                    %显示原图像
k = 0.7;                                %变换拉伸系数
theta = pi/6;                           %变换旋转角度
T = [k*cos(theta) k*sin(theta) 0
    -k*sin(theta) k*cos(theta) 0
    0 0 1];                             %变换矩阵
tform1 = maketform('affine',T);         %几何变换结构
g1 = imtransform(f,tform1,'nearest');       %以近邻插值进行仿射变换
figure(2);imshow(g1);                   %显示变换结果
g2 = imtransform(f,tform1,'bilinear');      %以双线性插值进行仿射变换
figure(3),imshow(g2);                   %显示变换结果
