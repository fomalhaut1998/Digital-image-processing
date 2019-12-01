%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.7 �Ҷ�ͼ���ɹ����������ͳ������ʾ��������������

for n=1:4
    P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));        %�Թ���������й�һ������
end
A = zeros(1,4);
E = A;I = A;H = A;U = A;                            %�������Աȶȡ��غ;��ȶ�������ʼ��
Ux = A;Uy = A;deltaX = A;deltaY = A;C = A;          %���������ʼ��
for n=1:4
    E(n) = sum(sum(P(:,:,n).^2));                   %��������
    for i=1:16
        for j=1:16
            I(n) = I(n)+(i-j)^2*P(i,j,n);               %����Աȶ�
            if P(i,j,n)~=0
                H(n) = H(n)-P(i,j,n)*log(P(i,j,n));     %������
            end
            U(n) = U(n)+(1/(1+(i-j)^2))*P(i,j,n);       %������ȶ�
            Ux(n) = Ux(n)+i*P(i,j,n);
            Uy(n) = Uy(n)+j*P(i,j,n);
        end
    end
end
for n=1:4
    for i=1:16
        for j=1:16
            deltaX(n) = deltaX(n)+(i-Ux(n))^2*P(i,j,n);
            deltaY(n) = deltaY(n)+(j-Uy(n))^2*P(i,j,n);
            C(n) = C(n)+i*j*P(i,j,n);
        end
    end
    C(n) = (C(n)-Ux(n)*Uy(n))/(deltaX(n)*deltaY(n));        %���������
end
E,I,H,U,C                                                   %��ʾ������