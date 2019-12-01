%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.2 计算10.1直方图的相关特征

I = imread('H:/coin.jpg');                  %读取图像
[m,n] = size(I);                            %获取图像的宽和高
h = imhist(I)/(m*n);                        %计算图像的直方图
avh = 0;enh = 0;enth = 0;                   %变量初始化
for k=1:256
    avh = avh+k*h(k);                       %计算均值
    enh = enh+h(k)*h(k);                    %计算能量
    if(h(k)~=0)
        enth = enth-h(k)*log2(h(k));        %计算熵
    end
end
avh,enh,enth;                               %显示均值，能量，熵
vah = 0;
for k=1:256
    vah = vah+(k-avh)*(k-avh)*h(k);         %计算方差
end
vah                                         %显示方差值
