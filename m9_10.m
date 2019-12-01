%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9.14�����ݶȱ�Ե���

rgb = imread('H:/coin.jpg');            %��ȡͼ��
sob = fspecial('sobel');                %�õ�sobel����ģ��
Rx = imfilter(double(rgb(:,:,1)),sob,'replicate');
                                        %�Ժ�ɫ��������x����sobel�����˲�
Ry = imfilter(double(rgb(:,:,1)),sob,'replicate');
                                        %�Ժ�ɫ��������y����sobel�����˲�
Gx = imfilter(double(rgb(:,:,2)),sob,'replicate');
                                        %����ɫ��������x����sobel�����˲�
Gy = imfilter(double(rgb(:,:,2)),sob,'replicate');
                                        %����ɫ��������y����sobel�����˲�
Bx = imfilter(double(rgb(:,:,3)),sob,'replicate');
                                        %����ɫ��������x����sobel�����˲�
By = imfilter(double(rgb(:,:,3)),sob,'replicate');
                                        %����ɫ��������y����sobel�����˲�
r_gradiant = mat2gray(max(Rx,Ry));      %�õ���ɫ����������ݶ�ֵͼ��
g_gradiant = mat2gray(max(Gx,Gy));      %�õ���ɫ����������ݶ�ֵͼ��
b_gradiant = mat2gray(max(Bx,By));      %�õ���ɫ����������ݶ�ֵͼ��
rgb_gradiant = rgb2gray(cat(3,r_gradiant,g_gradiant,b_gradiant));
                                        %��3�������ݶ�ͼ��ϳ�
gxx = Rx.^2+Gx.^2+Bx.^2;                %����u��ģ
gyy = Ry.^2+Gy.^2+By.^2;                %����v��ģ
gxy = Rx.*Ry+Gx.*Gy+Bx.*By;             %����u��v�ĵ��
theta = 0.5*(atan(2*gxy./(gxx-gyy+eps)));%����仯�����ķ���
G1 = 0.5*((gxx+gyy)+(gxx-gyy).*cos(2*theta)+2*gxy.*sin(2*theta));
                                         %����仯��������ϵ��ݶȵķ�ֵ
theta = theta+pi/2;                     %����tan�����������ԣ���ת90���ٴμ���
G2 = 0.5*((gxx+gyy)+(gxx-gyy).*cos(2*theta)+2*gxy.*sin(2*theta));
                                         %����仯��������ϵ��ݶȵķ�ֵ
G1 = G1.^0.5;
G2 = G2.^0.5;
rgb_vectorgradiant = mat2gray(max(G1,G2));%ȡ������ֵ�����ֵ
diff = abs(rgb_vectorgradiant-rgb_gradiant);%������ַ����õ����ݶ�ֵ֮��
figure,imshow(rgb);                         %��ʾԭͼ��
figure,imshow(r_gradiant);                  %��ʾ��ɫ������Եͼ��
figure,imshow(g_gradiant);                  %��ʾ��ɫ������Եͼ��
figure,imshow(b_gradiant);                  %��ʾ��ɫ������Եͼ��
figure,imshow(rgb_gradiant);                %��ʾ��������Ե�ϳɵı�Եͼ��
figure,imshow(rgb_vectorgradiant);          %��ʾ������������õ��ı�Եͼ��
figure,imshow(diff);                        %��ʾ���ֱ�Եͼ֮��
