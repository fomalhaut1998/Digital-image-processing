%created by liang
%2019.11.30
%*********
%***

%*///*///
%DCtͼ��ѹ������
I = imread('H:/coin.jpg');          %��ȡͼ��
I = im2double(I);                   %ת����double��
T = dctmtx(8);                      %��ɢ���ұ任����
B = replace(blockproc(I,[8,8],'P1*x*P2',T,T'));%��ͼ��ֿ����DCT�任
mask = [1 1 1 1 0 0 0 0 
        1 1 1 0 0 0 0 0 
        1 1 0 0 0 0 0 0 
        1 0 0 0 0 0 0 0 
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 
        0 0 0 0 0 0 0 0];             %����ģ�����
B2 = replace(blockproc(B,[8,8],'P1.*x',mask)); %����ѹ�����������½ǵĸ�Ƶ����
I2 = replace(blockproc(B2,[8,8],'P1*x*P2',T',T));%����DCT���任���õ�ѹ�����ͼ��
figure,imshow(I);                       %��ʾԭͼ��
figure,imshow(I2);                      %��ʾ����DCTѹ������ѹ���ͼ��