%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.14 对10幅人脸图像组成进行主成分描述

for i=1:10
    filename = [strcat('face',int2str(i),'.bmp')];  %循环得到文件名
    temp = imread(filename);                        %循环读取图像1文件
    X(:,:,i) = temp;                                %将数据存入X
    figure,imshow(X(:,:,i));                        %显示每幅图像
    vector(:,1) = temp(:);                          %将数据存入vector
end
vector = double(vector);                            %转换成double型
[coeff,score,latent] = princomp(vector);            %调用函数princomp
Z = temp;
for i=1:10
    Z(:) = score(:,i);                              %将每个score赋予Z
    figure,imshow(Z,[]);                            %显示每个投影score
end
latent;                                             %显示重要程度值
