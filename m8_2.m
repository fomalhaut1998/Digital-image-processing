%created by liang
%2019.11.30
%*********
%***

%*///*///
%��8.2 Hough�任ֱ�߼��

I = imread('H:/coin.jpg');                  %��ȡͼ��
I= rgb2gray(I);                             %ת��Ϊ�Ҷ�ͼ��
rotI = imrotate(I,33,'crop');               %ԭͼ����ת33��
BW = edge(rotI,'log');                      %log���ӱ�Ե���
[H,T,R] = hough(BW);                        %�Ա�Եͼ����Hough�任
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2));y=R(P(:,1));                  %�ҳ��߶�
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure,imshow(rotI);                        %��ʾ��ת���ͼ��
hold on;
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];%�ҳ��߶ε���ʼ��
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
                                           %����ͬ��ɫ�����߶�
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end