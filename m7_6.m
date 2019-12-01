%created by liang
%2019.11.30
%*********
%***

%*///*///
%例7.6 对图像进行一阶预测编码

X = imread('H:/coin.jpg');          %装入图像
figure(1);imshow(X);                %显示原图像
if (ndims(X)>2)                     %对于非灰度图像，需要转换成灰度图像
    X = rgb2gray(X)
end
X = double(X);                      %转换成double型
Y = LPCencode(X);                   %调用LPCencode函数进行线性预测编码
XX = LPCdecode(Y);                  %调用LPCdecode函数进行线性预测解码
figure(2);imshow(mat2gray(255-Y));  %为了便于观察，将图像反转显示
e = double(X) - double(XX);         %计算原图像与编码解码后图像的差异
[m,n] = size(e);
erms = sqrt(sum(e(:).^2)/(m*n));      %计算均方根差
figure();
[h,x] = hist(X(:));                 %得到原图像的直方图
subplot(121);bar(x,h,'k');          %显示原图像的直方图
[h,x] = hist(Y(:));                 %得到预测误差的直方图
subplot(122);bar(x,h,'k');          %显示预测误差的直方图

%编码函数LPCencode
%用一维线性预测编码压缩图像x，f为预测系数，默认值为1，为前预测值
function y = LPCencode(x,f)         %定义编码函数
error = (nargchk(1,2,nargin));      %当调用函数的参数个数不对是报错
if nargin<2
    f = 1;                          %当调用函数的参数<2个时 f = 1
end
x = double(x);                      %将x转换成double型
[m,n] = size(x);                    %获取x的高宽
p = zeros(m,n);                     %设置存放预测值的矩阵，初始值为0
xs = x;                            %计算需要的中间矩阵变量
zc = zeros(m,1);                    %一个0值的列向量
for j=1:length(f)
    xs = [zc xs(:,1:end-1)];        %构造预测矩阵
    p = p+f(j)*xs;                  %将x的第i-1列的值作为x的第i列的预测值
end
y = x - round(p);                   %计算原值与预测值的差值
end

%解码函数LPCdecode
%与前者同用一个预测器，针对前者进行解码
function x = LPCdecode(y,f)         %定义解码函数
error(nargchk(1,2,nargin));         %当调用参数个数不对时出错
if nargin<2
    f = 1;                          %当调用的参数个数<2时，f = 1
end
f = f(end:-1:1);
[m,n] = size(y);                    %得到y的高度和宽度
order = length(f);                  %得到f的元素个数
f = repmat(f,m,1);
x = zeros(m,n+order);               %定义一个较大的用于解码的矩阵，初值为0
for j=1:n
    jj = j+order;
    x(:,jj) = y(:,j)+round(sum(f(:,order:-1:1).*x(:,(jj-1):-1:(jj-order)),2));
                                    %计算用于解码的矩阵
end
x = x(:,order+1:end);               %得到解码矩阵
end