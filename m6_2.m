%created by liang
%2019.11.29
%*********
%***

%*///*///
%��6.2���ø��־�ֵ�˲����Ը��Ӹ�˹������ͼ������˲�
img = imread('H:/coin.jpg');imshow(img);        %��ʾͼ��
img_noise = double(imnoise(img,'gaussian',0.06));    %��ͼ�񸽼Ӹ�˹����
figure,imshow(img_noise,[]);                    %��ʾ������������ͼ��
img_mean = imfilter(img_noise,fspecial('average',3));
                                                %�Ը����˸�˹������ͼ��ʵ��������ֵ�˲�
figure,imshow(img_mean,[]);                     %��ʾ������ֵ�˲����ͼ��
img_mean = exp(imfilter(log(img_noise),fspecial('average',3)));
                                                %�Ը����и�˹������ͼ��ʵ�м��ξ�ֵ�˲�
figure;imshow(img_mean,[]);                     %��ʾ���ξ�ֵ�˲�֮���ͼ��
Q = 1.5;                                        %�Ը�˹����ͼ��ʵ��Qȡ��������г���˲�
img_mean = imfilter(img_noise.^(Q+1),fspecial('average',3))./imfilter(img_noise.^Q,fspecial('average',3));
figure;imshow(img_mean,[]);                     %��ʾ��г���˲����ͼ��
Q = 1.5;                                        %�Ը�˹����ͼ��ʵ��Qȡ��������г���˲�
img_mean = imfilter(img_noise.^(Q+1),fspecial('average',3))./imfilter(img_noise.^Q,fspecial('average',3));
figure;imshow(img_mean,[]);                     %��ʾ��г���˲����ͼ��