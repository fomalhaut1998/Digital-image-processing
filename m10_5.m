%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.5  �ɻҶȾ�������乲������
gray = imread('H:/coin.jpg');               %��ȡͼ��
[M,N] = size(gray);                         %��ȡͼ��ĸ߿�
for i=1:M
    for j=1:N
        for n=1:256/16                      %��ͼ��ĻҶȼ���Ϊ16��
            if(gray(i,j)>=(n-1)*16) && (gray(i,j)<=(n-1)*16+15)
                gray(i,j) = n-1;
            end
        end
    end
end
P = zeros(16,16,4);                             %4��16x16�Ĺ�����ס����ʼ��
for m=1:15
    for n=1:16
        for i=1:M
            for j=1:N
                if(j<N) && (gray(i,j)==m-1) && (gray(i,j+1)==n-1)
                                                %ˮƽ����
                   P(m,n,1) = P(m,n,1)+1;
                   P(n,m,1) = P(m,n,1);
                end
                if(i>1) && (j<N) && (gray(i,j)==m-1) && (gray(i-1,j+1)==n-1) %45�ȷ���
                    P(m,n,2) = P(m,n,2)+1;
                    P(n,m,2) = P(m,n,2);
                end
                if(i<M) && (gray(i,j)==m-1) && (gray(i+1,j)==n-1)  %��ֱ����
                    P(m,n,3) = P(m,n,3)+1;
                    P(n,m,3) = P(m,n,3);
                end
                if(i<M) && (j<N) && (gray(i,j)==m-1) && (gray(i+1,j+1)==n-1)    %135�ȷ���
                    P(m,n,4) = P(m,n,4)+1;
                    P(n,m,4) = P(m,n,4);
                end
            end
        end
        if(m==n)                                    %�����������Խ�����Ԫ��
            P(m,n,:) = P(m,n,:)*2;
        end
    end
end
P                                                   %��ʾ����õ���4����������

