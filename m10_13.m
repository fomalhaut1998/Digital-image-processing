%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.16 确定图中所示图像中的圆形目标
%读取图像并转化为二值化图像
RGB = imread('H:/coin.jpg');                %读取图像
figure;imshow(RGB);                         %显示原图像
I = rgb2gray(RGB);                          %转换为灰度图像
threshold = graythresh(I);                  %取阈值
bw = im2bw(I,threshold);                    %转化为二值化图像
figure;imshow(bw);                          %显示二值化图像

%寻找边界
bw = bwareaopen(bw,30);                     %去除小目标
se = strel('disk',2);                       %圆形结构元素
bw = imclose(bw,se);                        %关操作
bw = imfill(bw,'holes');                    %填充孔洞的图像
figure,imshow(bw);
[B,L] = bwboundaries(bw,'noholes');         %图像边界
figure,imshow(label2rgb(L,@jet,[.5 .5 .5]));%不同颜色显示
hold on;
for k = 1:length(B)
    boundary = B(k);                        %显示白色边界
    plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
end

%确定圆形目标
stats = regionprops(L,'Area','Centroid');   %求面积和重心
threshold = 1.06;                           %设定判定阈值
for k = 1:length(B)
    boundary = B(k);
    delta_sq = diff(boundary).^2;
    P = sum(sqrt(sum(delta_sq,2)));       %求周长
    A = stats(k).Area;                      %面积
    F = (P^2)/(4*pi*A);                     %圆形度的计算
    F_string = sprintf('%2.2f',F);
    if F<threshold
        centroid = stats(k).Centroid;
        plot(centroid(1),centroid(2),'ko'); %标记圆心
    end
    text(boundary(1,2)-35,boundary(1,1)+13,F_string,'Color',...
        'y','FontSize',14,'FontWeight','bold'); %标注圆形度
end
