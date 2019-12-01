%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9.2 ��һ����ɫͼ���RGB�ռ�ת����HSI�ռ�
rgb = imread('H:/coin.jpg');        %����RGB��ɫͼ��
rgb = im2double(rgb);                %Ϊ�˷�����㣬����ת��Ϊdouble����
r = rgb(:,:,1);                     %�õ�ͼ���R����
g = rgb(:,:,2);                     %�õ�ͼ���G����
b = rgb(:,:,3);                     %�õ�ͼ���B����
I = (r+g+b)/3;                      %����õ�I�ķ���
tmp1 = min(min(r,g),b);             %����R��G��B����Сֵ
tmp2 = r+g+b;
tmp2(tmp2==0) = eps;             %�������Ϊ0
S = 1-3.*tmp1./tmp2;                %����õ�S����
tmp1 = 0.5*((r-g)+(r-b));
tmp2 = sqrt((r-g).^2+(r-b).*(g-b));
theta = acos(tmp1./(tmp2+eps));     %����õ���
H = theta;
H(b>g) = 2*pi - H(b>g);             %����õ�H����
H = H/(2*pi);                       
H(S==0) = 0;                        %��SΪ0ʱHҲȡ0
hsi = cat(3,H,S,I);                 %������������ϵõ�HSIͼ��
figure,imshow(rgb);                 %��ʾrgb
figure,imshow(H);                   %��ʾH
figure,imshow(S);                   %��ʾS
figure,imshow(I);                   %��ʾI