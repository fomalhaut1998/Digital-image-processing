%created by liang
%2019.11.30
%*********
%***

%*///*///
%��8.5 �÷�ˮ���㷨�ָ�ͼ��

f = imread('H:/coin.jpg');                  %��ȡͼ��
f = rgb2gray(f);                            %ת���ɻҶ�ͼ��
figure(1),imshow(f);                        %��ʾԭ��ȡͼ��
f = double(f);                              %ת����double����
hv = fspecial('prewitt');                   %ȡprewittģ��
hh = hv.';                                  %ת��
gv = abs(imfilter(f,hv,'replicate'));       %��ֱ�����ݶ�
gh = abs(imfilter(f,hh,'replicate'));       %ˮƽ�����ݶ�
g = sqrt(gv.^2+gh.^2);                      %�ݶȷ�ֵ
L = watershed(g);                           %��ˮ�봦��
wr = L == 0;
figure(2),imshow(wr);                       %��ʾ��ˮ����
f(wr) = 255;                    
figure(3),imshow(uint8(f));                 %��ʾ��ˮ����
rm = imregionalmin(g);                      %�õ��ֲ���Сֵ
figure(4),imshow(rm);                       %��ʾ�ֲ���Сֵ
