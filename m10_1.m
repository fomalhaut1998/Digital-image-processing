%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.1 将图像分块，计算左上角的灰度均值，并计算整张图片的灰度最大值和最小值
I = imread('H:/coin.jpg');                  %读取图像
I = double(I);                              %转换成double类型
[m,n] = size(I);                            %获取图像的宽和高
mw = round(m/2);                            %得到高度的一半mw
mh = round(n/2);                            %得到宽度的一半mh
sumg = 0;                                   %变量初始化
for i=1:mw
    for j=1:mh
        sumg = sumg+I(i,j);
    end
end
avg = sumg/(mw*mh);                         %计算图像左上角灰度值的均值
maxg = max(max(I));                         %计算得到图像灰度值的最大值
ming = min(min(I));                         %计算得到图像灰度值的最小值

avg,maxg,ming