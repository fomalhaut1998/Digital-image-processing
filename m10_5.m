%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.5  由灰度矩阵计算其共生矩阵
gray = imread('H:/coin.jpg');               %读取图像
[M,N] = size(gray);                         %获取图像的高宽
for i=1:M
    for j=1:N
        for n=1:256/16                      %将图像的灰度级分为16级
            if(gray(i,j)>=(n-1)*16) && (gray(i,j)<=(n-1)*16+15)
                gray(i,j) = n-1;
            end
        end
    end
end
P = zeros(16,16,4);                             %4个16x16的共生居住区初始化
for m=1:15
    for n=1:16
        for i=1:M
            for j=1:N
                if(j<N) && (gray(i,j)==m-1) && (gray(i,j+1)==n-1)
                                                %水平方向
                   P(m,n,1) = P(m,n,1)+1;
                   P(n,m,1) = P(m,n,1);
                end
                if(i>1) && (j<N) && (gray(i,j)==m-1) && (gray(i-1,j+1)==n-1) %45度方向
                    P(m,n,2) = P(m,n,2)+1;
                    P(n,m,2) = P(m,n,2);
                end
                if(i<M) && (gray(i,j)==m-1) && (gray(i+1,j)==n-1)  %垂直方向
                    P(m,n,3) = P(m,n,3)+1;
                    P(n,m,3) = P(m,n,3);
                end
                if(i<M) && (j<N) && (gray(i,j)==m-1) && (gray(i+1,j+1)==n-1)    %135度方向
                    P(m,n,4) = P(m,n,4)+1;
                    P(n,m,4) = P(m,n,4);
                end
            end
        end
        if(m==n)                                    %共生矩阵主对角线上元素
            P(m,n,:) = P(m,n,:)*2;
        end
    end
end
P                                                   %显示计算得到的4个共生矩阵

