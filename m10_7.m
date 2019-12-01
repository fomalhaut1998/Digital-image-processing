%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.8 给出纹理图像，用MATLAB编程计算图像纹理的频谱特征

I1 = imread('H:/coin.jpg');                 %读取一副图像
s = fftshift(fft2(I1));                     %进行傅里叶变换，将原点移至矩形中心
s = abs(s);                                 %得到幅值
[nc,nr] = size(s);                          %得到图像的高宽
x0 = floor(nc/2+1);                         %得到矩形中心的x坐标
y0 = floor(nc/2+1);                         %得到矩形中心的y坐标
figure,imshow(I);                           %显示原图像
figure,imshow(mat2gray(log(1+s)));          %显示图像的频谱幅值
rmax = floor(min(nc,nr)/2-1);               %得到srad的最大值rmax
srad = zeros(1,rmax);                       %初始化srad
srad(1) = s(x0,y0);                         %中心点的幅值
thetha = 91:270;                            %取一个角度范围，半圆
for r = 2:rmax
    [x,y] = pol2cart(thetha,r);             %得到极坐标
    x = round(x)'+x0;
    y = round(y);+y0;
    for j=1:length(x)                       %求和得到S(r)
        srad(r) = sum(s(sub2ind(size(s),x,y)));
    end
end
figure,plot(srad);                          %画出频谱能量图Sθ(r)
[x,y] = pol2cart(thetha,rmax);              %在r取rmax时得到极坐标
x = round(x)'+x0;
y = round(y)'+y0;
sang = zeros(1,length(x));                  %初始化sang
for th=1:length(x)
    vx = abs(x(th)-x0);
    vy = abs(y(th)-y0);
    if((vx==0) & (vy==0))
        xr = x0;yr = y0;
    else
        m = (y(th)-y0)/(x(th)-x0);
        xr = (x0:x(th)).';
        yr = round(y0+m*(xr-x0));
    end
    for j=1:length(xr)                      %计算得到S(θ)
        sang(th) = sum(s(sub2ind(size(s),xr,yr)));
    end
end
figure,plot(sang);                          %画出频谱能量图Sr(θ)
