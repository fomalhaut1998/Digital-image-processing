%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.7 灰度图像由共生矩阵二次统计量表示的纹理特征计算

for n=1:4
    P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));        %对共生矩阵进行归一化处理
end
A = zeros(1,4);
E = A;I = A;H = A;U = A;                            %能量、对比度、熵和均匀度向量初始化
Ux = A;Uy = A;deltaX = A;deltaY = A;C = A;          %相关向量初始化
for n=1:4
    E(n) = sum(sum(P(:,:,n).^2));                   %计算能量
    for i=1:16
        for j=1:16
            I(n) = I(n)+(i-j)^2*P(i,j,n);               %计算对比度
            if P(i,j,n)~=0
                H(n) = H(n)-P(i,j,n)*log(P(i,j,n));     %计算熵
            end
            U(n) = U(n)+(1/(1+(i-j)^2))*P(i,j,n);       %计算均匀度
            Ux(n) = Ux(n)+i*P(i,j,n);
            Uy(n) = Uy(n)+j*P(i,j,n);
        end
    end
end
for n=1:4
    for i=1:16
        for j=1:16
            deltaX(n) = deltaX(n)+(i-Ux(n))^2*P(i,j,n);
            deltaY(n) = deltaY(n)+(j-Uy(n))^2*P(i,j,n);
            C(n) = C(n)+i*j*P(i,j,n);
        end
    end
    C(n) = (C(n)-Ux(n)*Uy(n))/(deltaX(n)*deltaY(n));        %计算相关性
end
E,I,H,U,C                                                   %显示计算结果