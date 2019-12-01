%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.15����ѩ��ͼ����ѩ����С�ֲ����

%��ȡͼ����ǿ
I = imread('H:/snow.jpg');               %��ȡͼ��
I = rgb2gray(I);
figure,imshow(I);                           %��ʾԭͼ��
claheI = adapthisteq(I,'NumTiles',[10 10]); %����Ӧ�����Աȶ�
claheI = imadjust(claheI);                  %���ȵ���
figure,imshow(claheI);                      %��ʾ��ǿ���ͼ��

%��������ȴ�С������ķֲ�
for counter = 0:22
    remain = imopen(claheI,strel('disk',counter));%������
    intensity_area(counter + 1) = sum(remain(:));   %ʣ������ֵ
end
figure;
plot(intensity_area,'m - *');               %��ʾ��ͬ�뾶�������ʣ������غ�
grid on;

%���㲻ͬ�뾶�µĿ����ȷֲ�
intensity_area_prime = diff(intensity_area);%���
figure;
plot(intensity_area_prime,'m - *');         %��ʾÿ���뾶�µĿ����ȶ���
grid on;
title('Granulometry (Size Distribution) of Snowflakes');
set(gca,'xtick',[0 2 4 6 8 10 12 14 16 18 20 22]);
xlabel('radius of snowflakes (pixels)');
ylabel('Sum of pixel values in snowflakes as function of radius');
open5 = imopen(claheI,strel('disk',5));         %�뾶Ϊ5����̬ѧ������
open6 = imopen(claheI,strel('disk',6));         %�뾶Ϊ6����̬ѧ������
rad5 = imsubtract(open5,open6);                 %�뾶Ϊ5�Ŀ�����
figure;imshow(rad5,[]);                         %��ʾ�뾶Ϊ5�µ�ͼ���п����ȵķֲ����
