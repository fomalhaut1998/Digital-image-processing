%created by liang
%2019.11.30
%*********
%***

%*///*///
%例8.5 用分水岭算法分割图像

f = imread('H:/coin.jpg');                  %读取图像
f = rgb2gray(f);                            %转换成灰度图像
figure(1),imshow(f);                        %显示原读取图像
f = double(f);                              %转换成double类型
hv = fspecial('prewitt');                   %取prewitt模板
hh = hv.';                                  %转置
gv = abs(imfilter(f,hv,'replicate'));       %垂直方向梯度
gh = abs(imfilter(f,hh,'replicate'));       %水平方向梯度
g = sqrt(gv.^2+gh.^2);                      %梯度幅值
L = watershed(g);                           %分水岭处理
wr = L == 0;
figure(2),imshow(wr);                       %显示分水岭结果
f(wr) = 255;                    
figure(3),imshow(uint8(f));                 %显示分水岭结果
rm = imregionalmin(g);                      %得到局部最小值
figure(4),imshow(rm);                       %显示局部最小值
