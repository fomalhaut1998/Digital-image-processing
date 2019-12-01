%created by liang
%2019.11.30
%*********
%***

%*///*///
%��6.8 ���˶�ģ���˻��Ҽ�������ͼ��������˲���ά���˲���ԭ

I = imread('H:/coin.jpg');          %��ȡͼ��
figure;imshow(I,[]);                %��ʾԭͼ��
PSF = fspecial('motion',25,11);         %�˶�ģ���������˶�λ����25���أ��Ƕ���11
Blurred = imfilter(I,PSF,'conv','circular');        %��ͼ���˶�ģ������
Noise = 0.1*randn(size(I));                 %��̬�ֲ����������
BlurredNoise = imadd(Blurred,im2uint8(Noise));%���˻����ͼ����и�������
figure(2);imshow(BlurredNoise,[]);          %��ʾ�˶�ģ���Ҽ��������ͼ��
WI1 = deconvwnr(BlurredNoise,PSF);          %����������ά���˲���ԭ
figure(3);imshow(WI1,[]);                   %��ʾ���˲��Ľ��
NSR = sum(Noise(:).^2/sum(im2double(I(:)).^2));%���������
WI2 = deconvwnr(BlurredNoise,PSF,NSR);      %������Ȳ�����ά���˲�
figure(4);imshow(WI2,[]);                   %��ʾ������Ȳ���ά���˲��Ľ��
NP = abs(ifftn(Noise)).^2;                      
NCORR = real(ifftn(NP));                    %��������������غ���
IP = abs(fftn(im2double(I))).^2;
ICORR = real(ifftn(IP));                      %�����źŵ�����غ���
WI3 = deconvwnr(BlurredNoise,PSF,NCORR,ICORR);
                                                %������غ�����ά���˲���ԭ
figure(5);imshow(WI3,[]);                                                       