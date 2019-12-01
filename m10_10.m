%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.12 ��һ��ͼ����м��α任����֤��صĲ�����
I = imread('H:/coin.jpg');          %��ȡͼ��
I2 = imrotate(I,-30,'bilinear');    %��ͼ��˫���Բ�ֵ˳ʱ�뷽����ת30��
I3 = imresize(I,0.5,'bilinear');    %��ͼ��˫���Բ�ֵ����Сһ��
A = double(I);                      %ת����double����
[nc,nr] = size(A);                  %�õ�ͼ��Ŀ�͸�
[x,y] = meshgrid(1:nr,1:nc);        %�õ�x,y������
x = x(:);
y = y(:);
A = A(:);
m.m00 = sum(A);                     %����õ�m00
if m.m00==0
    m.m00 = eps;                    %��ĸΪ0�Ĵ���
end
m.m10 = sum(x.*A);                  %����õ�m10
m.m01 = sum(y.*A);                  %����õ�m01
xmean = m.m10/m.m00;                %��������x������
ymean = m.m01/m.m00;                %��������y������
cm.cm00 = m.m00;
cm.cm02 = (sum((y-ymean).^2.*A))/(m.m00^2);                 %����n02
cm.cm03 = (sum((y-ymean).^3.*A))/(m.m00^2.5);               %����n03
cm.cm11 = (sum((x-xmean).*(y-ymean).*A))/(m.m00^2);         %����n11
cm.cm12 = (sum((x-xmean).*(y-ymean).^2.*A))/(m.m00^2.5);    %����n12
cm.cm20 = (sum((x-xmean).^2.*A))/(m.m00^2);                 %����n20
cm.cm21 = (sum((x-xmean).^2.*(y-ymean).*A))/(m.m00^2.5);    %����n21
cm.cm30 = (sum((x-xmean).^3.*A))/(m.m00^2.5);               %����n30
im1 = cm.cm20+cm.cm02;                              %���㲻��ئ�1
im2 = (cm.cm20-cm.cm02)^2+4*cm.cm11^2;              %���㲻��ئ�2
im3 = (cm.cm30-3*cm.cm12)^2+(3*cm.cm21-cm.cm03)^2;   %���㲻��ئ�3
im4 = (cm.cm30+cm.cm12)^2+(cm.cm21+cm.cm03)^2;      %���㲻��ئ�4
im5 = (cm.cm30-3*cm.cm12)*(cm.cm30+cm.cm12)*((cm.cm30+cm.cm12)^2-...
    3*(cm.cm21+cm.cm03)^2)+(3*cm.cm21-cm.cm03)*(cm.cm21+cm.cm03)*(3*(...
    cm.cm30+cm.cm12)^2-(cm.cm21+cm.cm03)^2);         %���㲻��ئ�5
im6 = (cm.cm20-cm.cm02)*((cm.cm30+cm.cm12)^2-(cm.cm21+cm.cm03)^2)...
    +4*cm.cm11*(cm.cm30+cm.cm12)*(cm.cm21+cm.cm03); %���㲻��ئ�6
im7 = (3*cm.cm21-cm.cm03)*(cm.cm30+cm.cm12)*((cm.cm30+cm.cm12)^2-...
    3*(cm.cm21+cm.cm03)^2)+(3*cm.cm12-cm.cm30)*(cm.cm21+cm.cm03)*(3*(...
    cm.cm30+cm.cm12)^2-(cm.cm21+cm.cm03)^2);         %���㲻��ئ�7