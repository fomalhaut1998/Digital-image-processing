%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.12 对一幅图像进行几何变换，验证其矩的不变性
I = imread('H:/coin.jpg');          %读取图像
I2 = imrotate(I,-30,'bilinear');    %将图像按双线性插值顺时针方向旋转30度
I3 = imresize(I,0.5,'bilinear');    %将图像按双线性插值收缩小一半
A = double(I);                      %转换成double类型
[nc,nr] = size(A);                  %得到图像的宽和高
[x,y] = meshgrid(1:nr,1:nc);        %得到x,y的坐标
x = x(:);
y = y(:);
A = A(:);
m.m00 = sum(A);                     %计算得到m00
if m.m00==0
    m.m00 = eps;                    %分母为0的处理
end
m.m10 = sum(x.*A);                  %计算得到m10
m.m01 = sum(y.*A);                  %计算得到m01
xmean = m.m10/m.m00;                %计算重心x的坐标
ymean = m.m01/m.m00;                %计算重心y的坐标
cm.cm00 = m.m00;
cm.cm02 = (sum((y-ymean).^2.*A))/(m.m00^2);                 %计算n02
cm.cm03 = (sum((y-ymean).^3.*A))/(m.m00^2.5);               %计算n03
cm.cm11 = (sum((x-xmean).*(y-ymean).*A))/(m.m00^2);         %计算n11
cm.cm12 = (sum((x-xmean).*(y-ymean).^2.*A))/(m.m00^2.5);    %计算n12
cm.cm20 = (sum((x-xmean).^2.*A))/(m.m00^2);                 %计算n20
cm.cm21 = (sum((x-xmean).^2.*(y-ymean).*A))/(m.m00^2.5);    %计算n21
cm.cm30 = (sum((x-xmean).^3.*A))/(m.m00^2.5);               %计算n30
im1 = cm.cm20+cm.cm02;                              %计算不变矩φ1
im2 = (cm.cm20-cm.cm02)^2+4*cm.cm11^2;              %计算不变矩φ2
im3 = (cm.cm30-3*cm.cm12)^2+(3*cm.cm21-cm.cm03)^2;   %计算不变矩φ3
im4 = (cm.cm30+cm.cm12)^2+(cm.cm21+cm.cm03)^2;      %计算不变矩φ4
im5 = (cm.cm30-3*cm.cm12)*(cm.cm30+cm.cm12)*((cm.cm30+cm.cm12)^2-...
    3*(cm.cm21+cm.cm03)^2)+(3*cm.cm21-cm.cm03)*(cm.cm21+cm.cm03)*(3*(...
    cm.cm30+cm.cm12)^2-(cm.cm21+cm.cm03)^2);         %计算不变矩φ5
im6 = (cm.cm20-cm.cm02)*((cm.cm30+cm.cm12)^2-(cm.cm21+cm.cm03)^2)...
    +4*cm.cm11*(cm.cm30+cm.cm12)*(cm.cm21+cm.cm03); %计算不变矩φ6
im7 = (3*cm.cm21-cm.cm03)*(cm.cm30+cm.cm12)*((cm.cm30+cm.cm12)^2-...
    3*(cm.cm21+cm.cm03)^2)+(3*cm.cm12-cm.cm30)*(cm.cm21+cm.cm03)*(3*(...
    cm.cm30+cm.cm12)^2-(cm.cm21+cm.cm03)^2);         %计算不变矩φ7