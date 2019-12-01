%created by liang
%2019.11.29
%*********
%***

%*///*///
%产生一个大小为128x128，截止频率为15的理想滤波器
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
