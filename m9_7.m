%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9.8 �ÿռ��˲���-����ƽ�����в�ɫͼ��ƽ���˲�

rgb = imread('H:/coin.jpg');                %��ȡͼ��
fR = rgb(:,:,1);                            %ͼ��ĺ�ɫ����
fG = rgb(:,:,2);                            %ͼ�����ɫ����
fB = rgb(:,:,3);                            %ͼ�����ɫ����
w = fspecial('average');                    %��ֵ�˲�ģ��
fR_filtered = imfilter(fR,w);               %��ͼ���ɫ���������˲�
fG_filtered = imfilter(fG,w);               %��ͼ����ɫ���������˲�
fB_filtered = imfilter(fB,w);               %��ͼ����ɫ���������˲�
rgb_filtered = cat(3,fR_filtered,fG_filtered,fB_filtered);
                                            %���˲��������������ϵõ��µĲ�ɫͼ��
subplot(221),imshow(fR);
subplot(222),imshow(fG);
subplot(223),imshow(fB);
subplot(224),imshow(rgb_filtered);          %��ͼ�������ʾ