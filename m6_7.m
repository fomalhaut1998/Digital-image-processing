%created by liang
%2019.11.30
%*********
%***

%*///*///
%��6.9 ͼ��ķ���任

f = imread('H:/coin.jpg');              %��ȡͼ��
figure(1);imshow(f);                    %��ʾԭͼ��
k = 0.7;                                %�任����ϵ��
theta = pi/6;                           %�任��ת�Ƕ�
T = [k*cos(theta) k*sin(theta) 0
    -k*sin(theta) k*cos(theta) 0
    0 0 1];                             %�任����
tform1 = maketform('affine',T);         %���α任�ṹ
g1 = imtransform(f,tform1,'nearest');       %�Խ��ڲ�ֵ���з���任
figure(2);imshow(g1);                   %��ʾ�任���
g2 = imtransform(f,tform1,'bilinear');      %��˫���Բ�ֵ���з���任
figure(3),imshow(g2);                   %��ʾ�任���
