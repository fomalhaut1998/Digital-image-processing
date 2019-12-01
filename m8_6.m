%created by liang
%2019.11.30
%*********
%***

%*///*///
%例8.6 区域增长法分割图像
I = imread('H:/coin.jpg');                  %读取图像
if isinteger(i)
    I = imdouble(I);                        %将uint类型转换成double类型
end
figure,imshow(I);                           %显示原图像
[M,N] = size(I);                            %获取图像的大小
[y,x] = getpts;                             %选取种子点
x1 = round(x);                              %横坐标取整
y1 = round(y);                              %纵坐标取整
seed = I(x1,y1);                            %将种子点灰度值存入seed中
J = zeros(M,N);                             %一个全零与原图像等大的图像矩阵J,作为输出图像的矩阵
J(x1,y1) = 1;                               %将J中相应的对应位置的位置元素取为白
sum = seed;                                 %存储符合区域生长条件的点的灰度值和
suit = 1;                                   %存储符合生长区域的点的个数
count = 1;                                  %记录每次判断一点周围八点符合条件的新的点的数目
threshold = 0.15;                           %阈值，注意需要和double类型存储的图像相符合
while count>0
    s = 0;                                  %记录判断一点周围八点时，符合条件的新点的灰度值的和
    count = 0;
    for i=1:M
        for j=1:N
            if J(i,j) == 1                  %判断此点是否为目标点，下面判断该点是否越界
                if (i-1)>0 & (i+1)<(M+1) & (j-1)>0 & (j+1)<(N+1)
                    for u=-1:1
                        for v=-1:1
                            if J(i+u,j+v) == 0 & abs(I(i+u,j+v)-seed)<threshold & 1/(1+1/15*abs(I(i+u,j+v)-seed))>0.8
                                            %判断符合尚未标记，且满足条件的点
                               J(i+u,j+v) = 1;%将满足条件的点其在J中的对应位置值设置为白
                               count = count + 1;
                               s = s+I(i+u,j+v);%此点的灰度值加入s中
                            end
                        end
                    end
                end
            end
        end
    end
    suit = suit+count;                  %将count加入符合点数计数器中
    sum = sum+s;                        %将s加入符合点的灰度值总和中
    seed = sum/suit;                    %计算新的灰度平均值
end
figure,imshow(J);                       %显示区域生长结果图

