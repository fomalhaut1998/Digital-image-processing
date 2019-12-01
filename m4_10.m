%created by liang
%2019.11.29
%*********
%***

%*///*///
%已知二维矩阵求，图像的二维DWT，并反求f
f = [2 5 5 2;3 3 3 3;3 3 3 3;2 5 5 1];
G = [1 1 1 1;1 1 -1 -1;1 -1 -1 1;1 -1 1 -1];
W = (1/16)*G*f*G

%反求f的程序
G = [1 1 1 1;1 1 -1 -1;1 -1 -1 1;1 -1 1 -1];
f = G*W*G;
f
