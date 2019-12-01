%created by liang
%2019.11.30
%*********
%***

%*///*///
%游程编码程序

function[zipped,info] = RLEencode(vector);
[M,N] = size(vector);           %获取高度和宽度
vector = uint8(vector(:));      %转换成整型
L = length(vector);             %得到元素个数
c = vector(1);                  %获取第一个像素值
e(1,1) = c;                     %游程矩阵第一列为值
e(1,2) = 0;                     %游程矩阵第二列为游程长度
t1 = 1;                         %游程矩阵下标变量
for j=1:L%对图像所有元素循环处理
    if (vector(j)==c)%如果值不变
        e(t1,2) = double(e(t1,2))+1;    %将游程长度加1
    else%如果长度改变
        c = vector(j);          %记录新的值
        t1 = t1 + 1;            %游程矩阵下标加1
        e(t1,1) = c;            %游程矩阵新一行第一列的值
        e(ti,2) = 1;            %游程矩阵新一行第2列的值（游程长度）
    end
end
zipped = e;                     %游程矩阵
info.rows = m;                  %记录原图像的高度
info.cols = n;                  %记录原图像地宽度
[m.n] = size(e);                %获取游程矩阵的高度和宽度
info.ratio = (info.rows^info.cols)/m*n; %显示压缩比