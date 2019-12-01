%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9-10 ��ɫͼ����
%ʹ�þ����Laplacian�˲�ģ��ֱ��ÿ������ͼ�������

rgb = imread('H:/coin.jpg');            %��ȡͼ��
fR = rgb(:,:,1);                            %ͼ��ĺ�ɫ����
fG = rgb(:,:,2);                            %ͼ�����ɫ����
fB = rgb(:,:,3);                            %ͼ�����ɫ����
lapMatrix = [1 1 1;1 -8 1;1 1 1];           %Laplacian�˲�ģ��
fR_tmp = imfilter(fR,lapMatrix,'replicate');%��ͼ���ɫ�������˲�
fG_tmp = imfilter(fG,lapMatrix,'replicate');%��ͼ����ɫ�������˲�
fB_tmp = imfilter(fB,lapMatrix,'replicate');%��ͼ����ɫ�������˲�
rgb_tmp = cat(3,fR_tmp,fG_tmp,fB_tmp);      %�˲������������
rgb_sharped = imsubtract(rgb,rgb_tmp);      %ԭͼ������ͼ��Ĳ�
figure(1),imshow(rgb_tmp),title('�˲���ͼ��');
figure(2),imshow(rgb_sharped),title('�˲�ͼ����ԭͼ��֮��');
