%created by liang
%2019.11.30
%*********
%***

%*///*///
%游程编码解码程序
function unzipped = RLEdecode(zip,info)
zip = uint8(zip);               %将游程矩阵转换成整型
[m,n] = size(zip);              %获取游程矩阵的高度和宽度
unzipped = [];                  %解压矩阵初始化
for i=1:m%对游程矩阵的每一行循环处理
    section = repmat(zip(i,1),1,double(zip(i,2)));  %第i行复制还原
    unzipped = [unzippped section];         %与矩阵前面的部分进行拼接
end
unzipped = reshape(unzipped,info.rows,info.cols);       %按原图像形式重新排列