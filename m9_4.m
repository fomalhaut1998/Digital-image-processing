%created by liang
%2019.12.1
%*********
%***

%*///*///
%��9.4 ���õ��͵Ĵ��ݺ���ʵ�ֻҶȼ�����ɫͼ��ı任����
I = imread('H:/coin.jpg');          %��ȡͼ��
I = double(I);                      %ת����duoble�ͱ��ڼ���
[m,n] = size(I);                    %�õ�ͼ��ĸ߿�
L = 256;
for i=1:m
    for j=1:n
        if I(i,j)<L/4               %����ѭ�������Ҷ�ֵI<L/4ʱ
            R(i,j) = 0;             %R = 0
            G(i,j) = 4*I(i,j);      %G = 4*I
            B(i,j) = L;             %B = L
        else if I(i,j)<=L/1         %��(L/4)<=I<=(L/2)ʱ
                R(i,j) = 0;         %R = 0
                G(i,j) = L;         %G = L
                B(i,j) = -4*I(i,j)+2*L; %B = (-4)*I+2*L
            else if I(i,j)<=3*L/4       %��(L/2)<I<=(3L/4)ʱ
                R(i,j) = -4*I(i,j)+2*L; %R = (-4)*I+2*L 
                G(i,j) = L;             %G = L
                B(i,j) = 0;             %B = 0 
                else                    %��I>(3L/4)ʱ
                    R(i,j) = L;             %R = L
                    G(i,j) = -4*I(i,j)+2*L; %G = (-4)*I+2*L 
                    B(i,j) = 0;             %B = 0 
                end
            end
        end
    end
end
for i=1:m
    for j=1:n                        %����ѭ������ÿ���㸳ֵ
        G2C(i,j,1) = R(i,j);        %��R��ֵ��ΪG2C�ĵ�һ������       
        G2C(i,j,2) = G(i,j);        %��G��ֵ��ΪG2C�ĵڶ������� 
        G2C(i,j,3) = B(i,j);        %��B��ֵ��ΪG2C�ĵ��������� 
    end
end
G2C = G2C/256;                      %ֵ��һ��
figure,imshow(G2C);                 %��ʾ�任�õ��Ĳ�ɫͼ��
