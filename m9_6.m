%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9.7 ��HSI��ɫ�ռ��ֱ��ͼ���Ȼ�

rgb = imread('H:/coin.jpg');rgb1 = im2double(rgb );
r = rgb1(:,:,1);g = rgb1(:,:,2);b = rgb1(:,:,3);
                                        %�ֱ�õ�RGB��������
I1 = (r+g+b)/3;                         %����HSIģ�͵�I����
tmp1 = min(min(r,g),b);                 %����R��G��B�е���Сֵ
tmp2 = r+g+b;
tmp2(tmp2==0) = eps;                        %�������Ϊ0
S = 1-3.*tmp1./tmp2;                      %����HSIģ����S����
tmp1 = 0.5*((r-g)+(r-b));
tmp2 = sqrt((r-g).^2+(r-b).*(g-b));
theta = acos(tmp1./(tmp2+eps));             %�����
H1 = theta;
H1(b>g) = 2*pi-H1(b>g);
H1 = H1/(2*pi);                         %����HSIģ���е�H����
H1(S==0) = 0;
I = histeq(I1);                         %��HSIģ�͵�I�ֲ����о��⻯
hsi = cat(3,H1,S,I);                    %�õ�I������HSIͼ��
H = hsi(:,:,1)*2*pi;                    %�õ������HSIͼ���H����
S = hsi(:,:,2);                         %�õ������HSIͼ���S����
I = hsi(:,:,3);                         %�õ������HSIͼ���I����
R = zeros(size(hsi,1),size(hsi,2));     %HSIת����RGB��R������ֵ
G = zeros(size(hsi,1),size(hsi,2));     %HSIת����RGB��G������ֵ
B = zeros(size(hsi,1),size(hsi,2));     %HSIת����RGB��B������ֵ
ind = find((H>0) & (H<2*pi/3));         %��H��[0,2��/3]֮��
B(ind) = I(ind).*(1.0-S(ind));          %����B����
R(ind) = I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind))); %����R����
G(ind) = 3.0-(R(ind)+B(ind));           %����G����
ind = find((H>2*pi/3) & (H<4*pi/3));    %��h��[2��/3,4��/3]֮��
H(ind) = H(ind)-pi*2/3;
R(ind) = I(ind).*(1.0-S(ind));           %����R����
G(ind) = I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind))); %����G����
B(ind) = 3.0-(R(ind)+G(ind));           %����B����
ind = find((H>=4*pi/3) & (H<2*pi));    %��h��[4��/3,2��]֮��
H(ind) = H(ind)-pi*4/3;
G(ind) = I(ind).*(1.0-S(ind));           %����G����
B(ind) = I(ind).*(1.0+S(ind).*cos(H(ind))./cos(pi/3.0-H(ind))); %����B����
R(ind) = 3.0-(G(ind)+B(ind));           %����R����
RGB = cat(3,R,G,B);                     %�õ�������ʾ��RGBͼ��
figure,imshow(H1);                      %��ʾH����ͼ��
figure,imshow(I1);                      %��ʾI����ͼ��
figure,imshow(I);                      %��ʾIi�������⻯���ͼ��
figure,imshow(S);                      %��ʾS����ͼ��
figure,imshow(rgb);                      %��ʾRGBͼ��
figure,imshow(RGB);                      %��ʾ���⻯���RGBͼ��
