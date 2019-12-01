%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.17 �˶�Ŀ��������ȡ

%��ȡ��Ƶ�ļ�
disp('input video');                %��ʾ��ʾ��Ϣ
video = VideoReader('H:/aviboat2.mp4');%��ȡ��Ƶ�ļ�
get(video);                         %��ȡ��Ƶ��Ϣ
disp('output video');               %��ʾ��ʾ��Ϣ
implay('H:/aviboat2.mp4');             %������Ƶ
detecting(video);                   %�����˶�Ŀ���⺯��

%�˶�Ŀ�����
background = rgb2gray(read(video,1));    %����һ֡��Ϊ����
choosedframe = rgb2gray(read(video,400));%ȡ��400֡Ϊ��ǰ֡
dtarget = abs(background-choosedframe);  %������
bw = im2bw(dtarget,0.1);                    %���ͼ���ֵ��
cc = bwlabel(bw);                           %�Զ�ֵ��ͼ����ͨ����
stats = regionprops(cc,'Area');             %������������
idxx = find([stats.Area]>800);              %ȡ�������300���ص�����
bw2 = ismember(cc,idx);
se = strel('disk',5);                       %ȡ�뾶Ϊ5��Բ�νṹԪ��
bw3 = bw2;
for i=1:3
    bw3 = imdilate(bw3,se);                 %�ýṹԪ�ض��������3������
    bw3 = imerode(bw3,se);                  %�ýṹԪ�ض��������3�θ�ʴ
end
figure,imshow(read(video,1));               %��ʾ����֡
figure,imshow(read(video),400);             %��ʾ��ǰ֡
figure,imshow(dtarget);                     %��ʾ���ͼ��
figure,imshow(bw);                          %��ʾ��ֵ�����ͼ��
figure,imshow(bw2);                         %��ʾȥ��СĿ��������
figure,imshow(bw3);                         %��ʾ3�����͡���ʴ��Ľ��

%Ŀ��������������
dd = bwlabel(bw3);                          %�Դ�����ͼ������ͨ������
stats2 = regionprops(dd,'Area','Centroid'); %����Ŀ����������
stats2.Area;                                %��ʾĿ���������
stats2.Centroid;                            %��ʾĿ��������������