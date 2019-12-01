%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.16 ȷ��ͼ����ʾͼ���е�Բ��Ŀ��
%��ȡͼ��ת��Ϊ��ֵ��ͼ��
RGB = imread('H:/coin.jpg');                %��ȡͼ��
figure;imshow(RGB);                         %��ʾԭͼ��
I = rgb2gray(RGB);                          %ת��Ϊ�Ҷ�ͼ��
threshold = graythresh(I);                  %ȡ��ֵ
bw = im2bw(I,threshold);                    %ת��Ϊ��ֵ��ͼ��
figure;imshow(bw);                          %��ʾ��ֵ��ͼ��

%Ѱ�ұ߽�
bw = bwareaopen(bw,30);                     %ȥ��СĿ��
se = strel('disk',2);                       %Բ�νṹԪ��
bw = imclose(bw,se);                        %�ز���
bw = imfill(bw,'holes');                    %���׶���ͼ��
figure,imshow(bw);
[B,L] = bwboundaries(bw,'noholes');         %ͼ��߽�
figure,imshow(label2rgb(L,@jet,[.5 .5 .5]));%��ͬ��ɫ��ʾ
hold on;
for k = 1:length(B)
    boundary = B(k);                        %��ʾ��ɫ�߽�
    plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
end

%ȷ��Բ��Ŀ��
stats = regionprops(L,'Area','Centroid');   %�����������
threshold = 1.06;                           %�趨�ж���ֵ
for k = 1:length(B)
    boundary = B(k);
    delta_sq = diff(boundary).^2;
    P = sum(sqrt(sum(delta_sq,2)));       %���ܳ�
    A = stats(k).Area;                      %���
    F = (P^2)/(4*pi*A);                     %Բ�ζȵļ���
    F_string = sprintf('%2.2f',F);
    if F<threshold
        centroid = stats(k).Centroid;
        plot(centroid(1),centroid(2),'ko'); %���Բ��
    end
    text(boundary(1,2)-35,boundary(1,1)+13,F_string,'Color',...
        'y','FontSize',14,'FontWeight','bold'); %��עԲ�ζ�
end
