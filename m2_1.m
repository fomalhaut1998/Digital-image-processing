%created by liang
%2019.11.28
%*********
%***
% ��һ��
%ͬʱ�Ա�ͼ����ɫ����
%////////////////////**
colormap(gray);

dark=zeros(256, 256);

dark(64:192,64:192)=0.5;

subplot (1, 3, 1); imshow(dark)

% �ڶ���

 middle(1:256,1:256)=0.7 ;
 middle(64:192,64:192)=0.5;
 subplot(1, 3, 2); imshow(middle)

% ������

 bright=ones(256,256);

 bright(64:192,64:192)=0.5;

 subplot (1, 3, 3); imshow(bright)

