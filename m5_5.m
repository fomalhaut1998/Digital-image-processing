%created by liang
%2019.11.29
%*********
%***

%*///*///
%����һ����СΪ128x128����ֹƵ��Ϊ15�������˲���
for u=1:128
    for v=1:128
        if sqrt((u-64)^2+(v-64)^2)<=15
            H(u,v) = 1;
        else
            H(u,v) = 0;
        end;
    end;
end;
imshow(H);[u,v] = freqspace(128,'meshgrid');
figure,mesh(u,v,H);
