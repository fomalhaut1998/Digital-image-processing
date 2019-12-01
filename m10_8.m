%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.10 采用两种方法计算图示面积和重心
%方法1根据二值图像区域的面积和中心的定义式
%方法2是利用MATLAB内置的regionprops函数
I = imread('H:/coin.jpg');                      %读取图像
BW = im2bw(I);                                  %二值化
[m,n] = size(BW);                               %得到图像的高度和宽度
A1 = 0;                                         %采用第1种方法，面积变量初始化
for i=1:m*n
    if(BW(i)==1)
        A1 = A1+1;                              %第1种方法计算面积
    end
end
A1                                              %显示面积结果
x1 = 0;y1 = 0;                                  %采用第1种方法，重心坐标初始化
for i = 1:m
    for j=1:n
        if(BW(i,j)==1)
            x1=x1+i;
            y1=y1+j;                            %第1种方法计算重心坐标
        end
    end
end
x1 = x1/A1;                                     %得到重心坐标
y1 = y1/A1;                                     
BL = bwlabel(BW,4);                             %第2种方法计算，得到4-邻域标记
A2 = regionprops(BL,'Area');                    %由MATLAB函数得到面积
P2 = regionprops(BL,'Centroid');                %由MATLAB函数得到重心坐标