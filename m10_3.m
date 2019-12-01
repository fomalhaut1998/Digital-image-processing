%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.3 自相关函数的MATLAB实现
%设原图像为I,偏移量为shiftx和shifty
I = 'H:/coin.jpg'
function autocorcoeficient(I,shiftx,shifty)
A = imread(I);                      %读取图像
[M,N] = size(A);                            %获取图像的宽和高
B = zeros(M+abs(shiftx),N+abs(shifty));     %设置一个偏移矩阵用于计算
A = double(A);                              %转换成double型
B = double(B);                              %转换成double型
if((shiftx>0) & (shifty>0))
    B(1:M,1:N) = A;
end
if((shiftx>0) & (shifty<0))                      %偏移处理，超出范围像素为0
    B(1:M,abs(shifty)+1:abs(shifty)+N) = A;
end
if((shiftx<0) & (shifty>0))                      %偏移处理，超出范围像素为0
    B(abs(shiftx)+1:abs(shiftx)+M,1:N) = A;
end
if((shiftx<0) & (shifty<0))                      %偏移处理，超出范围像素为0
    B(abs(shiftx)+1:abs(shiftx)+M,abs(shifty)+1:abs(shifty)+N) = A;
end
sum1 = 0;                                       %设置分子变量初值
sum2 = 0;                                       %设置分母变量初值
for i=1:M
    for j=1:N
        sum1 = sum1+A(i,j)*B(i,j);              %二重循环累加得到分子
        sum2 = sum2+A(i,j)*A(i,j);              %二重循环累加得到分母
    end
end
c = sum1/sum2;                                  %得到自相关函数
end

