%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.14 ��10������ͼ����ɽ������ɷ�����

for i=1:10
    filename = [strcat('face',int2str(i),'.bmp')];  %ѭ���õ��ļ���
    temp = imread(filename);                        %ѭ����ȡͼ��1�ļ�
    X(:,:,i) = temp;                                %�����ݴ���X
    figure,imshow(X(:,:,i));                        %��ʾÿ��ͼ��
    vector(:,1) = temp(:);                          %�����ݴ���vector
end
vector = double(vector);                            %ת����double��
[coeff,score,latent] = princomp(vector);            %���ú���princomp
Z = temp;
for i=1:10
    Z(:) = score(:,i);                              %��ÿ��score����Z
    figure,imshow(Z,[]);                            %��ʾÿ��ͶӰscore
end
latent;                                             %��ʾ��Ҫ�̶�ֵ
