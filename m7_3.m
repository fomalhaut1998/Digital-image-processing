%created by liang
%2019.11.30
%*********
%***

%*///*///
%��7.4 ���γ̱���Զ�ֵ��ͼ����б���

I = imread('H:/coin.jpg');          %��ȡͼ��
if ndims(I)>2                   %�Էǵ�ͨ����ͼ��ת���ɻҶ�ͼ��
    I = rgb2gray(I);
end
BW = im2bw(I,0.4);                  %��ͼ����ж�ֵ��
[zipped,info] = RLEencode(BW);      %����RLEencode������BW�����γ̱���
unzipped = RLEdecode(zipped,info);      %����RLEdecode������zipped�����γ̱���
subplot(131);imshow(I);                 %��ʾԭͼ��
subplot(132);imshow(BW);                %��ʾ��ֵ��ͼ��
subplot(133);imshow(uint8(unzipped)*255);   %��ʾ��ֵ��������ͼ��
cr = info.ratio;                            %��ʾѹ����
whos BW unzipped zipped;                    %��ʾ��ֵ��ͼ��ѹ����ѹͼ��ѹ��ͼ�����Ϣ