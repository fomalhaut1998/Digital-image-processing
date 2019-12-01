%created by liang
%2019.11.28
%*********
%***
% 第一块
%同时对比图像颜色程序
%////////////////////**
colormap(gray);

dark=zeros(256, 256);

dark(64:192,64:192)=0.5;

subplot (1, 3, 1); imshow(dark)

% 第二块

 middle(1:256,1:256)=0.7 ;
 middle(64:192,64:192)=0.5;
 subplot(1, 3, 2); imshow(middle)

% 第三块

 bright=ones(256,256);

 bright(64:192,64:192)=0.5;

 subplot (1, 3, 3); imshow(bright)

