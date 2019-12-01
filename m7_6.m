%created by liang
%2019.11.30
%*********
%***

%*///*///
%��7.6 ��ͼ�����һ��Ԥ�����

X = imread('H:/coin.jpg');          %װ��ͼ��
figure(1);imshow(X);                %��ʾԭͼ��
if (ndims(X)>2)                     %���ڷǻҶ�ͼ����Ҫת���ɻҶ�ͼ��
    X = rgb2gray(X)
end
X = double(X);                      %ת����double��
Y = LPCencode(X);                   %����LPCencode������������Ԥ�����
XX = LPCdecode(Y);                  %����LPCdecode������������Ԥ�����
figure(2);imshow(mat2gray(255-Y));  %Ϊ�˱��ڹ۲죬��ͼ��ת��ʾ
e = double(X) - double(XX);         %����ԭͼ�����������ͼ��Ĳ���
[m,n] = size(e);
erms = sqrt(sum(e(:).^2)/(m*n));      %�����������
figure();
[h,x] = hist(X(:));                 %�õ�ԭͼ���ֱ��ͼ
subplot(121);bar(x,h,'k');          %��ʾԭͼ���ֱ��ͼ
[h,x] = hist(Y(:));                 %�õ�Ԥ������ֱ��ͼ
subplot(122);bar(x,h,'k');          %��ʾԤ������ֱ��ͼ

%���뺯��LPCencode
%��һά����Ԥ�����ѹ��ͼ��x��fΪԤ��ϵ����Ĭ��ֵΪ1��ΪǰԤ��ֵ
function y = LPCencode(x,f)         %������뺯��
error = (nargchk(1,2,nargin));      %�����ú����Ĳ������������Ǳ���
if nargin<2
    f = 1;                          %�����ú����Ĳ���<2��ʱ f = 1
end
x = double(x);                      %��xת����double��
[m,n] = size(x);                    %��ȡx�ĸ߿�
p = zeros(m,n);                     %���ô��Ԥ��ֵ�ľ��󣬳�ʼֵΪ0
xs = x;                            %������Ҫ���м�������
zc = zeros(m,1);                    %һ��0ֵ��������
for j=1:length(f)
    xs = [zc xs(:,1:end-1)];        %����Ԥ�����
    p = p+f(j)*xs;                  %��x�ĵ�i-1�е�ֵ��Ϊx�ĵ�i�е�Ԥ��ֵ
end
y = x - round(p);                   %����ԭֵ��Ԥ��ֵ�Ĳ�ֵ
end

%���뺯��LPCdecode
%��ǰ��ͬ��һ��Ԥ���������ǰ�߽��н���
function x = LPCdecode(y,f)         %������뺯��
error(nargchk(1,2,nargin));         %�����ò�����������ʱ����
if nargin<2
    f = 1;                          %�����õĲ�������<2ʱ��f = 1
end
f = f(end:-1:1);
[m,n] = size(y);                    %�õ�y�ĸ߶ȺͿ��
order = length(f);                  %�õ�f��Ԫ�ظ���
f = repmat(f,m,1);
x = zeros(m,n+order);               %����һ���ϴ�����ڽ���ľ��󣬳�ֵΪ0
for j=1:n
    jj = j+order;
    x(:,jj) = y(:,j)+round(sum(f(:,order:-1:1).*x(:,(jj-1):-1:(jj-order)),2));
                                    %�������ڽ���ľ���
end
x = x(:,order+1:end);               %�õ��������
end