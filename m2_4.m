%created by liang
%2019.11.28
%*********
%***
%��ȡ��ͨ����RGB����
clear
[x,map] = imread('H:/coin.jpg');
y = x(90:95,90:95);
imshow(y);
R = x(90:95, 90:95,1);
G = x(90:95, 90:95,2);
B = x(90:95, 90:95,3);
R,G,B