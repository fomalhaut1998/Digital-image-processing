%created by liang
%2019.11.30
%*********
%***

%*///*///
%�γ̱���������
function unzipped = RLEdecode(zip,info)
zip = uint8(zip);               %���γ̾���ת��������
[m,n] = size(zip);              %��ȡ�γ̾���ĸ߶ȺͿ��
unzipped = [];                  %��ѹ�����ʼ��
for i=1:m%���γ̾����ÿһ��ѭ������
    section = repmat(zip(i,1),1,double(zip(i,2)));  %��i�и��ƻ�ԭ
    unzipped = [unzippped section];         %�����ǰ��Ĳ��ֽ���ƴ��
end
unzipped = reshape(unzipped,info.rows,info.cols);       %��ԭͼ����ʽ��������