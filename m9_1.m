%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9.1 ����һ��ͼ�����ϽǺ�ɫ�����½���ɫ�����Ͻ�Ϊ��ɫ�����½�Ϊ��ɫ
clear
rgb_R = zeros(128,128);             %����һ��128x128���������ΪR����
rgb_R(1:64,1:64) = 1;            %���Ͻǵ�64x64����Ϊ1
rgb_G = zeros(128,128);             %����һ��128x128���������ΪG����
rgb_G(1:64,65:128) = 1;          %���Ͻǵ�64x64����Ϊ1
rgb_B = zeros(128,128);             %����һ��128x128���������ΪB����
rgb_B(65:128,1:64) = 1;          %���½ǵ�64x64����Ϊ1
rgb = cat(3,rgb_R,rgb_G,rgb_B);       %ʹ��cat�����������������
figure,imshow(rgb),title('RGB��ɫͼ��');