%created by liang
%2019.11.29
%*********
%***

%*///*///
%��֪��ά������ͼ��Ķ�άDWT��������f
f = [2 5 5 2;3 3 3 3;3 3 3 3;2 5 5 1];
G = [1 1 1 1;1 1 -1 -1;1 -1 -1 1;1 -1 1 -1];
W = (1/16)*G*f*G

%����f�ĳ���
G = [1 1 1 1;1 1 -1 -1;1 -1 -1 1;1 -1 1 -1];
f = G*W*G;
f