%created by liang
%2019.11.30
%*********
%***

%*///*///
%��8.4 ���˹�ѡ�񷨡�OTSU�㷨�Լ�����������ֵ������ͼ����зָ�
I = imread('H:/coin.jpg');              %��ȡͼ��
[width,height] = size(I);               %��ȡͼ��ĸ߶ȺͿ��
figure,imshow(I);                       %��ʾͼ��
figure,imhist(I);                       %���㲢��ʾ��ͼ���ֱ��ͼ
T1 = 80                                 %���˹�ѡ�񷨣�ѡ����ֵΪ80
for i=1:width
    for j=1:height
        if(I(i,j)<T1)
            BW1(i,j) = 0;               %���˹�ѡ����ֵΪ80��ͼ����зָ�
        else
            BW1(i,j) = 1;
        end
    end
end
figure,imshow(BW1);                     %��ʾ�˹���ֵͼ��ķָ���
T2 = graythresh(I);                     %��Otsu����ͨ��Matlab����graythreshѡ����ֵ
BW2 = im2bw(I,T2);                      %��Otsu��ֵ��ͼ����зָ�
figure,imshow(BW2);                     %��ʾOtsu����Ԥ��ͼ��ķָ���
f = double(I);                          %�õ�����������ֵ
T = (min(f(:)+max(f(:)))/2);
done = false;
i = 0;
while ~done
    r1 = find(f<=T);
    r2 = find(f>T);
    Tnew = (mean(f(r1))+mean(f(r2)))/2
    done = abs(Tnew-T)<1
    T = Tnew;
    i = i+1;
end
f(r1) = 0;
f(r2) = 1;                              %�õ������õ�����ֵ��ͼ����зָ�
figure,imshow(f);                       %��ʾ��������ֵͼ��ָ�Ľ��