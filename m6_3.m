%created by liang
%2019.11.29
%*********
%***

%*///*///
%6.4���ñ�׼�ľ�ֵ����ֵ�˲����Ը��������������ͼ������˲�
img = rgb2gray(imread('H:/coin.jpg'));      %��ȡͼ��ת��Ϊ�Ҷ�ͼ��
figure;imshow(img);                         %��ʾͼ��
img_noise = double(imnoise(img,'salt & pepper',0.06));      %���Ͻ�������
figure;imshow(img_noise,[]);                    %��ʾ�����˽����������ͼ��
img_mean = imfilter(img_noise,fspecial('average',5));   %�Ը����н���������ͼ��ʵ��������ֵ�˲�
figure;imshow(img_mean,[]);                    %��ʾ������ֵ�˲����ͼ��
img_median = medfilt2(img_noise);               %�Ը����н���������ͼ��ʵ����ֵ�˲�
figure;imshow(img_median,[]);                   %��ʾ��ֵ�˲����ͼ��
img_median2 = medfilt2(img_median);             %����ֵ�˲����ͼ���ٽ�����ֵ�˲�
figure;imshow(img_median2,[]);                  %��ʾ�ٴ���ֵ�˲����ͼ��
