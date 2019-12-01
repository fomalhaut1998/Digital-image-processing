%created by liang
%2019.12.1
%*********
%***

%*///*///
%例9.4 采用典型的传递函数实现灰度级到彩色图像的变换处理
I = imread('H:/coin.jpg');          %读取图像
I = double(I);                      %转换成duoble型便于计算
[m,n] = size(I);                    %得到图像的高宽
L = 256;
for i=1:m
    for j=1:n
        if I(i,j)<L/4               %二重循环，当灰度值I<L/4时
            R(i,j) = 0;             %R = 0
            G(i,j) = 4*I(i,j);      %G = 4*I
            B(i,j) = L;             %B = L
        else if I(i,j)<=L/1         %当(L/4)<=I<=(L/2)时
                R(i,j) = 0;         %R = 0
                G(i,j) = L;         %G = L
                B(i,j) = -4*I(i,j)+2*L; %B = (-4)*I+2*L
            else if I(i,j)<=3*L/4       %当(L/2)<I<=(3L/4)时
                R(i,j) = -4*I(i,j)+2*L; %R = (-4)*I+2*L 
                G(i,j) = L;             %G = L
                B(i,j) = 0;             %B = 0 
                else                    %当I>(3L/4)时
                    R(i,j) = L;             %R = L
                    G(i,j) = -4*I(i,j)+2*L; %G = (-4)*I+2*L 
                    B(i,j) = 0;             %B = 0 
                end
            end
        end
    end
end
for i=1:m
    for j=1:n                        %二重循环，对每个点赋值
        G2C(i,j,1) = R(i,j);        %将R的值作为G2C的第一个分量       
        G2C(i,j,2) = G(i,j);        %将G的值作为G2C的第二个分量 
        G2C(i,j,3) = B(i,j);        %将B的值作为G2C的第三个分量 
    end
end
G2C = G2C/256;                      %值归一化
figure,imshow(G2C);                 %显示变换得到的彩色图像
