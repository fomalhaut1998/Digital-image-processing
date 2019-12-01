%created by liang
%2019.12.1
%*********
%***

%*///*///
%例10.17 运动目标特征提取

%读取视频文件
disp('input video');                %显示提示信息
video = VideoReader('H:/aviboat2.mp4');%读取视频文件
get(video);                         %获取视频信息
disp('output video');               %显示提示信息
implay('H:/aviboat2.mp4');             %播放视频
detecting(video);                   %调用运动目标检测函数

%运动目标测量
background = rgb2gray(read(video,1));    %将第一帧作为背景
choosedframe = rgb2gray(read(video,400));%取第400帧为当前帧
dtarget = abs(background-choosedframe);  %计算差分
bw = im2bw(dtarget,0.1);                    %差分图像二值化
cc = bwlabel(bw);                           %对二值化图像连通域标记
stats = regionprops(cc,'Area');             %计算各区域面积
idxx = find([stats.Area]>800);              %取面积大于300像素的区域
bw2 = ismember(cc,idx);
se = strel('disk',5);                       %取半径为5的圆形结构元素
bw3 = bw2;
for i=1:3
    bw3 = imdilate(bw3,se);                 %用结构元素对区域进行3次膨胀
    bw3 = imerode(bw3,se);                  %用结构元素对区域进行3次腐蚀
end
figure,imshow(read(video,1));               %显示背景帧
figure,imshow(read(video),400);             %显示当前帧
figure,imshow(dtarget);                     %显示差分图像
figure,imshow(bw);                          %显示二值化后的图像
figure,imshow(bw2);                         %显示去除小目标后的区域
figure,imshow(bw3);                         %显示3次膨胀、腐蚀后的结果

%目标区域特征计算
dd = bwlabel(bw3);                          %对处理后的图像作连通区域标记
stats2 = regionprops(dd,'Area','Centroid'); %计算目标区域特征
stats2.Area;                                %显示目标区域面积
stats2.Centroid;                            %显示目标区域重心坐标