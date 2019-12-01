%created by liang
%2019.11.30
%*********
%***

%*///*///
%例8.4 用人工选择法、OTSU算法以及迭代法求阈值，并对图像进行分割
I = imread('H:/coin.jpg');              %读取图像
[width,height] = size(I);               %获取图像的高度和宽度
figure,imshow(I);                       %显示图像
figure,imhist(I);                       %计算并显示该图像的直方图
T1 = 80                                 %用人工选择法，选择阈值为80
for i=1:width
    for j=1:height
        if(I(i,j)<T1)
            BW1(i,j) = 0;               %用人工选择阈值为80对图像进行分割
        else
            BW1(i,j) = 1;
        end
    end
end
figure,imshow(BW1);                     %显示人工阈值图像的分割结果
T2 = graythresh(I);                     %用Otsu法，通过Matlab函数graythresh选择阈值
BW2 = im2bw(I,T2);                      %用Otsu阈值对图像进行分割
figure,imshow(BW2);                     %显示Otsu法的预制图像的分割结果
f = double(I);                          %用迭代法，求阈值
T = (min(f(:)+max(f(:)))/2);
done = false;
i = 0;
while ~done
    r1 = find(f<=T);
    r2 = find(f>T);
    Tnew = (mean(f(r1))+mean(f(r2)))/2
    done = abs(Tnew-T)<1
    T = Tnew;
    i = i+1;
end
f(r1) = 0;
f(r2) = 1;                              %用迭代法得到的阈值对图像进行分割
figure,imshow(f);                       %显示迭代法阈值图像分割的结果