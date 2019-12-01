%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.4计算纹理图的灰度值分统计特征

I = imread('H:/coin.jpg');              %读取图像
A = double(I);                          %转换成double类型
[m,n] = size(A);                        %获取图像的宽和高
B = A;
C = zeros(m,n);
for i=1:m-1
    for j=1:n-1
        B(i,j) = A(i+1,j+1);
        C(i,j) = abs(round(A(i,j)-B(i,j)));%计算灰度差分图像
    end
end
H = imhist(mat2gray(C))/(m*n);              %计算灰度差图像直方图
MEAN = 0;                                   %设置变量初值
CON = 0;                                    %设置变量初值
ASM = 0;                                    %设置变量初值
ENT = 0;                                    %设置变量初值
for i=1:256
    MEAN = MEAN+(i*h(i))/256;               %计算平均值
    CON = CON+i*i*h(i);                     %计算对比度
    ASM = ASM+h(i)*h(i);                    %计算角度方向二阶矩
    if(h(i)>0)
        ENT = ENT-h(i)*log2(h(i));          %计算熵
    end
end
MEAN,CON,ASM,ENT                            %显示计算结果