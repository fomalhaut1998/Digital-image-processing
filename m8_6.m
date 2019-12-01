%created by liang
%2019.11.30
%*********
%***

%*///*///
%��8.6 �����������ָ�ͼ��
I = imread('H:/coin.jpg');                  %��ȡͼ��
if isinteger(i)
    I = imdouble(I);                        %��uint����ת����double����
end
figure,imshow(I);                           %��ʾԭͼ��
[M,N] = size(I);                            %��ȡͼ��Ĵ�С
[y,x] = getpts;                             %ѡȡ���ӵ�
x1 = round(x);                              %������ȡ��
y1 = round(y);                              %������ȡ��
seed = I(x1,y1);                            %�����ӵ�Ҷ�ֵ����seed��
J = zeros(M,N);                             %һ��ȫ����ԭͼ��ȴ��ͼ�����J,��Ϊ���ͼ��ľ���
J(x1,y1) = 1;                               %��J����Ӧ�Ķ�Ӧλ�õ�λ��Ԫ��ȡΪ��
sum = seed;                                 %�洢�����������������ĵ�ĻҶ�ֵ��
suit = 1;                                   %�洢������������ĵ�ĸ���
count = 1;                                  %��¼ÿ���ж�һ����Χ�˵�����������µĵ����Ŀ
threshold = 0.15;                           %��ֵ��ע����Ҫ��double���ʹ洢��ͼ�������
while count>0
    s = 0;                                  %��¼�ж�һ����Χ�˵�ʱ�������������µ�ĻҶ�ֵ�ĺ�
    count = 0;
    for i=1:M
        for j=1:N
            if J(i,j) == 1                  %�жϴ˵��Ƿ�ΪĿ��㣬�����жϸõ��Ƿ�Խ��
                if (i-1)>0 & (i+1)<(M+1) & (j-1)>0 & (j+1)<(N+1)
                    for u=-1:1
                        for v=-1:1
                            if J(i+u,j+v) == 0 & abs(I(i+u,j+v)-seed)<threshold & 1/(1+1/15*abs(I(i+u,j+v)-seed))>0.8
                                            %�жϷ�����δ��ǣ������������ĵ�
                               J(i+u,j+v) = 1;%�����������ĵ�����J�еĶ�Ӧλ��ֵ����Ϊ��
                               count = count + 1;
                               s = s+I(i+u,j+v);%�˵�ĻҶ�ֵ����s��
                            end
                        end
                    end
                end
            end
        end
    end
    suit = suit+count;                  %��count������ϵ�����������
    sum = sum+s;                        %��s������ϵ�ĻҶ�ֵ�ܺ���
    seed = sum/suit;                    %�����µĻҶ�ƽ��ֵ
end
figure,imshow(J);                       %��ʾ�����������ͼ

