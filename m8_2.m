%created by liang
%2019.11.30
%*********
%***

%*///*///
%例8.2 Hough变换直线检测

I = imread('H:/coin.jpg');                  %读取图像
I= rgb2gray(I);                             %转换为灰度图像
rotI = imrotate(I,33,'crop');               %原图像旋转33度
BW = edge(rotI,'log');                      %log算子边缘检测
[H,T,R] = hough(BW);                        %对边缘图进行Hough变换
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2));y=R(P(:,1));                  %找出线段
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure,imshow(rotI);                        %显示旋转后的图像
hold on;
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];%找出线段的起始点
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
                                           %按不同颜色画出线段
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end