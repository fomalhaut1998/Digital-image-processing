%created by liang
%2019.12.1
%*********
%***

%*///*///
%��10.8 ��������ͼ����MATLAB��̼���ͼ�������Ƶ������

I1 = imread('H:/coin.jpg');                 %��ȡһ��ͼ��
s = fftshift(fft2(I1));                     %���и���Ҷ�任����ԭ��������������
s = abs(s);                                 %�õ���ֵ
[nc,nr] = size(s);                          %�õ�ͼ��ĸ߿�
x0 = floor(nc/2+1);                         %�õ��������ĵ�x����
y0 = floor(nc/2+1);                         %�õ��������ĵ�y����
figure,imshow(I);                           %��ʾԭͼ��
figure,imshow(mat2gray(log(1+s)));          %��ʾͼ���Ƶ�׷�ֵ
rmax = floor(min(nc,nr)/2-1);               %�õ�srad�����ֵrmax
srad = zeros(1,rmax);                       %��ʼ��srad
srad(1) = s(x0,y0);                         %���ĵ�ķ�ֵ
thetha = 91:270;                            %ȡһ���Ƕȷ�Χ����Բ
for r = 2:rmax
    [x,y] = pol2cart(thetha,r);             %�õ�������
    x = round(x)'+x0;
    y = round(y);+y0;
    for j=1:length(x)                       %��͵õ�S(r)
        srad(r) = sum(s(sub2ind(size(s),x,y)));
    end
end
figure,plot(srad);                          %����Ƶ������ͼS��(r)
[x,y] = pol2cart(thetha,rmax);              %��rȡrmaxʱ�õ�������
x = round(x)'+x0;
y = round(y)'+y0;
sang = zeros(1,length(x));                  %��ʼ��sang
for th=1:length(x)
    vx = abs(x(th)-x0);
    vy = abs(y(th)-y0);
    if((vx==0) & (vy==0))
        xr = x0;yr = y0;
    else
        m = (y(th)-y0)/(x(th)-x0);
        xr = (x0:x(th)).';
        yr = round(y0+m*(xr-x0));
    end
    for j=1:length(xr)                      %����õ�S(��)
        sang(th) = sum(s(sub2ind(size(s),xr,yr)));
    end
end
figure,plot(sang);                          %����Ƶ������ͼSr(��)
