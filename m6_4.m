%created by liang
%2019.11.29
%*********
%***

%*///*///
%��6.5���ô����˲�����������������
I = imread('H:/coin.jpg');          %��ȡͼ��
I = rgb2gray(I);                    %ת���ɻҶ�ͼ��
[M,N] = size(I);                    %�õ�ͼ��ĸ߶ȺͿ��
P = I;
for i=1:M
    for j=1:N
        P(i,j) = P(i,j)+20*sin(20*I)+20*sin(20*j);%�����������
    end
end
figure;imshow(I);                  %��ʾԭʼͼ��
figure;imshow(P);                  %��ʾ��������ͼ��
IF = fftshift(fft2(I));            %��ͼ��������Ҷ�任������ԭ���ƶ�������
IFV = log(1+abs(IF));              %ԭͼ���Ƶ��
PF = fftshift(fft2(P));            %�Լ�����ͼ��������Ҷ�任������ԭ���ƶ�������
PFV = log(1+abs(PF));              %������ͼ���Ƶ��
figure;imshow(IFV,[]);             %��ʾԭͼ���Ƶ��
figure;imshow(PFV,[]);             %��ʾ����ͼ���Ƶ��
freq = 50;                         %���ô����˲���������Ƶ��
width = 5;                         %���ô����˲�����Ƶ�����
ff = ones(M,N);                    
for i=1:M
    for j=1:N
        ff(i,j) = 1-exp(-0.5*((((i-M/2)^2+(j-N/2)^2)-freq^2)/(sqrt(i.^2+j.^2)*width))^2);
                                                                    %��ͨ�����˲���
    end
end
figure;imshow(ff,[]);                   %��ʾ���˹�����˲���
out = PF.*ff;                           %������ʵ��Ƶ���˲�
out = ifftshift(out);                   %ԭ���ƻ����Ͻ�
out = ifft2(out);                       %����Ҷ��任
out = abs(out);                         %ȡ����ֵ
out = out/max(out(:));                  %��һ��
figure;imshow(out,[]);                  %��ʾ�˲����